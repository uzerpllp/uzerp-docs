# Sales Order Processing

## How do I...?

### Make products available to sell?
There is a product lines table that is accessed via Logistics -> Sales Orders -> Product Lines. A product line can be linked to a stock or a service item and can also be specific to a customer if required. Products can be included in price lists.

### Enter sales prices for items?

Go to Logistics -> Sales Orders -> Product Lines. The line to be sold is added here with its price and reference it back to the Stock Item from the drop down.

### Set up a price list description?

Menu option Logistics -> Sales Orders -> Price Types

### Allocate a customer to a price list?

In the sales ledger the customer can be allocated to a price type (list).

### Set up a specific price/discount for a customer?

There are two ways:

1. Go to Accounts->Sales edger->Customer Discounts - you can then add a discount by product group that is taken off the price list price. So if, say, customer A gets 10% off Product Group X add it here. All prices for that product group should be discounted by this figure.
2. If its more granular (at the specific item level and not product groups) you would have to add a new product line for that item. But as well as linking it to the stock item when you add it link it to a customer as well and **don't** link it to a price type (price list) - then the price that is displayed will be the specific one for the customer **not** the one from the price list
