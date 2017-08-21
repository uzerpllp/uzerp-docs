# Sales Order Processing

# Introduction

The SOP HowTo page is [[here|sohowto]].

[[_TOC_]]

# Product Lines

Sales Order Product Lines represent the organisation's catalogue. 

You can input products for sale based on price lists which may be general across the company or relate to customer groups. In addition individual product prices may be input for specific customers. The columns in the SO product lines table are:

* Product Group - use this drop down to pre-select the product group of the item where the item is stocked
* Customer - the customer for this price, leave blank to have this price available to all customers
* Stock Item - if the item is stocked, relate this price to a stock item
* Customer Product Code - if required, enter the customers code here for those situations where the customer's code needs to be quoted on documentation
* Description * - a description for the item - this is defaulted to the item description where the product is a stock line
* So Price Type - if this product line relates to a price list, for example trade or retail
* Gross Price - the gross price
* Product Group Discount - where extra discounts are available by group the code can be added here
* Net Price - calculated based on gross price and discount matrix for the customer/type/discount combination
* Currency * - the currency for the price (based on the customer's currency)
* UoM * - the unit of measure
* Tax Rate * - whether the item is taxable and the rate of tax to charge
* GL Account * - the GL account where the sale is to be credited
* Cost Centre * - the cost centre where the sale is to be credited
* Start Date * - the effective date of the price for this product
* End Date - this can be used to 'close off' product lines so that they are no longer valid and cannot be used

*Items marked * are mandatory.*

<span class="attention note"><p>When viewing Products or Product Lines, the default search selects records that are current at today's date. Anything that has a end date in the past or start date in the future will not be listed.</p><p>You can clear the *Current At* date search to show all past, present and future products/lines or set *Current At* to an appropriate date.</p></span>

During order entry the system will look at this table to determine the items available for sale for the customer in question and build an appropriate drop down list allowed for that customer based on products that are: 

1. in the appropriate 'price type' for the customer (the 'price type' for the customer is set against the Sales Ledger record).
2. specific to the customer, that is where the product line is allocated to a customer
3. available in general to all customers

Entering products and prices here therefore greatly speeds up order entry. It is also worth noting the following when entering orders where the SO product line is used:

1. When linking an item to a Sales Order Product Line, the item code and description from the Stock Item is copied to the Sales Order Product Line description which can then be amended to add additional information to the Sales Order Product Line (for instance customer part numbers/description)
2. There are two description fields on the Sales Order Line; item description and description
3. The description is always displayed on the Sales Order Line; in some places, the item description is also displayed
4. The Sales Order Line description comes from the Sales Order Product Line description; the Sales Order Line description can then be changed to provide additional information at order entry time
5. The Sales Order Line description is copied to the Sales Invoice Line
6. The Sales Order Line item description comes from the Stock Item description to match with the linked stock item; the Sales Order Line item description cannot be changed
7. The Sales Pick List shows the Stock Item code and the description from the Sales Order Line; this will highlight any differences between the linked stock item and the description
8. When editing a Sales Order Line, the description is not automatically changed because this could lose any additional information that was originally entered for that order line
9. If the Stock Item description is subsequently amended, neither the Product Line description nor the Sales Order Line item description is automatically updated

# Order Processing

Orders are entered by selection the add Sales Orders -> New Order menu option or using the New Sales Order link from the sidebar of the sales orders list view.


## Order Status

Each order/order line can have one of the following status. These are pretty straight forward and are listed below.

* New - the order has been entered
* Open - 
* Cancelled
* Despatched
* Part Despatched
* Invoiced

## Sidebar Actions

###  Print Acknowledgement 

Prints an acnowledgement for the order and sets its status to Open

### Print Pro Forma Invoice

Allows for the printing of a proforma invoice.

### Print Pick List


### Confirm Pick List

Confirm items as picked on a line by line basis.

### Edit Sales Order

This option only appears if editing is allowed, based on the status of the order.

### Revise Line Despatch Date

Each line can have a different despatch date - this option allows for revisions for new/open lines.

### Cancel Lines

Cancel lines on an order.

## Related Items

### Show Packing Slips
This option is used to create a packing slip that can be enclosed when goods are despatched.

## Price Types

Price types allow SO product lines to be grouped into price lists. Customers can be allocated a Price Type which means that at Order Entry the system will look for prices from the SO Product Lines table which are allocated to this price type. Examples would be:

* EU - European Distributors
* Medical - Medical Distributors
* Trade - Trade & Industrial Customers

In addition [Customer Discounts](sales_ledger#customer_discounts) can be used to apply a discount to a price type based on an item's product group for a particular customer.

# Item Availability

When processing customer orders it is useful to have an overview of the availability of stock within the system. Two screens are available:

- Logistics -> Sales Orders ->  Sales Orders -> Item Availability
- Logistics -> Sales Orders ->  Product Lines -> View Supply/Demand

This shows demand for *[[Stock Items|Modules/Manufacturing/Stock]]*, i.e. sales orders vs stock and supply ([[Works Orders|Modules/Manufacturing/Works-Orders]] or [[Purchase Orders|Modules/Logistics/Purchasing/Purchase-Order-Processing]]).

The columns are:

 1.  Required = quantities from sales order lines
 2.  Available = available quantities in saleable locations
 3.  In Stock = quantities in stock but **NOT** in saleable locations
 4.  Actual shortfall = (Available + In Stock) - Required
 5.  On Order = Quantities from Purchase order or Works order lines
 6.  Expected Shortfall = Actual Shortfall - On Order

Note that this ONLY deals with stock items, if the item is not stock on then it won't appear. *Item Availability* only shows items for which you have an order whereas the *View Supply/Demand* shows the full list and can be selected by Product Group).
