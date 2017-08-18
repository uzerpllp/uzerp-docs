# Report Writer

The uzERP report writer uses views or tables created in the Reports schema of the database in use. These tables or views can then be used to build end user reports without any particular knowledge of the underlying databse structure or SQL.

## Views

By default, views in the public schema are not surfaced in the uzERP Report Writer. If you want to use a standard view in the reporting module then set up a new view under the reports schema - the example below takes the standard GL transactions view and makes it available for reporting

```sql
	CREATE OR REPLACE VIEW reports.my_gl_transactions AS 
	SELECT id, docref, usercompanyid, glaccount_id, glcentre_id, glperiods_id, 
	       trandate, source, "comment", reference, twincurrency_id, twinrate, 
	       "type", twinvalue, "value", account, cost_centre, glperiod, twincurrency, 
	       year_period
	  FROM gltransactionsoverview;
```

You can of course omit columns or add `WHERE` clauses to pare the data down. 

Using this technique you can create custom views from any data in the system - as long as the view is in the reports schema then it will be available for reporting. It also means that one underlying view or table can be used to drive many end user reports.

##  Building a basic report 

To add a basic report go to Reporting -> Reports -> Add Report. 

There are three panes:

1.  Report Options - this allows for the selection of the base view/table and report name. It shows a list of columns available based on the view/table selected from the drop down.

2.  Report Builder - columns are dragged here to build up the report. The order of the columns here determine the order of the output within the report.

3.  Properties - when a selected column is double clicked the properties for that column are shown and can be changed

