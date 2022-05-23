+++
title = "How to create a stock map"
+++

When setting up the warehouse management system it is particularly important to create a stock map showing Warehouses and Locations, the Actions that generate the stock movements and how these are to be handled and the movement types between the locations associated with each action.

The terminology used in uzERP is as follows:

| Term | Description |
| :----: | :---- |
| Store | A physical warehouse or manufacturing facility |
| Location | Physical OR logical stock location. There can be many locations within a store and they can be designated as balance or 'no-balance' locations |
| Bin | Sub-divides a Location if required for finer grained physical control |
| Action | Defines an action that is taken that results in a stock movement from one store/location/bin to another - each action must have at least one transfer rule |
| Transfer rules | define the permitted movements between stores/locations - each transfer rule is associated with an action |

_Example stock map:_

![](/images/map.png)

uzERP's stock movement system is a 'double-entry' system - each and every stock movements is represented by a pair of transactions - there must be a "From" and a "To" component. This means that there has to be some way to represent locations that are 'outside' of the physical stock system. This is what 'no-balance' locations are for.

The boxes in the diagram represent Stock Locations that are designated as 'balance locations' i.e. they hold real stock. These may be physical locations for example 'Raw Material stores', or logical locations, say 'Goods awaiting inspection'. For these, a stock balance is meaningful and is held by the system in the balances table. The 'clouds' are no-balance locations, which don't have balances held, but represent logical locations where stock is moved to or from.

The individual warehouse Transfer Rules are represented by arrows between the locations and the Actions these rules are associated with are shown by the labels. You will notice that some Actions are associated with only one Transfer Rule, while others connected to several. For example, goods are received from a no-balance location called Purchase Orders into a balance location for Raw Materials. The screenshot [here](manufacturing_setup#menu_actions_transfer_rules) shows how this particular action would be set up in the system. There is only one rule associated with the goods receiving action.

Once the stock map is completed you can then go through the process of adding the locations and actions to the system via the Setup -> Manufacturing Setup -> Stock Actions routines.