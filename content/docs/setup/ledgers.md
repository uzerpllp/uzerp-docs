---
title: "Financial Ledgers"
description: "Configure uzERP's integrated accounting to suite your needs"
weight: 20
---

## Introduction
If you decide to use any of the Logistics or Accounting functionality then various options within Ledger setup need to be activated. As with any large system uzERP is flexible and a certain amount of pre-planning and testing will be necessary to get the system working how you would like. The order in which you do things in the set up phase is quite important and this document follows the order that you should use when setting up the ledgers part of the system.

The "Starter" database is a working system and has the options outlined already populated - you can then change these to suit.

## General Ledger

{{% alert title="Note" color="info" %}}
Before setting up any codes it is a good idea to design your chart of accounts structure to give the analysis you require. uzERP supports several levels of analysis for general ledger transactions, including cost centres.
{{% /alert %}}

### GL Summary and Analysis Codes (Optional)

GL Summary and Analysis codes allow for the grouping of entries and balances within the General Ledger for reporting purposes. The structure of these codes is a one to many relationship between the three tables such that one GL Summary code relates to many GL Analysis codes.... and one GL Analysis code relates to many GL account codes. In this way the grouping can lend itself to any number of user defined reporting formats.


{{% alert title="Tip" %}}
Although not strictly necessary, as you can go back later and amend the GL account codes within the Chart of Accounts, it is recommended that the Summary and Analysis codes are set up the **before** the chart of accounts to make input easier.
{{% /alert %}}

*  GL Summary Codes - used to analyse accounting data at the highest level, these can be grouped together for the highest level analysis

