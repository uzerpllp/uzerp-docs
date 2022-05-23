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

#### Configuring MTD

The configuration file for MTD is `conf/oauth.yml`. Other [Oauth2](https://oauth.net/2/) integrations may also be configured in the same file.

Example:

```yaml
---
mtd-vat:
    clientid: 'ms1iIWBBPqEUYYWy90fCzlR3sgsa'
    clientsecret: '9253d6ef-15ca-42d7-a7f7-07a8a0a682c2'
    clientuuid: '606be9ed-4125-501b-93f1-86439f45bfda'
    baseurl: 'https://test-api.service.hmrc.gov.uk'
    redirecturl: 'http://localhost:8080/?module=vat&controller=vat&action=index'
```

The `clientid`, `clientsecret` are provided to developers by HMRC. Supported uzERP customers are provided these values, along with the `clientuuid` by uzERP LLP, see https://www.uzerp.com/mtd-terms.

{{% alert title="Notice" %}}
If `conf/oauth.yml` does not exist the VAT module will still work as expected, but you will not be able to submit returns to HMRC and a warning will be shown.
{{% /alert %}}

`clientuuid` is an [RFC4122](https://tools.ietf.org/html/rfc4122) version5 uuid, using a SHA1 hash and the X500 namespace, that encodes the user company name. For example, on a Linux operating system the following command would generate a unique client uuid:

```shell
$ uuidgen --sha1 --namespace @x500 --name "O=Global Widgets Ltd."

606be9ed-4125-501b-93f1-86439f45bfda
```

#### Authorising uzERP to Access VAT Records

Once your uzERP system is configured for MTD you need to authorise it to read your company's VAT records and post returns.

In the menu, go to: **Accounts > Tax > VAT & Intrastat**

Your browser will redirect to a page on the HMRC website where you will need to log-in with your credentials and authorise uzERP for MTD. Following authorisation, you will be returned to the list of VAT returns in uzERP.

{{% alert title="Note" %}}
uzERP will remain authorised for up to 18 months. You can withdraw authorisation at any time using the [Manage authorised applications online service](https://www.tax.service.gov.uk/applications-manage-authority).
{{% /alert %}}

#### Fraud Protection Headers

By [law](http://www.legislation.gov.uk/uksi/2019/360/made) uzERP must send additional information called Fraud Prevention Headers when submitting VAT returns to HMRC. The headers may contain personal information and the HMRC have published a [Data Protection Impact Assessment](https://developer.service.hmrc.gov.uk/api-documentation/assets/content/documentation/3f4c263faa8231bea05c1826b7f6b81c-TxM%20DPIA%20v3%201%20Public.pdf).

Fraud Prevention Headers sent by uzERP:

Header Name | Content
---- | ----
Gov-Client-Connection-Method | `OTHER_DIRECT`
Gov-Client-Device-ID | `clientuuid` (see above)
Gov-Client-User-IDs | uzERP user name of the logged-in user
Gov-Client-Timezone | Current timezone offset from UTC, e.g. `UTC+01:00`
Gov-Client-User-Agent | Operating system information, e.g. `Linux 5.1.6-300.fc30.x86_64 #1 SMP Fri May 31 17:43:23 UTC 2019 x86_64`
Gov-Vendor-Version | uzERP version number