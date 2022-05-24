+++
title = "Glossary"
weight = "999"
+++

Some terms that may help when thinking about concepts in uzERP.

### A

#### Acknowledgement

A commitment from a supplier to advise a customer that a Purchase Order has been received. It usually details the items and/or services ordered and it normally implies acceptance of the order.

#### Actual cost

Cost actually paid for an item.  This is very difficult to establish and record in a computer system, even for purchased items, since you don't usually have the invoice at the time of receipt.  Most companies use some sort of approximation.  See "Average cost".

#### Assemble to order

An arrangement where common sub-assemblies may be made and stored against a sales forecast and final assembly is performed only when a customer order is received.

#### Assembly

An item which is assembled from several others to make up a composite article.  Assemblies are often categorised into sub-assembly and final assembly.  See also "Component", "End product".

#### Authorise (an invoice)

An authorised invoice is one that has been registered, matched with a GRN and passed for posting to the Purchase Invoicing system.

#### Available-to-promise (ATP)

Existing stocks available for sale plus quantities and their due dates that are expected from manufacturing or purchasing operations and which are not already promised to customers.

#### Average cost

A cost per item stock unit maintained by uzERP for each store.  It's a moving average, based upon the contents of the item in the store and their values on arrival.  See "Moving average".

### B

#### Back orders

Customer orders which should have been despatched, but which are still outstanding, pending receipt of the goods in question.

#### Backflush (components)

A process whereby uzERP automatically issues component items when products are made and allocates their costs as planned to the works order in question. Components are backflushed based on the current product structure used in the works order.

#### Backflush event

An event that triggers backflushing.  Such events depend upon the way uzERP is configured at your installation.  Possible events are Works Order completion, Sub-Contract Order receipt. See "Backflush (components)".

#### Balance Location

A Stock Location which holds stock balances. Opposite to a "No-balance account".

#### Bar-code

A series of alternating black bars and spaces that represent ASCII characters in a machine-readable form.  All grocery and many other products have bar-codes printed on the packaging. uzERP can be interfaced to a variety of bar-code reading equipment.

#### Base Currency

Currency in which all financial transactions are recorded within uzERP. See Also 'Twin Currency'.

#### Batch (Accounting)

A collection of transactions identified as an auditable set for input to a ledger.

#### Batch (Stock / Inventory)

A quantity of work to be launched or already work-in-progress.  Also called a "Lot".

#### Bill of Material (Structure or BoM)

A list of all the components (intermediates, sub-assemblies, raw materials, etc.) showing the quantity of each needed to make an end product. A single level Bill of Material is a list of all immediate components. The uzERP system, in theory, allows an infinite number of levels.

#### Bin location

A physical location within a store in which stocks are held. Bin locations may be racks or boxes or simply areas marked out on the floor. uzERP allows many items to be stored in a bin and many bins to be used for storing the same item, but for stock accuracy reasons it's often helpful to keep one item per bin location.

#### Bin Card

A manual record of stock quantities available, together with historical details of stock movements, which is maintained for a single item of stock in a store or bin. uzERP has a stock display similar to a bin card for each item to provide a familiar function for operators used to manual systems.

#### Blanket Order

