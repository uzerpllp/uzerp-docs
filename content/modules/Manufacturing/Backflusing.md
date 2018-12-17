+++
title = "Backflushing"
+++

Backflush refers to a special type of stock transaction. When backflushing is in use, uzERP can be made to assume that raw materials or components have been used because a particular action in the stock system has taken place. This assumption is based on the product structure for the item being produced.

The reasons for wanting to use backflushing vary. In process-flow or JIT production environments it is often the most cost-effective way to provide records of raw material or component consumption. This way material costs can be attributed to products made on a particular works order. Installations like this usually have excellent procedures and quality control and can rely upon actual events following plans. 

Within uzERP backflushing can also be used as a way of tracking consumption or free-issued materials at sub-contractors by moving the assumed consumption on receipt of the goods. 

Beware of backflushing simply to save stores time, or if there are not enough stores personnel to perform all the necessary transactions. A system like uzERP will only perform if events in the system actually line up with events on the ground and backflushing will magnify this issue - when the system is asked to make assumptions like this it is doubly important that data is accurate and the assumptions are valid.

Batched, serialised or bin controlled components cannot be backflushed because uzERP cannot tell which batch was issued, or which bin stock was taken from.

## Set Up for Backflushing

In order for backflushing to work there must be a backflush [action](manufacturing_setup#actions_transfer_rules) set up that details the movement required for the raw materials or components on completion of the stock item being produced - whether or not backflushing is used is determined by the [type code](manufacturing_setup#type_codes) of the item being produced or received.

This means that a type code must be set up where there are different actions, perhaps where there are both manufactured and sub-contracted parts.



## Backflush Errors

In the event of an error, when uzERP can't find enough stock to make a backflush issue, an 'unresolved' movement is created. There is a uzLET on the default manufacturing sceen which shows that there is a problem, which is shown below:

{{:backflusherrors.png|750}}

Clicking on the link will take you to the transaction where the problem can be resolved.

{{:backflushresolve.png|}}

A regular audit of backflushes should be carried out by using the stock transaction view and searcing for unresolved stock transactions.
