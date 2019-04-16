---
title: "VAT Module"
---
## VAT Returns

Menu: **Accounts > Tax > VAT & Intrastat**

This will display a list of VAT returns and their status. To view a VAT return and have more options, click the *year* on the far-left that corresponds to a particular return.

### VAT Return View

This view shows the VAT values, submission receipt details and provides actions and reports for a return.

#### Actions

* **Update VAT Position**, Recalculates the values of the VAT return using the current state of accounting records.
* **Close VAT Period**, Recalculates the values of the VAT return and marks the VAT period as closed. No further changes can be made.
* **Submit VAT Return**, Submit the VAT return to HMRC using [Making Tax Digital](#making-tax-digital).
* **Print VAT Return**, Print, view or email a paper copy of the VAT return.
* **View Transactions**, View transactions relating to VAT Inputs, Outputs, EU Sales and EU Purchases. These reports can also be printed and output to email or CSV file.

### Making Tax Digital

VAT-registered businesses with a taxable turnover above the VAT threshold are required to use the Making Tax Digital (MTD) service to keep records digitally and use software to submit their VAT returns from 1 April 2019. The VAT module enables you to submit VAT returns directly from uzERP to HMRC.

uzERP is an HMRC recognised solution for Making Tax Digital for VAT. We configure the systems of customers who have support agreements to use Making Tax Digital for VAT to submit VAT returns.

### Configuring MTD

The configuration file for MTD is `conf/oauth.yml`. Other [Oauth2](https://oauth.net/2/) integrations may also be configured in the same file.

Example:

```yaml
---
mtd-vat:
    clientid: 'ms1iIWBBPqEUYYWy90fCzlR3sgsa'
    clientsecret: '9253d6ef-15ca-42d7-a7f7-07a8a0a682c2'
    baseurl: 'https://test-api.service.hmrc.gov.uk'
    redirecturl: 'http://localhost:8080/?module=vat&controller=vat&action=index'
```

The `clientid` and `clientsecret` are provided by HMRC.

{{% notice info %}}
If `conf/oauth.yml` does not exist the VAT module will still work as expected, but you will not be able to submit returns to HMRC and a warning will be shown.
{{% /notice %}}

### Authorising uzERP to Access VAT Records

Once your uzERP system is configured for MTD you need to authorise it to read your company's VAT records and post returns.

In the menu, go to: **Accounts > Tax > VAT & Intrastat**

Your browser will redirect to a page on the HMRC website where you will need to log-in with your credentials and authorise uzERP for MTD. Following authorisation, you will be returned to the list of VAT returns in uzERP.

{{% notice note %}}
uzERP will remain authorised for up to 18 months. You can withdraw authorisation at any time using the [Manage authorised applications online service](https://www.tax.service.gov.uk/applications-manage-authority).
{{% /notice %}}