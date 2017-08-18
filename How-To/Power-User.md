# Power User/Developer

<<NeedsReview()>>

This section is for those of you who want to get more from uzERP by writing custom SQL for reports etc or playing with uzLETS.

<span class="attention warning">
[Here be Dragons](http://en.wikipedia.org/wiki/Here_be_dragons) - some of this stuff is pretty `toxic` if used incorrectly and could cause tears before bedtime. If things go wrong, you're on your own... you have been warned!!
</span>

## How do I...?

### Find the GL period of a transaction given its date?
So you have a transaction, say an invoice or stock movement, with a date and you'd like to sort it by GL period to line up with the accounting periods rather than its calendar month. Here's how for sales invoices:

```sql
	SELECT invoice_number, invoice_date, year, period
	  FROM gl_periods p, si_header i
	  WHERE p.enddate = ( SELECT min(enddate)
	                      FROM gl_periods z
	                     WHERE z.period `<>` 0 z.enddate >= i.invoice_date
	                       AND p.usercompanyid = z.usercompanyid)
	  ORDER BY invoice_number
```

##  Set up a view for use in Reporting? 

By default, views in the public schema are not surfaced in the uzERP Report Writer. If you want to use a standard view for reporting then set up a new view under the reports schema - the example below takes the standard GL transactions view and makes it available for reporting

```sql
	CREATE OR REPLACE VIEW reports.my_gl_transactions AS 
	SELECT id, docref, usercompanyid, glaccount_id, glcentre_id, glperiods_id, 
	       trandate, source, "comment", reference, twincurrency_id, twinrate, 
	       "type", twinvalue, "value", account, cost_centre, glperiod, twincurrency, 
	       year_period
	  FROM gltransactionsoverview;
```

You can of course omit columns or add WHERE clauses to pare the data down. 

Use this technique to create custom views from any data in the system - as long as the view is in the reports schema then it will be available for reporting.

### PostgreSQL date sorting?

This looks a bit complicated, but the date_part - date_part('year', 
invoice_date)||to_char(date_part('month', invoice_date),'FM09') - could 
be encapsulated in a pgsql function.

```sql
	select date_part('year', invoice_date)||to_char(date_part('month', 
	invoice_date),'FM09') as inv_year_month,
	   case when date_part('year', current_date)||to_char(date_part('month', 
	current_date),'FM09')=date_part('year', 
	invoice_date)||to_char(date_part('month', invoice_date),'FM09')
	        then 'current = '||net_value
	        when date_part('year', current_date - interval '1 
	month')||to_char(date_part('month', current_date - interval '1 
	month'),'FM09')=date_part('year', 
	invoice_date)||to_char(date_part('month', invoice_date),'FM09')
	        then '1 Month = '||net_value
	        when date_part('year', current_date - interval '2 
	month')||to_char(date_part('month', current_date - interval '2 
	month'),'FM09')=date_part('year', 
	invoice_date)||to_char(date_part('month', invoice_date),'FM09')
	        then '2 Month = '||net_value
	   end
	   from si_header;
```

Checking the the date function, it does handle the differing day 
lengths in months, as follows:-

```sql
	select date_part('year', timestamp 
	'2011-01-04')||to_char(date_part('month', timestamp '2011-01-04'),'FM09')
	      , date_part('year', timestamp '2011-03-31'- interval '1 
	month')||to_char(date_part('month', timestamp '2011-03-31'- interval '1 
	month'),'FM09')
	      , date_part('year', timestamp '2011-04-01'- interval '1 
	month')||to_char(date_part('month', timestamp '2011-04-01'- interval '1 
	month'),'FM09');
	
	In the above, taking one month off 31/03/2011 gives 201102; taking one 
	month off 01/04/2011 gives 201103; i.e. it works on months not days.
	
	select date_part('year', current_date)||to_char(date_part('month', 
	current_date),'FM09')
	      , date_part('year', current_date - interval '1 
	month')||to_char(date_part('month', current_date - interval '1 
	month'),'FM09')
	      , date_part('year', current_date - interval '2 
	month')||to_char(date_part('month', current_date - interval '2 
	month'),'FM09')
	      , date_part('year', current_date - interval '3 
	month')||to_char(date_part('month', current_date - interval '3 
	month'),'FM09')
	      , date_part('year', current_date - interval '4 
	month')||to_char(date_part('month', current_date - interval '4 
	month'),'FM09')
	      , date_part('year', current_date - interval '5 
	month')||to_char(date_part('month', current_date - interval '5 
	month'),'FM09')
	      , date_part('year', current_date - interval '6 
	month')||to_char(date_part('month', current_date - interval '6 
	month'),'FM09')
	      , date_part('year', current_date - interval '7 
	month')||to_char(date_part('month', current_date - interval '7 
	month'),'FM09')
	      , date_part('year', current_date - interval '8 
	month')||to_char(date_part('month', current_date - interval '8 
	month'),'FM09')
	      , date_part('year', current_date - interval '9 
	month')||to_char(date_part('month', current_date - interval '9 
	month'),'FM09')
	      , date_part('year', current_date - interval '10 
	month')||to_char(date_part('month', current_date - interval '10 
	month'),'FM09')
	      , date_part('year', current_date - interval '11 
	month')||to_char(date_part('month', current_date - interval '11 
	month'),'FM09');
```

### Put transactions into time buckets ?

This applies in something like an aged debt report (shown below) and uses some of the techniques highlighted above:

```sql
	SELECT 
	  sltransactionsoverview.customer, 
	  sltransactionsoverview.transaction_date, 
	  sltransactionsoverview.id, sltransactionsoverview.transaction_type, sltransactionsoverview.our_reference, sltransactionsoverview.ext_reference, 
	  sltransactionsoverview.gross_value, 
	  sltransactionsoverview.currency, 
	  sltransactionsoverview.rate, sltransactionsoverview.description, sltransactionsoverview.payment_terms,
	        CASE
	            WHEN to_char(sltransactionsoverview.transaction_date::timestamp with time zone, 'YYYYMM'::text) = to_char('now'::text::date::timestamp with time zone, 'YYYYMM'::text) 
	            THEN sltransactionsoverview.gross_value
	            ELSE 0::numeric
	        END AS current_gross, 
	        CASE
	            WHEN to_char(sltransactionsoverview.transaction_date::timestamp with time zone, 'YYYYMM'::text) = to_char('now'::text::date - '1 mon'::interval, 'YYYYMM'::text) 
	            THEN sltransactionsoverview.gross_value
	            ELSE 0::numeric
	        END AS m1_gross, 
	        CASE
	            WHEN to_char(sltransactionsoverview.transaction_date::timestamp with time zone, 'YYYYMM'::text) = to_char('now'::text::date - '2 mons'::interval, 'YYYYMM'::text) 
	            THEN sltransactionsoverview.gross_value
	            ELSE 0::numeric
	        END AS m2_gross, 
	        CASE
	            WHEN to_char(sltransactionsoverview.transaction_date::timestamp with time zone, 'YYYYMM'::text) = to_char('now'::text::date - '3 mons'::interval, 'YYYYMM'::text) 
	            THEN sltransactionsoverview.gross_value
	            ELSE 0::numeric
	        END AS m3_gross, 
	        CASE
	            WHEN to_char(sltransactionsoverview.transaction_date::timestamp with time zone, 'YYYYMM'::text) = to_char('now'::text::date - '4 mons'::interval, 'YYYYMM'::text) 
	            THEN sltransactionsoverview.gross_value
	            ELSE 0::numeric
	        END AS m4_gross, 
	        CASE
	            WHEN to_char(sltransactionsoverview.transaction_date::timestamp with time zone, 'YYYYMM'::text) <= to_char('now'::text::date - '5 mons'::interval, 'YYYYMM'::text) 
	            THEN sltransactionsoverview.gross_value
	            ELSE 0::numeric
	        END AS m5_gross
	   FROM sltransactionsoverview
	   LEFT JOIN slmaster_overview ON sltransactionsoverview.slmaster_id = slmaster_overview.id
	   LEFT JOIN companyoverview ON slmaster_overview.company_id = companyoverview.id
	   LEFT JOIN countries ON companyoverview.countrycode = countries.code
	  WHERE sltransactionsoverview.status::text `<>` 'P'::text
	  ORDER BY sltransactionsoverview.customer, sltransactionsoverview.transaction_date, sltransactionsoverview.id;
```