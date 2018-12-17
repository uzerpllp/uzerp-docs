+++
title = "Stock"
+++

*Please see the [[Stock How To|How-To/Stock]] for some answers to common questions.*

[[_TOC_]]

The stock (inventory) module can be used to track all aspects of your organisation's stock.

In some senses the Stock system is the heart of the commercial system if you are a manufacturer or wholesaler as every aspect of the business will be related back to a stock item is some way. The stock system will hold:

* Item master details
* Item balances across [warehouses/locations/bins](/Setup/Manufacturing-Setup#warehouse-management)
* [[Stock Transactions]]
* Units of measure (e.g. how may packs in a case)
* Product structures and routes for manufactured and sub-contracted items
* Links to works orders, sales orders and purchase orders

It is suggested that a [[stock map]] be developed prior to implementation of the system. This will assist in defining the relationships between stores and locations and producing a view of how stock moves between them.

# Stock Accuracy

Stock accuracy is of prime importance in running any business that buys, sells or makes products. If your stock records are wrong, then anyone using those stock records for information to support decisions will:

*  Make wrong decisions (if the records aren't known to be wrong)
*  Not trust the records and use judgement, not fact

The results of inaccurate stock records are felt in a number of ways:

*  Excess stock that needs funding (more than you realise!);
*  Shortages that lose business;
*  Increased overheads as everybody keeps their own stock records;
*  Confusion when stock records disagree (more costs).

No business will maintain a competitive edge with inaccurate stock records. Your target stock accuracy should be 100% in all areas. You should be getting near to this, in the high 90's, to be confident.

# Stock Items

Stock Items are the core of the stock module. The basic information for a stock item is as follows:

*  Item Code * - a unique identifier for the stock item
*  Alpha Code - a free format code used for analysis
*  Uom * - the unit of measure for the item as defined in the UOMs table
*  Prod Group * - a product group used for analysis
*  Cost Decimals * - the number decimal places to hold costs
*  Qty Decimals - if you require whole items set this to 0
*  Min Qty/Max Qty - used for replenishment reports
*  Tax Rate * - when purchased or sold the tax rate normally used for this item
*  Description - a description
*  Type Code * - the type code drives certain actions i te manufacturing and stock system such as backflushing and can be used for analysis
*  Comp Class * - component class is one of Bought in, Manufactured or Sub-Contracted
*  Abc Class * - inventory management classification
*  Materials Cost * - if Comp Class is Bought-in this can be entered here
*  Batch Size/Lead Time/Ref1/Text1 - optional analysis fields
*  Obsolete Date - if this item is marked as obsolete

Items marked * are mandatory.

## Cloning Stock Items

Items can be cloned(copied) using the *Clone Item* action, available on the sidebar when viewing and item. Optionally, other records attached to the item can be copied at the same time.

- [Structure](/Modules/Manufacturing/Stock#product-structures)
- Operations
- Outside Operations
- [Unit of Measure Conversions](/Setup/Manufacturing-Setup#warehouse-management_uom-conversions)
- [Sales Order Product and Prices](/Modules/Logistics/Sales/Sales-Order-Processing#product-lines) *(since 1.9)*

When cloning the Sales Order Product and prices there a a few things to note:

- only prices that are not specific to a customer are copied
- descriptions on the sales product and prices will match the item being cloned
- the specified start date will be applied to the sales product and price

# Product Structures

A product structure (BOM) is a list of the components that build a
finished item. If each of the components in a structure has a price then the
system will automatically build up the cost of those components to make 1 of
the finished items. You can build in waste and also cost the labour and
machine time to give you a full cost. The system will also maintain it so that
every time the price of a part changes (say the cost of rims increases)
it will automatically update the cost of all the finished items where the
part is used so you always have the latest cost on file for all of the items.
