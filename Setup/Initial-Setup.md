# Initial Setup

## The Setup Menu

The system is configured using the **Setup** menu. When first installed the system has one user called 'admin' with the password 'admin'. This should be changed as soon as possible after installation to something more appropriate.

## System Company

The first thing to do is to go to Setup -> System Admin -> System Companies to set up the details for the base system company - there will already be a dummy company set up, but the details should be changed to match those of your organisation by clicking on the company name link in the companies list - then by clicking the company name link you can edit the details of the company. At this point you can add the following information to the system company:

### Phone numbers, Addresses and email contacts

The system company can have multiple addresses, phone and email contacts. If you set up multiple addresses they can later be assigned to warehouses to provide distinct delivery address details in the warehouse management system. Email contacts can also be set with two in particular having special significance


* REMITTANCE - becomes the return email when bulk sending remittance advices from the batch payment routines
* STATEMENT - the default return address when issuing statements

### People

Employees can be set up under the system company and can be linked to users, if required. People set up in this way can then be linked as employees if the HR system is used at a later date.

### System Company Options

Returning to the View System Company screen, and by using the side bar option Edit [Company Name], you can edit the options for the System Company - one important option is to change the company logo which can be uploaded by clicking the button. It is also possible within this section to switch off certain modules completely, although you probably don't want to do this at this stage.

## Roles and Users

uzERP has a role based system where access to functions within the system is set up under a role. Users are then assigned a role which gives them access to the functionality required to do their job. Initially uzERP has one 'Adminstrator' role and one user - 'Admin'.

Go to the Setup -> Admin menu where there are two options:

### Roles

Under this option click 'New' or 'New Role' in the sidebar. If editing a previously set up role click the role name in the list.

The role will need a name and, optionally, a description. You can choose to allow this user to manage uzLETs on their home or module pages by checking the option.

Down the right side of the screen is a list of 'permissions' by module - which gives access to the main functions of the system and corresponds to the top level menu. By checking the appropriate option you can allow or disallow access to that particular module. The list is extensive and has a 'tree' structure giving access to lower level functions under each module.

If you have already set up users you can use the multi-select box to allocate users to this role.

### Users

Under this option click 'New' or 'New User' in the sidebar. If editing a previously set up user click the role name in the list. Each user MUST have a username - this is case sensitive. If you have set 'people' under the system company the user can be allocated to a person.

The user must then be given a password and role, and linked to a system company. If the user is not linked to a person then an email address can be added (although this is optional).

## Setting up email

<span class="attention note">In order for a user to be able to send emails from within the system, a mail server (or more specifically, a mail transfer agent (MTA)) needs to be configured on the web server that runs uzERP.</span>

A return email address for the user is required. This can be one of the following:

1. the email address in the user's details
2. the email address for the person linked to the user's details
3. If the user is allowed to send statements and/or remittances, then either the above needs to be done, or a general STATEMENT or REMITTANCE email address needs to be set up under the system company.

## Printing

If a [CUPS Print Server](https://www.cups.org/doc/overview.html) is installed and configured, uzERP will discover CUPS advertised network printers and add them to the available printers list.

The majority of uzERP outputs can be sent directly to a PDF file that opens in the browser and can be sent to any printer accessible from the local client PC, etc. This is useful where direct printing is not possible.
