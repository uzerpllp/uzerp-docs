+++
title = "Sales Ledger"
+++

The uzERP Sales Ledger allows you to create and maintain information about your customers. Invoices are entered in the [Sales Invoice Register](Sales Invoice Register) system when you sell goods and services and cash receipts and other credit transactions can be allocated against the invoices.

The Sales Ledger is an open item system which means that the invoices remain outstanding until they are removed by having credit items (cash, Credit Notes) allocated to them. Postings are made to the General Ledger and the Tax system automatically.

Tips and tricks for Sales Ledger are [here](slhowto).

## Customers

The customer is the basic unit within the Sales Ledger to which all other pieces of data are related. All transactions are entered against a customer.

Basic Information:


*  Name * - the customer's name is selected from the [accounts](accounts) which have not already been allocated as a sales ledger customer;

*  Statement - a boolean (Yes/No) to determine if a statement is produced for this customer;

*  Currency - the currency of the account;

*  Bank Account - the bank account the customer normally pays into;

*  Credit Limit * - a credit limit which can be used for credit control purposes;

*  Payment Term * - the payment terms agreed with this customer which will be used to calculate due dates on invoices;

*  Payment Type * - how this customer will normally pay;

*  So Price Type - the price type, if allocated, dictates the price used during [Sales Order Processing](sales_order_processing);

*  Tax Status * - determines if tax (VAT) should be charged to this customer and if the customer is included in EU Intrastat reports

*  Despatch From - which warehouse this customer's goods are normally sent from

*  Sl Analysis - 

*  Invoice Method - 

*  Email Invoice -

*  Email Statement -

*  EDI information -

Items marked * are mandatory.

## Journals

##  Receipts and Allocation


## Customer Discounts

The customer discount matrix allows individual discount percentages to be allocated by product group. These discounts are then applied during [Sales Order Processing](sales_order_processing).

## Credit Control
