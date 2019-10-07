+++
title = "Manufacturing"
weight = 30
+++

## Introduction

If you are going to use any of the Manufacturing or Stores functionality then various options within Manufacturing setup need to be activated. In common with many more expensive large scale systems, uzERP is very flexible in this area and adapts well to different business models. A certain amount of pre-planning and testing will therefore be necessary to get the system working how you would like.

{{% notice note %}}
Particular attention needs to be paid to the stock system. It is suggested that a [Stock Map]({{< ref "stock-map.md" >}}) be developed prior to implementation of the system. This will assist in defining the relationships between stores and locations and producing a view of how stock moves between them.
{{% /notice %}}

## Warehouse Management

The warehouse management system is where the set up of Stores (warehouses), locations and bins takes place. The system uses a series of one to many relationships to represent a hierarchical structure - thus a Store can have many Locations, and a Location can have many (optional) Bins.

In addition the system uses a “double entry” method to track stock - such that any movement affects two locations. For instance receipts of goods come “from” a purchase location into a stock location. For this reason some locations can be treated as “No Balance” locations.

{{% notice warning %}}
The system **requires at least 1 warehouse and 2 location codes** to function. If this approach is not taken, little meaningful information will be available and several of the manufacturing functions may not work properly.
{{% /notice %}}

### Stores & Locations

#### Stores
A store usually represents a distinct warehouse or manufacturing site. There must be a least one store although you might decide to have a separate store for each site on which you do business, plus each facility within the site. Each store has a store code, description and address. The fist two are mandatory, with the address being selected from the range of addresses set up against the system company.

It is a good idea to relate the names of the facility and store, for example:

*  BW - Bridgewater Warehouse
*  FIN - Finished store
*  NEW - New Works
*  MAIN - Main warehouse

#### Locations

Locations sub-divide stores and are used for controlling and analysing stock, both numerically and financially. They show where the stock actually is, how it moves and where it sits around. 

#### Bin Control

Bins sub-divide Locations. They may identify a rack and positions within the rack, or they may be just areas marked out on the floor. You don't need to define bins in a location - especially if you have some other way to tell where things are.

It's worth noting here that bin control is specified at the Location level. That is, you decide which Locations in each store are to be bin controlled. Every time a stock transaction addresses a bin-controlled location, the bin number will be requested by the system. If the location is not bin controlled, no bin is requested. This means that a store's receiving or inspection areas needn't be bin controlled while the raw material store could be.

### Product Groups

Within the stock system Product Groups can be used for analysis. There must be at least one product group in the system as this is a mandatory field for each stock item. The database allows for a product group code AND description which can be used to group stock items for further analysis.

### Type Codes

Type codes can also used to group stock for analysis purposes in conjunction with Product Groups. 

However, the type code of an item is also used in conjunction with [Actions]({{< ref "#actions-transfer-rules" >}}) to determine which actions are taken when specific procedures are called for a particular stock item when using manufacturing management or sub-contracting. In particular, actions control where stock is put on Works Order completion, whether parts used are backflushed and where to issue excess usage. 

*  Type code - a short code for the stock type
*  Description - full description

The following fields affect the manufacturing processes:

*  Completion Action - the action to be used when completing a works order this item type. This is used for manufactured items where you want to specify the action to move stock that has been made against a works order.
*  Backflush action - if you wish to backflush the standard bill of materials for a manufactured item the action to be used to backflush parts is entered here.
*  Issue action - the action to be used if manual issue of parts to a works order is required for this item type - used where backflushing is not in force AND to enable over/under usage bookings to works orders. 

### Units of Measure

The UoMs section allows you to set up the units of measure applicable to your organization. These are used in the stock, ordering and invoicing systems. there must be at least one UoM for the system to function correctly. The system is delivered with default UoMs such as Kilogram, metre and gram.
 
### UoM Conversions

