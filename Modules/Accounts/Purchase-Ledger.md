# Purchase Ledger

The Purchase Ledger is used to record details of financial transactions between your company and your suppliers. With it you can record supplier invoices and control their payment. 

A typical workflow for Purchase Ledger is as follows:

* Add a supplier record for contacts already in the system
* Create invoices from Goods Received Notes or enter invoices and credit notes directly using the Purchase Invoicing module and post to the ledger;
* Post credit and debit journals to the Purchase Ledger for contras and the like;
* List un-posted invoices periodically to clear any queries;
* Select invoices which are authorised and due for payment into payment batches with optional filters including paying bank account, payment method, supplier classifications - uzERP can process a number of payment batches in parallel, e.g. for different payment methods;
* Produce a list of items selected for payment;
* Review the selection on screen and optionally remove some transactions from the paymePurchase Ledger nt run;
* Pay the transactions selected and produce payment documents (cheques, remittance advices etc) where required or generate payment files for BACS;
* Make ad hoc or manual payments (e.g. a hand written cheque) by supplier and match with invoices settled;
* Pay an amount to a supplier which is not yet allocated to an invoice;
* Allocate cash and credits to invoices and other debit transactions.

In common with all modules Purchase Ledger uses progressive disclosure to display information about suppliers and transactions. There are also several dashboard uzLETS to provide quick access to useful information.

## Suppliers

Supplier records need to be added based on already existing [Accounts](accounts) from the [Contacts](contacts) module

* Supplier * - the suppliers's name is selected from the [accounts](accounts) which have not already been allocated as a purchase ledger supplier;
*  Payee Name * -
*  Remittance Advice - a boolean (Yes/No) to determine if a remittance is produced for this supplier;
*  Currency * - the currency of the account;
*  Bank Account - the bank account the supplier is normally paid from;
*  Credit Limit * - a credit limit which can be used for supplier planning purposes;
*  Payment Term * - the payment terms agreed with this supplier which will be used to calculate due dates on invoices;
*  Payment Type * - how this supplier is normally paid;
*  Tax Status * - determines if tax (VAT) is charged and if the supplier is included in EU Intrastat reports;
*  Receive Into - where goods are normally received from this supplier;
*  Order Method -
*  Email Order -
*  Email Remittance -
*  Sort Code/Account Number/Bank Name Address/IBAN Number/BIC Code - banking information.
Items marked * are mandatory.

## Journals

###  Payments and Allocation

Manual payments are handled 

[[Batch payments]] on the other hand have a defined procedure.
