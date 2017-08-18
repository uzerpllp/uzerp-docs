# Works Orders

Works orders are used to drive the manufacturing process and are crucial to the demand planning and shop floor data capture parts of the system. Works order information can be accessed from the Manufacturing -> Works Orders menu option. The Manufacturing module home page has the following uzLETs for managing works orders


*  Print Works Orders

*  Book Production and Issues/Returns

*  Backflush Errors

## The stages of a Works Order

Orders go through several stages denoted by the status indicator:


*  New - The order has been entered onto the system but is not yet finalised. At this stage no bookings can be made to the order but it shows up in all of the demand and requirement reports.

*  Released - The order is available for document printing and will appear in the open order uzLETs.. Materials can be reserved against orders with a released status and but work has not yet started as no production has been booked.

*  Open - Production has been booked to the order or materials issued or reserved. The order is 'in progress'.

*  Complete - The order is completed.

## Adding a Works Order

The menu option Manufacturing -> Works Orders -> Add Works Order takes you straight to the form and following information is required to add a works order:

*  Stock Item - all manufactured items are shown in the drop down.

*  UoM - the unit of measure for this works order. This will default to the usual unit for the item although alternative UoMs may be used where ther is a conversion factor in place.

*  Data Sheet - If a data sheet is to be issued with the works order.

*  Order Qty - how many units are required.

*  Required By - when the works order is due to be completed.

*  Project - if the works order is related to a project it may be selected here.

*  Text1, Text2, Text3 - free format text.

*  Order No, Order Line - a sales order or customer order and the line to which this order relates.

*  Documentation - any documentation required.

A works order is added with a status 'New'.

## Managing a Works Order

There are various actions for managing Works Orders that have been entered. When the works order is selected from the collection
the following sidebar actions are available


*  Edit

*  Review Material

*  Review Resources

*  Force Complete

*  Issues

*  Returns

*  Book Production

*  Reset Status

In addition there is a 'show related' option to view all transactions against the order.

## Booking Production

Production against a works order is booked by using the Book Production uzLET.



## Shop Floor Loading

