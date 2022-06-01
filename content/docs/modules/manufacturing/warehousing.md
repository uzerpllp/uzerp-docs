+++
title = "Warehousing and Stores"
description = "The uzERP warehousing module helps keep track of stock (inventory) by controlling where things are located."
weight = 10
+++

The warehouse management system is where the set up of Stores (warehouses), locations and bins takes place. The system uses a series of one to many relationships to represent a hierarchical structure - thus a Store can have many Locations, and a Location can have many (optional) Bins.

In addition the system uses a “double entry” method to track stock - such that any movement affects two locations. For instance receipts of goods come “from” a purchase location into a stock location. For this reason some locations can be treated as “No Balance” locations.

{{% alert title="Warning" %}}
The system requires at least 1 warehouse and 2 location codes to function. If this approach is not taken, little meaningful information will be available and several of the manufacturing functions may not work properly.
{{% /alert %}}

## What You Can Do With uzERP Warehouse Management

*  **Maintain Location Balances** - displays and reports show all balances held in real locations (as opposed to no-balance locations) and can aggregate them.
*  **Evaluate Stock Balances** - balances may be evaluated using item costing data. This allows you to answer questions like, "What is the value of finished goods stock?" or, "How much do we have tied up in inspection?".
*  **Maintain Stock Transaction History** - every stock transaction is recorded, with its date and time, together with the cost prevailing at the time. This table can be used for a wide variety of historical and audit tasks, as well as extracting inventory movement data for transfer to the accounting system if required.
*  **Evaluate Stock Transactions** - the transaction history table can be evaluated, using the current cost or the cost when the transaction was made. This allows you to answer questions like, "What is the value of WIP issues to date this month?" or, "What is the cost of sales deliveries this week?" These stock transactions and the related cost data can be used to maintain the financial state of your stock. 
*  **Restrict Stock Available For Sale** - balance locations may be marked as "Goods-for-sale" locations. uzERP's Sales Order processing routines will only sell stocks in these accounts. 
*  **Provide An On-Line Bin Card** - The transaction history display for each item in the system uses a format similar to a bin card, including historical balances and running totals. This can make uzERP appear reasonably familiar to stores personnel used to manual systems.
