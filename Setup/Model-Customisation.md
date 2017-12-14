# uzERP Configuration

## Model Customisation

### Custom Sort in Lists

*Since 1.7*

<span class="attention warning">The configuration for custom sort was moved from `conf/custom-model-order.yml` to `conf/model-config.yml` in release 1.9.2 and the configuration of custom model sorting was simplified.</span>

The default sort for each data model is defined internally within the uzERP source code but views can be re-sorted by clicking on the headings. The default sort can be overridden by creating a `model-config.yml` file in the conf/ directory, when site users need a view to be sorted using an alternative column by default.

The custom sort orders defined in the YAML file are cached in the key `<database-name>[model-config]`. Each time the file is changed the cache key must be cleared for any changes to applied in uzERP (see *Setup > Cache Management > Cache* in the uzERP menu).

`model-config.yml` is a simple YAML file where the models and sort criteria can be defined under the key *ModelOrder*:

```yaml
        ModelClassName:
            ModelOrder:
                field_name1: 'ASC|DESC'
                field_name2: 'ASC|DESC'
            ClickInfo:
                fields:
                    field_name1: 'Your Label'
                    field_name2: 'Another Label'
               methods:
                    model_method: 'Label'
```

Columns defined under *ModelOrder* are sorted in the order they are listed. The order direction (ascending = ASC, descending = DESC) for each column.

For example, suppose you wanted to sort Sales Order lists and CRM Activities using custom columns:

```yaml
        SOrder:
            customer: 'DESC'
            order_number: 'DESC
        Activity:
            enddate: 'ASC'

### Click Info

*Since 1.9.2*

Click info provides a way of showing additional information to the user in uzERP's grids without having to click through to the underlying data view.

For example, users need to see the pickable stock balance from the Sales Order Product list. With the appropriate configuration users can click on an information icon next to the stock item link and the required information will be shown in a pop-up (see screenshot, below).

![Click Info Screenshot](/uploads/uzerp-clickinfo.png)

To make click info available for a linked model, define the fields and methods to call in the `conf/model-config.yml` file:

```yaml
STItem:
    ClickInfo:
	fields:
            text1: 'MF Category'
            lead_time: 'Lead Time'
        methods:
            pickableBalance: 'Sales Stock'
```