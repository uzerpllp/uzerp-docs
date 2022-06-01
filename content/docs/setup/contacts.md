+++
title = "Contacts"
description = "Create contact categories and CRM classifications"
weight = 50
+++

{{% pageinfo color="warning" %}}
**Review:**
* This page should also discuss people.
* Document the *starter* database.
{{% /pageinfo %}}

## Contacts Setup

Menu: Setup > Contacts

There is a check box to set the preference for the auto creation of account numbers. Use this if you want system generated account numbers - if maintaining a link with legacy data it may be wise to enter historic, manual, account codes.

## Contact Categories

Categories can be associated with a either Companies or People, or both. The following have some impact on how the system works

*  Employee - if a person within the system company is marked as an employee then they will be available in the HR system
*  Customer - an account marked as a customer will be available in the [Sales Ledger]({{< ref "docs/modules/accounts/sales-ledger.md">}}) (Accounts Receivable)
*  Supplier - an account marked as a supplier will be available in the [Purchase Ledger]({{< ref "docs/modules/accounts/purchase-ledger.md">}}) (Accounts Payable)

If you base your system on the *starter* database then Contact categories already has 'Employee', 'Customer' and 'Supplier' set up. 

## Other Information

Apart from the above there is little setup required in the contacts module beyond the optional classifications you require. The different sections you can use are:

*  Company Classifications
*  Company Industries
*  Company Ratings
*  Company Sources
*  Company Statuses
*  Company Types