uzERP allows you to define conversions between UoMs for use in the stock system. Once a UoM has been set up, you can specify default conversions between UoMs which will apply on a system wide basis. Obviously certain conversions are fixed e.g. a Kilo contains 1,000 grammes, but you can also specify here conversions atat are unique to your company. For instance if in you always supply your products in cases of 6 you could set up a UoM conversion such that CASE contains 6 PACKS.

Further flexibility is provided where different products have different UoM conversions since uzERP allows item-specific conversions to be entered during item setup. As long as the UoMs have been specified then the conversion can be set up.

### Actions & Transfer Rules

Once the [stock map]({{< ref "stock-map.md" >}}) is defined you need to set up the Stock Actions that describe how stock will move between locations. They are also referred to as 'Menu Actions' because they can be made to appear on a appear on a menu. 

{{% notice warning %}}**Each Stock Action requires at least one Transfer Rule** that actually drives the movement to be performed. This contains a _from_ warehouse/location and a _to_ warehouse/location. Some actions can have more than one transfer rule to give the operator choices of movement.</span>
{{% /notice %}}

Transfer Actions have four characteristics:

*  Action name (short code, e.g. “Issue”)
*  Description of what the action does (e.g. “Issue stock from warehouse to line-side”)
*  Label for the movement (e.g. qty issued)
*  Action Type

The Action Type determines the stock movements and additional processing for key operations as follows:

| Action Type          | Maximum Transfer Rules | Usage  |
| :----: | :-----:| :---- |
| Backflush            | 1 | Automatically issue the bill of material quantities of a manufactured or subcontracted item |
| Completion           | 1 | Triggered whenever goods are received against a purchase order or works order |
| Despatch             | 1 | **There must to be at least ONE despatch action**, its transfer rule determines the stock movement that occurs when goods are sold |
| Issue                | 1 | Used specifically to issue stock to a works order in combination with, or as a replacement for, backflushing |
| Manual               | N/A | Manual actions appear on the menu action screen and are used for sundry stock movements |
| Receive              | 1 | The stock movements to be performed when a goods are received against a purchase order |
| Return               | 1 | Determines the movements for returning stock issued to works orders |
| Warehouse Transfer   | N/A | Transfer between warehouses |

{{% notice warning %}}
Please note the maximum number of transfer rules per action in the table above. Some actions **must** have only one transfer rule.
{{% /notice %}}

### Setting the location for goods received

When goods are received against a purchase order they are automatically added to the stock balance at the location defined by the receive action for the order.

An action must be added with a type *Receive* - if you want to receive against an order the type **must** be *Receive* and there **must** be only one transfer rule for the action. Once added select the action in question and in the side bar select *Add Rule*. The transfer rule for the action can be added.

It is possible to have multiple receive actions so that stock can be received into different warehouse/location combinations. The option will appear in the *Receive Into* drop down on the order - you can default this by supplier so that goods received from that supplier will, by default, be received into a particular location using the supplier's 'Receive Into' option.

### Making actions unavailable

An action can be made inactive by removing all of its transfer rules. For example, a company may have defined several receiving actions and now wants to ensure that one of those choices is not available when entering new purchase orders. Care should be taken that there are no open orders that need to use the action being changed.

## Manufacturing Management

uzERP allows you to control many aspects of the manufacturing environment including specifying routes and operations for your products, managing shop floor paperwork, collecting data and reporting on manufacturing performance.

### Departments and Workcentres

You can set up as many departments as your organisation requires and within each department you can set up multiple workcentres - these could be for groups of machines, a linked set of processes or a single machine station. Each workcentre can be allocated a recovery, or 'charge out', rate to recover the cost into products.

Departments may be designated 'production' departments - this means that they are included in the production recording system and can have actual time recorded against them. This gives the flexibility to have a group of workcentres included on a route and therefore costed into a product, but not have actual time booked via the production recording system.

### Resources

Most processes within a manufacturing environment 'consume' resources. In uzERP a Resource is usually used for Operator grades who work on producing stock items. This allows the 'consumption' of an Operator's time to be costed into a product using the recovery rate for the resource.