See: [Call-off Order](/glossary#c_call-off-order)

#### Bottleneck

A restriction in the flow of work through the manufacturing facility caused by some lack of capacity at a crucial point or operation.

#### Branch

The uzERP contact system can store branches against a main contact record.

#### Buffer stocks

See "Safety stock".

#### Build-through item

An item defined within the Bill of Materials as having components but which, in fact, never exists as an independent item. It is often used as a convenient grouping for a list of items common to several assemblies. A build-through item is a special kind of Phantom. uzERP does not yet included build through functions - this is planned for a future release.

#### Bulk issue item

Items which are not ordered via the MRP process, in line with calculated requirements.  They are issued from stores for general use and not against specific production (or other) orders. n general, these items are low in value.

### C

#### Calculated lead time

Lead time(s) for an item, calculated from its route(s), using planned batch size, set-up times, process times and pre-operation delay times. Compare it with the "Planned" and "Actual" lead times.

#### Call-off Order

A Call‐off Order is purchase order created to cover multiple deliveries from a single supplier, for example:

- For a long term supply from the same supplier
- An  unknown delivery schedule  
- Where precise quantities are not known until after delivery
- Where special pricing has been negotiated on an annual volume

*See also: [Call-off or Blanket Orders](How-To/Purchase-Orders#how-do-i_call-off-orders)*

#### Capacity

The total capability of a manufacturing facility under specified operating conditions. This is normally expressed in terms of hours per period for a work centre or resource type.

#### Capacity Requirements Planning (CRP)

The process of establishing the quantity of each chosen resource typerequired to support a given load.

#### Column

A relational database term.  See "Relational database".
#### Component

Term used in uzERP for any item in the Item table, be it piece part,raw material, intermediate item or sub-assembly which may be used to make another item. See also "Bill of Material".

#### Composite Lead Time (CLT)

The length (in days) of the critical path for the manufacture of anitem from scratch, including procurement of raw materials. It also includes the "Inter-Level lead time addition" for every level, including Build-throughs, in the Product Structure. See "Manufacturing Composite Lead Time (MLT)".

#### Consignment stock

Stock held on a customer site or in a third party's premises but still owned by the manufacturer.

#### Consumable item

An item of stock not incorporated directly into a finished product but which are used as part of the manufacturing process (e.g. cleaning materials, lubricants etc.). If held within the uzERP system these items may be controlled on a re-order level basis and treated as overhead costs.

#### Contact

Term for an individual a customer, supplier or other associate of the company - this may be an account, lead or person.

#### Cost roll over

Process of updating the standard cost held by uzERP for every item in the system based on the latest cost.

#### Cost roll up

Process of updating the latest cost held by uzERP for every item in the system based on components and resource usage. Latest cost is updated for each item as things change so this is performed infrequently.

#### Credit check

Compare a customer's outstanding debts against limits agreed forthat customer. Such limits may refer to the total value of the debts and/or the timely settlement of such debts.

#### Credit limit

A value which is agreed to be the maximum acceptable total of a customer's outstanding debt.

#### Credit Note

A formal document that reverses a sales invoice. Goods can be returned to a designated Stock Location and a credit is raised on the Sales Ledger for the customer.
#### Customer part number

A code by which a particular customer identifies an item in uzERP. Different customers may use different customer part numbers for the same uzERP item and this is set up through the Sales Order Product Lines system.
#### Cycle counting

A method of checking the perpetual inventory record against actual balances. It involves planning a schedule for the store which ensures that all balances are checked at least once during a pre-determined "Count period", more important items being counted more frequently than those that are inexpensive or don't move very often.

### D

#### Database

A repository for all the data associated with a system.  uzERP has a  single, integrated, relational database for all its systems.  See  "Relational database".

#### Debit Note

The equivalent of an order which has no implications in the stock  record.  The stock may have been taken or there may be no stock  involved or it may be to correct a previous error. Debit Notes are available or invoicing immediately.  Opposite "Credit Note".

#### Degenerate Structure

See "Structure loop".

#### Delivery address (delivery point)

The geographic address to which deliveries will be made for a sales order. It need not be the same as the order address, the statement address or the invoice address.

#### Delivery lead time

The (Purchase) delivery lead time is the normal number of "Calendar days" that it takes to get a specific item from a stated supplier. See "Planned lead time".

#### Demand

A demand is a set of requirements for an item from a source. There may be many demands for an item; they may be either independent or dependent.  See "Requirement".

#### Dependent demand

A schedule of dependent requirements.

#### Dependent requirement

A requirement for products, components and purchased material calculated by MRP and dependent upon other orders, for parent items, already in the system.

#### Despatch note

An advice note that details all items contained in a single delivery. It identifies the customer that will receive the goods and usually relates to an individual order.

#### Direct delivery

A term used when a supplier arranges for a third party to deliver goods directly to one of his (the supplier's) customers without the goods appearing on the supplier's premises.  A normal stocked item may be delivered direct. See also "Non-stocked item".

#### Direct item

The term given to items of inventory which are sold or used directly in mmanufacture, as opposed to consumables (indirect items).

#### Discount

An allowance or deduction granted by a supplier to customers in order to persuade them to buy more or to pay promptly, etc.

#### Documents

In uzERP terminology documents are


- Sales
    * Sales Order Acknowledgements
    * Pick Lists
    * Despatch Notes
    * Invoices
    * Credit Notes
    * Statements

- Purchases
    * Purchase Orders
    * Remittances

- Operations
    * Works Order paperwork

#### Drawing number/issue number

The reference number of the drawing or other specification of an item. Within uzERP this reference may be input into one of several fields on the item record.

#### Due date

The date at which an order or requirement becomes due.

#### Due quantity

The quantity expected to be received from an operation. It may be influenced by "Operation scrap", either negative or positive. See also "Expected quantity".

## E

#### Economic Batch/Order Quantity (EBQ/EOQ)

A mathematically calculated order quantity which seeks to achieve an economic balance between stock holding costs and ordering / set-up costs. Larger order quantities require fewer orders / set-ups whilst smaller orders result in lower inventory levels. This can be seen graphically by plotting cost against batch size. There are a many models for calculating EBQ/EOQ.

#### Effective date 

The date on which a set of components is introduced or terminated in a Product Structure.

#### End product

An item in the Item Master which is at the top of the Product Structure, which is made from components.

#### Engineering Change Note (ECN)

A document which authorises a change in the form, fit or function (and sometimes cost) of an item. It may change the drawing, the Product Structure, the recipe or the route.

#### Environment

The overall description of the company requirements under which the uzERP systems will operate.  This includes the definition of facilities, stores, stock accounts and overall system controls.

#### Expected delivery

Anticipated arrival of goods at Goods Inwards, from a supplier.  An expected delivery doesn't become an expected receipt until it has passed inspection and been transferred out of Goods Inwards.

#### Expected quantity

The level of output expected from a delivery when it's received into stores for use. You might anticipate some loss in Goods Inwards inspection and uzERP can plan for this. It's also the output expected from a works order or operation.  You might expect some loss or gain during the manufacturing process, so the expected quantity may not be the same as the order quantity. Sometimes called, "Yield".

#### Expected stock balance

A predicted stock balance, calculated from current stock levels and expected receipts and issue data.  It's calculated by the Supply /Demand Review in uzERP.

#### Expedite

To speed up the progress of individual purchases, deliveries or works orders (often to the detriment of other planned work!).

#### Explosion

A process which starts at end-product level and works downwards. MRP works this way, so does an indented Bill of Materials print.

#### Extended pricing

A system in which a 3-dimensional table is used to ascertain a price for an item in a category of products for each customer. Given the item number, product group and customer, uzERP will provide from this table an absolute price.

## F

#### Finished goods stock

Stock of end-product items which are held for the purposes of supply to an external consumer (i.e. customer).

#### Finite capacity planning

A procedure that establishes the sequence of work, as displayed in a work-to list, using capacity, amongst other things, as a constraint. Because uzERP has an open source RDMS it can be interfaced with 3rd party finite capacity schedulers.

#### Free issue (to a sub-contractor)

Materials or components that are sent to another organisation for specialist work to be performed. They're usually returned under a different item number.

#### Free stock

The amount of stock of an item that is available for use.  The actual definition of the term, "Free for use," depends upon rules at your installation. See also, "Goods for sale" and "MRP-free stock".

## G

#### Goods for sale

Items that are available for sale by uzERP Sales Order Processing functions. Such stocks are contained in Stock Locations marked as saleable.

#### Goods Inwards procedures

The standard operating procedures used by the company for recording delivery, inspection and receipt of goods from suppliers. They may be recorded as routes or as stock actions in uzERP (from the the stock map).
#### Goods Received Note (GRN)

A document raised by the Goods Inwards department containing details of the quantity of items which have been received from an outside supplier - when goods are booked in against an order uzERP automatically raises a goods recievd note.

#### GRNI (Goods received not invoiced)

That proportion of the value of goods implied by a GRN that has not been matched with an invoice line or lines.

## I

#### Indented Bill of Materials (BoM)

A report showing an parent item together with all its components right down to the raw material level; so-called because of the appearance of the display in which each subsequent structure level is indented.

#### Independent requirement

A requirement to supply goods that is input directly by the user or from another system, such as Sales, Warehouse Replenishment or Repair Forecasting.  Such requirements are not dependent upon any other requirement known to the MRP process.

#### Indirect item

Item used by your company in the pursuit of its business but which isn't sold or used directly the manufacturing process (i.e.: which doesn't appear in the Product Structure).  See "Consumable Stock".

#### Infinite Capacity Planning

A method of showing the loading of individual work centres based upon orders and due dates and without taking into consideration the amount of capacity actually available at the work centre.  It works because capacity constraints have been taken into account. uzERP is an infinite capacity planning system, it may be linked to finite capacity planning software.

#### Inspection

An independent operation performed either as part of the goods receiving process or as part of the manufacturing process during which the items are checked for conformance to specification.

##### Inventory 

This is the general term given to all types of stock that occur and are recorded in uzERP.

#### Invoice

A formal document requesting payment for goods or services supplied to a customer. Details of each invoice are held in Sales Invoicing system and in the Sales Ledger against each customer.

#### Invoice address

The geographic address to which invoices will be sent.  It need not be the same as the delivery address, the order address or the statement address.

#### Invoiced price

The price quoted and used for extending invoice amounts.  When a purchase invoice price differs from the agreed price, the Purchase Price Variance results.

#### Invoice register

uzERP maintains a list of both Sales an Purchase invoices.

#### Item (Stock)

Any item which is stocked, made, bought or otherwise handled by the system, e.g. tools, raw materials, end products, intermediates, etc. Items are held in a table containing descriptive and control information about all items handled by the uzERP system.

#### Item number

A code which is used to identify an item uniquely to uzERP. 

#### Item specific unit of measure

Unit of measure specific to an individual item which overrides or adds to the standard conversion table. It can be used to convert area to weight, for example, using a conversion factor based on grammes per metre squared.

## J

#### Job
A batch of production work issued under the authority of a works order for processing on the shop floor.

#### Jobshop

A factory or factory area which makes batches of products to customers' orders, on a non-repetitive basis. Handled in uzERP as a Make-to-order environment.

#### Just in time (JIT)

A production control system that works by requesting components from the previous stage (or outside supplier) when they're needed, not before. Work is authorised only when a batch of components is (or will be) needed at the next stage of manufacture.  Batches are as small as possible and are "Pulled" through the system using tokens of some kind. JIT is a wide philosophy, not just a production control method. It relies on increased Production Engineering effort to reduce set-up times for example, and changed attitudes to Quality Control.  uzERP has a number of features that help JIT implementation.

## K

#### Kit issue
A single transaction resulting in stock issue transactions for all the outstanding components required for an individual works order. This is yet to be implemented in uzERP.

#### Kit list

A list of all components together with quantities required for a specific works order.

## L

#### Lead time

The time taken to convert a set of components into another product (item), from the time that the components are picked from the stores until the time the product is received.  See "Planned lead time", "Actual lead time" and "Calculated lead time".

#### Live item

A live item is usually one that has, or will have, requirements.  It may also be one that is still in use at a customer site, even though no future requirements are expected.

#### Lineside stock

Stock which is kept adjacent to the process where it will be required and which tends to pass into the process without an explicit transaction.  See also "Bulk issue". In uzERP lineside is a term used for stocked items that are often associated with "Backflushing".

#### Load

The amount of work lined up for a facility, work centre or resource, usually expressed in hours. The demands placed upon work centres or resources by released, firm and recommended orders.

## M

#### Made-in item 
An product or intermediate item that is sourced primarily in manufacturing.

#### Make-to-order

A type of manufacturing operation in which completed end products are only produced when a specific customer order is received. Also called "Lot for lot" or "1:1" or "One to one". Also a type of ordering in MRP in which an order is recommended for every requirement and no batching takes place.

#### Make-for-stock

A type of manufacturing operation in which completed end products are produced against a sales forecast and passed to a "Goods for sale" Store/Location.

#### Manual allocation

A system by which stock may be reserved for individual customer orders. It is normally used to make specific allocations.

##### Manual pricing 

Selected items may have no selling price recorded in the system. The system will prompt for a price to be entered at the time the order is accepted.

#### Manufacturing Composite Lead Time (MLT)

The length, in days, of the critical path to make an item, assuming that all buffered items are available immediately (and, therefore, excluded from the critical path). It also includes the "Inter-level lead time" for every relevant level in the Product Structure.

#### Master Production Schedule (MPS)

The company's overall procurement plan, expressed as time phased requirements for end-products (or planning groups) and spares, which is to be placed on Manufacturing.

#### Master Production Schedule (MPS) item

An item (in the Item Master) which is used for Master Production Schedule planning.

#### Material Requirements Planning (MRP)

A system of calculating recommended orders and changes to firm orders for manufactured and purchased items.  It uses bills of material, inventory, existing orders and master schedule information.

#### Max/min or min/max

A method of stock control which relies upon setting a minimum and maximum stock level figure for each item. When a stock issue causes the stock quantity to fall below the minimum level some more of the item are ordered to bring the stock figure to the maximum.

#### Moving average

Arithmetic mean of a set of the most recent values. See Weighted average cost.

## N

#### No-balance Location

Stock Location representing a location which is unreal or outside the stock system, e.g.: Sold Goods, Stock Adjustments, etc.

#### Non-stock item

An item which is not normally stocked but may have to be bought or sold using uzERP functions. Such items need no record in the Stock Items table but could be set up in Purchase Order Product Lines to make ordering easier. Items that are not normally sold but for which an order has been accepted can be processed as non-stocked items. Items which are never stocked but are frequently sold should be registered in the Sales Order Product Lines table.

#### Normalisation

A relational database term, part of the process of database design. It's a data analysis process in which you decide what tables to have and which data goes into them.

## O

#### Operation
The smallest discrete unit of work, carried out during the manufacturing process, that is taken into account for planning and control purposes.

#### Operation sequence

The sequence in which operations are planned to be performed. In some industries it's simply calculated from the order due date and the duration of each operation.  If you have a mix of work and many orders open at the same time, deciding which is the best operation to pick out of the queue next can be a very complex business.

#### Order

An instruction to procure or deliver.  See "Sales order", "Purchase order", "Recommended order", "Released order" and "Works order".

#### Order address

The geographic address from which an order was accepted and to which acknowledgement will be sent.  It need not be the same as the delivery address, the statement address or the invoice address.

## P

#### Parameter
A piece of control data that is held in the database or passed to a program and which affects or controls what that program will do. There is a Set Up module in uzERP that controls these items.

#### Parent item

The top level item in a single level Bill of Material

#### Period end

The end of a business period, implying the end of a set of transactions. They're usually financial transactions but may be inventory or other, similar transactions.

#### Perpetual inventory

A method of stock-take and stock checking which relies upon a continuous, audited method of counting stock levels of different items throughout the year rather than at a single stocktaking point. The frequency of counting is often related to an item's ABC analysis code.

#### Phantom

An item that is included for planning or other purposes and does not form part of the engineering design.  Phantoms are not real items and are not usually stocked, although they may be in uzERP. Phantoms can be used for Planning Bills, using up obsolete stocks, ordering free-issue materials and so on.  See "Build through".

#### Pick

The act of withdrawing stock from stores prior to despatch to a customer, inter-stores transfer, issue to work-in-progress, etc..

#### Picking List

A list produced by uzERP to tell Sales Stores operators what to pick in order to satisfy customer delivery requirements for a specified period. See also "Kitting list".

#### Planned lead time

The length of time, in working days, taken to convert a set of components into a parent item.  It's measured, for in-house manufacture, from the day work starts to the day that the finished item is expected to arrive into stores.  For purchased items it's measured (again in working days) from the day when the order must be placed to the day when it's received, inspected, into stores.  See "Delivery lead time".

#### Price change effectivity 

A means of registering imminent price changes against a list of prices for an item. The price change may be a value or a percentage and can be applied automatically to some or all prices for an item when the effectivity date is reached. The time of day for the price change is controlled by when the price change program is run.

#### Price types

Flexible method by which uzERP allows prices to be managed. Price lists may be established by item, sales office or customer, customer type by setting the price type in the customer record. May contain details of discounts and surcharges which may apply. Price list changes may vary over time (see "Price change effectivity").

#### Price unit

The units in which an item is priced for sale.  uzERP will convert from one unit to another when necessary, provided a conversion factor has been provided for the item

#### Process time

The time during which resources are being used to convert component(s) to a single unit of an end-product.  Often called, "Process time each" because it's measured per piece or per unit, not per batch.  See "Set-up time".

#### Promotional pricing

The application of special prices to selected goods for a finite period of time.  See "Coded pricing", "Extended pricing", "Manual pricing" and "Simple pricing".

#### Purchase order

A written instruction to a designated supplier to provide a service or product, normally specifying quantity and delivery date.  In uzERP they may have many lines, each for a different item, including non-stock items. Lines may be for "Blanket order", "Scheduled order" or a single delivery.

#### Purchase requisition

Requisition for a purchased item. A purchase order is seen by the system as a 'requisition' until it is authorised.

## Q

#### Queue Time

See "Pre-op wait time".


## R

#### Raw material

Components that are converted during the manufacturing process into things that can be used or sold.  Raw materials are normally purchased items (the bottom of a structure in uzERP).  Examples are cement, perfume, fabric, steel and so on.

#### Received line

In the uzERP purchase order system a "Received line" is entered on an invoice for every part of matched Goods Received Note (GRN) line.

#### Relational database (RDB)

A method of storing data that makes it easily accessible to everyone. All data is stored in tables in a relational database.  As you would expect, tables have rows and columns.  A table contains data that describes a single class of things that are of interest (e.g. Cusomers).  Each row contains data about one of the things (Customer 'Jim Smith').  Each column contains a piece of data that describes the thing (that is an attribute) - this might be the telephone number. Also see "Normalisation".

#### Relational database management system (RDBMS)

Computer program which provides access and update capability for the Relational Database - uzERP uses the postgreSQL RDBMS.

#### Released order

A works order with authority for work to proceed.

#### Resource

Something that is used or consumed when an operation is performed at a work centre.  See "Resource type".

#### Resource type

A set of resources which have similar characteristics and which are grouped together for capacity planning and shop control purposes. They could be machines or tools or a group of workers with the same skills, for example.

#### Roles 

uzERP's user security model is 'role based' such that each user has a role which determines the actionsthey can carry out and menu options they can see.

#### Rough-cut Capacity Planning (RCCP)

A method of checking whether you have enough capacity to make what's in the Master Production Schedule.

#### Row

A relational database term.  See "Relational database".

## S

#### Sales order

An obligation to deliver items or services to a customer, usually at a specific time and for a specific price.

#### Sales order status

An indication of the stage that a sales order has reached.  Examples are, "Quotation supplied", "Despatched", "Invoiced", "Closed", etc..

#### Sales Order Product Line

A product sold to the Company's external customers.  uzERP's Sales Order Processing system looks at the product line table when setting up orders - the product lines may be stock items or non stock.

#### Scrap

Items that are lost during manufacture or as a result of failing some inspection on receipt or in the stores.

#### Scrap percentage (scrap%)

A planning figure that causes MRP, costing and other systems to increase (or decrease if it's negative) the size of each order it recommends.  This ensures that enough items actually get made to satisfy the requirement, taking into account the fact that some might be lost.

#### Service Line/Service Invoice 

In the uzERP Purchase Invoicing a "Service invoice/line" is used to record invoices and invoice lines which will not have an associated Goods Received Note, e. g. carriage, Professional Services, etc.

#### Set-up time

The time required to change a machine from manufacturing one item to another.  Set up times considerably affect the ability to manufacture in small lots (as in Just-in-Time production) and should be reduced to their minimum levels through Production Engineering effort.

#### Shift pattern

During production recording uzERP will request a shift designation to record time and waste. 

#### Shop floor paperwork

A pack of documents that (usually) accompanies work as it travels around the factory.  It's often used to collect data about which actual work centre and resources were used for each operation as well as the times and numbers used. Quality data may be collected too. A whole set of shop paperwork may include a route sheet, operation booking slips, scrap booking slips and component requisitions.

#### Standard cost

The Frozen or Standard cost is the planned cost of an item including the cost of all components, resources and overheads used in its manufacture.

#### Structured Query Language (SQL)

A standard query language associated for extracting information from a Relational Database. All uzERP data is available to you, for query and for update, using SQL.

#### Stock transaction

A movement of some stock.  All stock transactions should be entered into uzERP, where they will be timed and dated and costed. See "Planned stock transaction", "Unplanned stock transaction" and "Authorised stock transaction".

#### Stock unit of measure (UoM)

The units in which the stock of an item is counted in the stores. It's a field in the Stock Item table that is entered when the item is added. uzERP converts from stock units to usage units, delivery units, price units, selling units, etc. based on item specific or system wide conversion factors.

#### Stocked item

An item which is, has been or will be, held in the uzERP stock record.

#### Stock Location

uzERP uses Locations to provide a flexible method of recording physical and logical categories of stock that is held in a Store.

#### Stock Location map

A diagram that shows the Stock Locations used in a particular company and the stock movements that have been authorised between them.

#### Store

A place where stocks are held.  It could be a physical place, like a warehouse, or it could be a logical sub-division of stocks.  You could, for example, keep all indirect items in a different store from direct items, even though they're physically in the same warehouse.

#### Structure loop

A situation where an item is deemed to be made from itself at some level in the Product Structure.

#### Sub-assembly

A term used in discrete manufacturing industries to describe an intermediate level in the Product Structure.

#### Sub-contract

Work, done to your own deign and, perhaps, normally done in your own factory, sent to another factory to relieve pressure on in-house capacity.  Work can be sub-contracted to an outside supplier or to another factory in your own group.

#### Supplier

A company from whom you purchase goods or services.  Also called a "Vendor".

#### Supplier catalogue

A list of items that you buy, or have bought, from a particular supplier. It contains UoM and pricing data. The Purchase Order Product Lines allows you to input various codes and prices for items purchased - these are then linked to items in the stock items table where the item is stocked.

#### Supplier part number

A code by which a particular supplier identifies an item in uzERP. Different suppliers may use different supplier part numbers for the same uzERP item - this is handle by Purchase Order Product Lines.

#### Supply / demand review

A process in which a requirement schedule is compared with a schedule of expected deliveries to give a profile of expected stock levels stretching into the future. The supply demand review is available for both sales and purchase items in the Logistics system.

## T

#### Table
A relational database term.  See "Relational database".

#### Transaction history

Table of transactions (usually stock movements or financial transactions) kept for historical or audit reasons.

#### Transaction reference

A unique, numeric auto-generated reference that identifies each transaction in the system.

## U

#### Unit of measure (UoM)

Code that indicates the units in which a quantity is measured. Examples are LITRE, EACH, METRE, TENS, BOX.  uzERP will perform a variety of UoM conversions for you, based upon a UoM conversion table.

#### Unplanned stock transaction

A stock transaction which has not been expected by any planned event. If such transactions occur on an item used in manufacturing, or allocated to customer orders, then this represents a change plan. Such a change inside the normal planning horizon for the item is a "Front end change". Examples of unplanned stock transactions are stock losses and gains, scrap greater than planned, component issue too early and out of planned sequence, etc..

## V

#### Vendor

See "Supplier".

## W

#### Warehouse

The physical store where stock is kept. You can control many warehouses with uzERP - the terminology used in uzERP is store.

#### Weighted average cost

Cost per unit calculated by adding the actual cost of items received into the store to the cost of those already in stock.

#### Work centre

A place where work takes place in the factory. A WIP operation takes place at a work centre and resources and components are used or consumed there. A route is a planned journey through the factory with each operation or stage taking place at a work centre. Work centres may have costs and overhead formulae associated with them in uzERP.

#### Work-in-progress (WIP, wip, w-i-p)

Work that is at some stage of completion in your plant, including components, part finished (PF) and completed items.  The term "Work-in-progress" is sometimes applied to the work itself, sometimes to the stock involved and sometimes to the value of those stocks.

#### Work-to list 

A list of operations at a work centre which are, or will soon be ready to start.

#### Works order

Authority for components to be consumed and for work to be done.
