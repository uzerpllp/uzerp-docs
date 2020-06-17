+++
title = "Logistics"
weight = 40
+++

## Sales

TODO

## Purchasing

### Purchase Order Authorisation Limits
Purchasing authorisations are based on user name and a matrix of [[GL Account/Cost Centre|Setup/Ledger Setup]] combinations. A maximum value is then assigned to the authorisation limit. Each user can be allocated several limits across multiple centres giving a very fine grained level of control over the authorisation of expenditure.

When a purchase order is raised in uzERP it can be for either stocked or non-stocked items. It is possible to set up products that are purchased regularly via purchase order product lines although items to be bought can be entered directly onto the order.

Either way, a GL Account/Cost Centre combination is allocated to each line on the order. This authority limit determines who has authority to authorise the orders.
