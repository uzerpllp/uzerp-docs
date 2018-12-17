+++
title = "Purchase Order Processing"
hidden = true
+++
## How do I...?

### Set up stock items for buying?

There is a product lines table that is accessed via **Logistics > Purchase Orders > Product Lines**. A product line can be linked to a stock item and can also be specific to a supplier if required.

### Set up non-stock or services for buying?

As above, go to **Logistics > Sales Orders > Product Lines**. The line to be purchased is added here with its price, supplier etc - there is no need to reference it back to a stock item if it is for a service

### Receive more than was ordered?

uzERP will allow you to receive more items than were actually ordered and  

* update stock with the correct quantity
* allow the actual invoice cost to be entered

###  Close an order line with an outstanding quantity?

Where an order line shows an outstanding quantity that will not be received, it can be marked as completed.

1.  Edit the order line
2.  Select 'Complete Line'
3.  Save the line

<span class="attention note">Only the original creator of the order can edit part received lines and mark them complete.</span>

### Call-Off Orders

Although there is no specific functionality relating to call-off orders in PO processing each order line within an order can have a different delivery date. In this case the delivery date of the whole order is set to the latest date for a line. As goods are received they are booked to the relevant line and the order status is set to part-received until all lines are completed. There is a caveat... once the order is authorised, printed and sent to the supplier in order to make changes re-authorisation is required. This makes it unsuitable where the order quantities are not fixed i.e. the requirements need amending after the order is raised.

### Add a new PO delivery address

* The [system company](/Setup/Initial-Setup#system-company) needs to be edited and an address added. There is a sidebar action which allows alternate addresses to be added. In order to use this as a delivery address the new entry must be designated as a *shipping* address.
* Step two is to add a new store for the shipping address within manufacturing setup and add a [receiving location](/Setup/Manufacturing-Setup#warehouse-management_stores-locations) to this store.
* Lastly a *[Receive](/Setup/Manufacturing-Setup#warehouse-management_setting-the-location-for-goods-received)* action should be added.

