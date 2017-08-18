# Purchase Invoice Register

Purchase Ledger Invoices are entered from within the Logisitics area. Going to **Logisitics > Purchase Invoicing > Purchase Invoices** shows a list of Supplier invoices and their current status along with processing actions in the sidebar.

## Creating Invoices

### Action: New Invoice

The *New Invoice* action creates a new invoice against a supplier. A GRN number can optionally be entered against each line, but products and quantities cannot be entered or selected. This method of creating invoices can be used when you don't need a purchase order or GRN, but need to register an invoice for payment.

<span class="attention important">Do not use the *New Invoice* action for invoices against [blanket/call-off](/How-To/Purchase-Orders#how-do-i_call-off-orders) or orders for stock items. When this type of invoice is matched, the purchase order line will be considered complete and marked as invoiced, no more deliveries will be able to be received against it. **Always use *Create Invoice from GRN* for blanket/call-off or orders for stock items.**</span>

### Action: Create Invoice from GRN

[[Received|Modules/Logistics/Purchasing/Receiving]] purchase order lines will have a GRN (Goods Received Note), which can be used to create a supplier invoice. The *Create Invoice from GRN* action shows a list of GRN lines that can be selected to create an invoice that mirrors an invoice received from a supplier.

## Matching Goods Received to Invoices

When an invoice is received against an order it can be matched against a Goods Received Note (GRN) by going to **Purchase Orders > Create Invoice From GRN**.

If an invoice is entered then subsequently needs to be matched go to **Logistics > Purchase Orders > Purchase Orders > Match GRN to Invoice** - you can *post match* an old line to an old invoice, assuming the invoice shows up in the drop down.