*  GL Analysis Codes - a lower level analysis of GL balances for reporting
Check out the sample data at [http://demo.uzerp.com](http://demo.uzerp.com) to get some ideas.

### GL Account Codes - The Chart of Accounts

GL Account codes represent the chart of accounts for the system. Codes are split between Balance Sheet and Proft & Loss account and certain balance sheet codes will be be designated control accounts. If a GL Account code is designated as a control account, manual General Ledger Journal postings to this code are not allowed as ALL of the postings will be coming from a subsidiary ledger (Purchase Ledger, Sales Ledger, Cash Book) or process such as VAT processing.

{{% alert title="Warning" %}}
The system **requires** the following GL Account codes to be set up to function correctly:
{{% /alert %}}

#### Balance sheet codes

*  Retained profits
*  Purchase ledger control
*  Sales Ledger control
*  VAT input tax control
*  VAT output tax control
*  VAT control
*  VAT EU/Intrastat control
*  At least code to represent a bank account

### Profit and Loss

*  A code for writing off currency differences

You are free to choose the nomenclature for the codes but they must exist and be unique and **ALL**, with the exception of retained profits and the currency differences code, should be set up as balance sheet control accounts.

All other GL Account codes are optional and should be set up in line with the chart of accounts you require. The GL Summary and Analysis codes help to analyse costs and balances in the ledger.

## GL Cost Centres

Cost centres are used for further analysis of entries in the General ledger. For example a departmental analysis of costs and revenue could be produced by allocating entries against the relevant costs centres and GL account codes. 

{{% alert title="Warning" %}}
Although this sort of analysis is optional, uzERP **requires** at least one GL Cost Centre code. This code will then be used as the default balance sheet and P&L account code for all entries in the system.
{{% /alert %}}

When entering a GL cost centre you need to specify the GL account codes that are valid for that GL cost centre. This will then limit the choices offered when making entries to the system so that only costs and revenue types expected are logged against the relevant GL cost centres. If using only one cost centre then make sure all codes are valid for that centre otherwise you will not be able to enter transactions correctly.

## GL Periods

Each transaction within the General Ledger is allocated to a period based on the date of the transaction. The period set up is completely flexible in that the system can cope with any number of periods within the accounting year, for example 12 monthly periods, 13 four-weekly periods, or 4 quarterly periods. 

When first setting up the system it is recommended that the periods that represent the first year are entered - from there on the system will always keep 12 future periods available. When setting up the periods you should also indicate which VAT period the transactions relate to - normally these will be quarterly periods.

## Currencies

There must be at least one currency for the system to function properly - this is known as the base currency. In addition the system will allow you to set up any currency you trade in and enter a conversion rate with the base currency. The fields for currency entry are:


*  Currency  - short code for the currency that appears in dropdowns - e.g. USD
*  Description - long description e.g. US Dollar
*  Symbol - the currency symbol for invoices etc e.g. $
*  Decdesc - the description of the decimal e.g. cent	
*  Rate - the rate with respect to the base currency (obviously 1 for the base currency)
*  Writeoff Glmaster - where currency write offs are posted in the GL transactions table
*  Revalue Glmaster - where currency revaluations are posted in the GL transactions table
*  Glcentre - the gl centre code for write offs and revaluations
*  Datectrl - if this currency is subject to date control (this feature not yet implemented and will be ignored)
*  Method - how to convert between base and this currency, i.e. divide or multiply.

## GL Parameters

The General Ledger parameter section specify how the system works, and provides defaults for background processing.

*  Balance Sheet Cost Centre – the default GL cost centre used in posting control accounts
*  Base Currency – company base currency
*  Number of periods in year – determines which period close triggers a year end
*  Number of weeks in year – used in asset register to calculate depreciation (not yet implemented)
*  P&L Account Centre – default GL cost centre for P&L account transactions
*  Purchase Ledger Control Account 
*  Retained Profits Account
*  Sales Ledger Control Account
*  Twin Currency – usually the Euro in the Eurozone. If twin currency not required set to the same as base currency 
*  VAT Control Account – used to prepare the VAT return and make VAT payments
*  VAT Input – where VAT outputs should be posted
*  VAT Output – where VAT inputs should be posted
*  VAT EU acquisitions – if you want to report EU tax correctly this needs to be set up in the chart of accounts

## Cash Book

### Bank Accounts

For the system to function correctly there must be at least one bank account on the system. Each individual bank account must be allocated to a unique GL account code and this must already exist, and be set as a control account, before the bank account can be set up. 

The bank accounts can be denominated in any currency that is used by the system, which obviously need to be in place before any other details can be entered.

The following information is required on entry

*  Name - this is a mandatory field and is shown in all drop down boxes where a bank account entry is required 
*  Description - optional but concatenated in drop down boxes with name
*  Bank Account Name
*  Bank Name
*  Bank Sort Code
*  Bank Account Number
*  Bank Address
*  Bank Iban Number
*  Bank Bic Code
*  Currency - this is a mandatory field
*  GL Account - this is a mandatory field
*  Cost Centre - this is a mandatory field
*  Statement Balance - this is a mandatory field
*  Statement Page - this is a mandatory field

The balance field should be left at zero on entry.

### Payment Types

At least one payment type is required - this is the transfer type for making transfers between accounts - in the default set up this will already be in the table. Other payment types can be entered as required. 

There is the option enter a payment method against a payment type - this is used in the purchase ledger the determine the action to be taken when making a payment for a supplier who has this payment type set. At present there are two actions:

*  Cheque Print
*  BACS

If no method is set the type can still be used in purchase ledger but no automatic action will be taken.

In sales ledger the payment type has no effect beyond identifying the source of a receipt for reporting purposes.

## Payment Terms

Payments terms are used in the sales and purchasing systems to determine when transactions are due for payment and whether discount should be applied.


*  Description - for example 30 Days from Date of Invoice
*  Basis - the basis of calculation of the due date either by reference to the Invoice date or Month end date
*  Days - the number of days from the base day
*  Months - the month end used in the base day
*  Discount - a percentage which is used in Sales Ledger to calculate the settlement discount applicable to the transaction
    
Each Customer or Supplier is allocated a payment term from this list.

**Examples:**

Description | Basis | Days | Months | Discount
---- | ----   | ---- | ---- | ----
45 Days from Invoice Date                            | Invoice | 45   | 0      | 0
End of Month following Invoice Date                  | Month   | 0    | 1      | 0
End of Invoice Month plus 75 days with 2.5% Discount | Month   | 75   | 0      | 2.50
End of Month 2 following Invoice Date                | Month   | 0    | 2      | 0

## Periodic Payments

Periodic payments can be used for standing orders, direct debits or items such as wages payments. The information required is as follows:

*  Source *
*  Company
*  Person
*  Bank Account *
*  Currency *
*  Payment Type *
*  Tax Rate
*  Frequency *
*  Account
*  Centre
*  Description
*  Ext Reference *
*  Start Date *
*  End Date
*  Occurs
*  Net Value
*  Tax Value
*  Gross Value
*  Variable
*  Write Variance

## Tax

uzERP is designed around the requirements of the UK VAT system and tries to cater for this as much as possible through flexible tax periods, multiple product VAT rates and statuses for trading partners.

{{% alert title="Warning" %}}
the VAT accounts MUST be set as control accounts for the VAT reports to work correctly.
{{% /alert %}}

### Tax Periods

In order to allow for flexible tax (VAT) reporting the system allows GL periods to be grouped into tax periods - these are set up in the GL Periods section where each GL period is allocated to a VAT period (usually a quarter). The transactions are then grouped together to allow for VAT reporting.

### Tax Rate

In the UK, as in most EU jurisdictions, the tax rate is applied based on the category of product being bought or sold. Under this section you can enter the various VAT rates that apply to the products you sell. You can enter as many different rates as you wish for reporting purposes, each with a different rate if necessary. The details required for each rate are:


*  Short code for the tax rate (Usually a single letter)
*  Description 
*  Percentage the percentage of tax to apply (can be 0%)

### Tax Statuses

In the UK the decision to apply tax is a combination of the tax on the product and the status of the trading partner (supplier or customer). The tax status determines whether tax is charged - this status is then used when setting up a trading partner in the purchase or sales ledger.

*  Description - the description of the traders tax status
*  Apply Tax - whether or not to apply any tax calculated from the product tax rate
*  EU Tax - whether to include in the EU tax analysis for intrastat purposes
