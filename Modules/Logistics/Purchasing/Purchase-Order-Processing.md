# Purchasing Order Processing

Purchase Order Processing allows for the management of supplier purchase orders for both goods and services.

*Please see the [[Purchase Order Processing How To|How-To/Purchase-Orders]] for some answers to common questions.*

## Suppliers

Before any orders can be processed suppliers must be set up on the system. This is achieved by first entering an account via **[[Contacts > Accounts|Modules/Contacts/Contacts]]**. The Account must be flagged as a supplier in the category section.

Once the contact details are added the supplier must be initialised in the Purchase Ledger under **Accounts > Purchase Ledger > View Suppliers > Add Supplier**. Here details relating to payment, VAT status, etc can be updated.

## Products

Menu: 

- **Logistics > Purchase Orders > Products**
- **Logistics > Purchase Orders > Product Lines**

The Product and Product Lines options are used to define the *product catalogue* for purchasing. In a manufacturing or wholesale environment, most product lines will be linked back to a stock item as well as to a defined supplier.

<span class="attention note">Using products is optional, order lines can still be entered on-the-fly by just entering a price and description. This enables one-off items to be purchased without the overhead of defining a product. **For regularly purchased items the use of products is highly recommended. For stock controlled items the use of products is mandatory**</span>

Each product holds the following information:

- Product Group - use this drop down to pre-select the product group of the item where the item is stocked
- Stock Item - if the item is stocked, relate this price to a stock item
- Description - a description for the item - this is defaulted to the item description where the product is a stock line
- UoM - the unit of measure 
- Tax Rate - whether the item is taxable and the rate of tax to charge
- GL Account - the GL account where the purchase is to be credited
- Cost Centre - the cost centre where the purchase is to be credited
- Start Date - the effective date of the price for this product
- End Date - this can be used to 'close off' products so that they are no longer valid and cannot be used

### Product Lines 

Once a product is added individual price combinations can be added for suppliers and dates. Each *product* can have multiple lines to denote different suppliers for the same item. In addition the system can be used for time based pricing where a supplier increases (or decreases) prices over time.

Each product line holds the following information:

- Supplier - the supplier for this price, leave blank to have this price available from ALL suppliers
- Supplier Product Code - if required, enter the supplier's code here for those situations where the supplier's code needs to be quoted on documentation
- Description - a description for the item, defaulted to the item description where the product is a stock line
- Currency - the currency for the price (based on the customer's currency)
- Price - calculated based on gross price and discount matrix for the customer/type/discount combination
- GL Account - the GL account where the purchase is to be credited
- Cost Centre - the cost centre where the purchase is to be credited
- Start Date - the effective date of the price for this product
- End Date - this can be used to 'close off' product lines so that they are no longer valid and cannot be used
- EAN - can be used to implement bar coding

<span class="attention note">When viewing Products or Product Lines, the default search selects records that are current at today's date. Anything that has an end date in the past or start date in the future will not be listed.You can clear the *Current At* date search to show all past, present and future products/lines or set *Current At* to an appropriate date.</span>

## Order Processing

Orders are entered by selecting the **Purchase Orders > New Order** menu option or by using the **New Purchase Order** link from the sidebar of the purchase orders list view.

<span class="attention note">If the total value of the order exceeds the user's authorisation limit, it will become a requisition and require authorisation before it can be sent to the supplier</span>

The basic purchase order processing steps are:

1. Enter the purchase order
2. Send the order to the supplier by using the sidebar **Print Order** action. The order can be printed or sent via email, etc.
3. Optionally indicate that the order has been acknowledged by using the **Order Acknowledgement Received** action.
4. [[Receive deliveries|Modules/Logistics/Purchasing/Receiving]].
5. [[Create and match supplier invoices|Modules/Logistics/Purchasing/Invoicing]]

### Order Status

Each order/order line can have one of the following statuses:

- New - order has been entered but not sent to the supplier
- Awaiting Delivery - ordered but no deliveries received
- Part Received - partial delivery received
- Cancelled - order/line cancelled
- Received - total order quantity received
- Invoiced - order/line matched to an invoice
