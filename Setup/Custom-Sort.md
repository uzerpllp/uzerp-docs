# uzERP Configuration

## Custom Sort in Lists

*Since 1.7*

The default sort for each data model is defined internally within the uzERP source code but, views can be re-sorted by clicking on the headings. The default sort can be overridden by creating a `custom-model-order.yml` file in the conf/ directory, when site users need a view to be sorted using an alternative column by default.

The custom sort orders defined in the YAML file are cached in the key `<database-name>`[custom_model_order]. Each time the file is changed the cache key must be cleared for any changes to applied in uzERP (see *Setup > Cache Management > Cache* in the uzERP menu).

`custom-model-order.yml` is a simple YAML file where the models and sort criteria can be defined:

```yaml
	MOdelname:
	    orderby:
	        - 'first_field'
	        - 'second_field'
	    orderdir:
	        - 'ASC|DESC'
	        - 'ASC|DESC'
```

Columns defined under orderby are sorted in the order they are listed. The order direction (ascending = ASC, descending = DESC) for each column is defined under orderdir and there **must** be one for each column.

For example, suppose you wanted to sort Sales Order lists and CRM Activities using custom columns:

```yaml
	SOrder:
	    orderby:
	        - 'customer'
	        - 'order_number'
	    orderdir:
	        - 'DESC'
	        - 'DESC'
	Activity:
	    orderby:
	        - 'enddate'
	    orderdir:
	        - 'ASC'
```
