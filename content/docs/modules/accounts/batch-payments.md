+++
title = "Purchase Ledger Batch Payment"
+++


{{% pageinfo color="warning" %}}
**Needs review:**
* Remove site specific links
* Include information on injector classes for BACS and Dummy
{{% /pageinfo %}}

<span class="attention important">Make sure that the default printer is set to the **cheque printer** before you start this procedure.</span>

To select batch payments go to the purchase ledger suppliers list and use the Select For Payment action on the sidedbar.

to select items by payment type and customer - tick boxes required and check total before saving.

Then use the Selected Payments action which will show the selected payments (no of items etc) clicking the currency link will take you to a list which can be printed and checked - at this point you can still back out.

Enter all details for the payment run, i.e. the bank account, batch reference etc. At this point if you click PAY the purchase ledger is updated and the invoices are allocated per the payment run. **If you click PAY you cannot back out**.

After the PL is updated go to this screen http://egs.severndelta.co.uk/?module=purchase_ledger&controller=plsuppliers&action=batch_payment_history and there will be batch that says 'process'. Clicking process prints the cheques to the default printer that you have set - **MAKE SURE THEY ARE LINED UP AND THE DEFAULT PRINTER IS SET TO THE CHEQUE PRINTER BEFORE YOU PROCESS**. The cheques will now print.

Once they are printed, on the next screen, enter the cheque numbers (start and finish) and the PL and cashbook will be updated to reflect the cheque numbers.

You will then be taken to the print remittance screen where you can print or send the remittance advices.

Once the cheque run is complete, if you go here http://egs.severndelta.co.uk/?module=purchase_ledger&controller=plsuppliers&action=batch_payment_history you can click the date to get a list of the cheques raised as in the example here http://egs.severndelta.co.uk/?module=purchase_ledger&controller=plsuppliers&action=batch_payment_history_detail&id=4. The details link gives you the details.

## BACS processing

Available integration to HSBC BACS standard 18 file format.

By setting up an email address tagged 'REMITTANCE' under the system company this will act as the return address for the remittance.

