---
title: "Installation"
description: "How to install uzERP from scratch on a linux operating system."
weight: 10
---

The target OS for a uzERP is Ubuntu 18.04 - these instructions can be modified for other distributions (see [requirements](/getting-started/requirements)) but your mileage may vary.

## Operating System

Create a basic 18.04 LTS server install from the Ubuntu ISO which can be downloaded here [https://releases.ubuntu.com/18.04/ubuntu-18.04.5-live-server-amd64.iso](https://releases.ubuntu.com/18.04/ubuntu-18.04.5-live-server-amd64.iso) or use a service such as Digital Ocean to host your uzERP instance [https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04)

You should make sure the install includes the SSH option to access the server from the command line. Update the installation and install the GB locale.... (en_US is the only locale installed by default)

````bash
sudo apt update && sudo apt upgrade -y && sudo apt autoremove
sudo locale-gen en_GB.UTF-8
sudo update-locale LANG=en_GB.UTF-8
````

Its a good idea to switch on the firewall and then allow OpenSSH access.

````bash
sudo ufw allow OpenSSH
sudo ufw enable
````

### Apache, PHP and PostgreSQL

````bash
sudo apt install apache2
sudo ufw allow in "Apache Full"
````

The latter allows for https connections at a later date.

Not strictly required, because uzERP will use the local disk if memcached is not installed, but highly recommended

````bash
sudo apt install memcached
````

We need to enable the Apache expires module

````bash
sudo a2enmod expires
````

Now install PHP (plus extras) and postgreSQL

````bash
sudo apt install php libapache2-mod-php php-pgsql php-mbstring php-bcmath php-xml php-curl
sudo apt install postgresql postgresql-contrib
````

### Printing support

We need Apache FOP, qPDF and Ghostscript so we can do some dead tree processing

````bash
sudo apt install fop qpdf ghostscript
````

Network printer discovery in uzERP requires a CUPS server - a remote VM won't find itself on a network with any printers so this can be ignored for the moment.

If barcode4j ***IS*** required you need to get it from sourceforge and copy the barcode4j-x.x.x folder to /usr/share, then update the FOP script - see [https://github.com/uzerpllp/uzerp-containers/blob/master/uzerp-app-dev/files/fop](https://github.com/uzerpllp/uzerp-containers/blob/master/uzerp-app-dev/files/fop) for more information.

## Set up postgreSQL database

### Create uzERP roles and an empty database

Note - adjust the db locale in the db creation commands below if necessary, depending on collation requirements

````bash
sudo -u postgres createuser -P -s -e sysadmin
sudo -u postgres createuser -P -e readonly
sudo -u postgres createuser -P -e ooo-data
sudo -u postgres createuser -P -e  www-data
sudo -u postgres createdb --locale=en_GB.UTF-8 --template=template0 uzerp
````

If you want a testing instance to play with you can add another database at this point.....

````bash
sudo -u postgres createdb --locale=en_GB.UTF-8 --template=template0 uzerp-test 
````

### Create directory, download and unzip latest uzERP release

uzERP releases are here [https://github.com/uzerpllp/uzerp/releases](https://github.com/uzerpllp/uzerp/releases) - change the commands below to install the release you want

````bash
sudo mkdir /var/www/uzerp
cd /var/www/uzerp
sudo wget https://github.com/uzerpllp/uzerp/releases/download/1.26.6/release-uzerp-1.26.6.tar.gz
sudo tar -xvf release-uzerp-1.26.6.tar.gz
````

The tar file can be removed or left for later to set up a test instance on the same server at a different location.

### Starter database and config

Create the starter database from the sql file included with the release - options are:

* **base** - minimalist start point and requires a fair amount of work to get going and probably not recommended without assistance
* **starter** - gets you a basic working environment to build upon
* **demo** - loads all of the demo data which may be useful for initial evaluation or testing

To populate a **starter** database:

````bash
sudo -u postgres pg_restore --dbname=uzerp /var/www/uzerp/1.26.6/schema/database/postgresql/uzerp-starter-dist.sql
````

Login to psql from the postgres user to check creation of the database

````bash
sudo su postgres
postgres$ psql -h localhost -U sysadmin uzerp
````

As a test list tables and describe the gl_accounts table

````bash
uzerp=# \d 
uzerp=# \d gl_accounts
uzerp=# \q
````

### uzERP config.php

Copy the the config file and update with db credentials

````bash
cd /var/www/uzerp/1.26.6/conf/
sudo cp config-example.php config.php
sudo pico config.php
````

Edit the config.php file and change the $conf['DB_NAME'] and $conf['DB_PASSWORD'] entries to match the database credentials for the _**www-data**_ user you set you earlier.

## Web server 

### Permissions

Make sure permissions are correct - the www-data user needs read access to files inside the document root (/var/www/uzerp/1.26.6 in this case) and write access to the following directories:

- data/cache
- data/tmp
- data/users
- data/templates_c

It may be necessary to create the cache directory manually if it does not already exist.

````bash
sudo chgrp -hR www-data /var/www/uzerp/
sudo chown -hR www-data templates_c/
sudo chown -hR www-data tmp
sudo chown -hR www-data users/
````

### PHP and FOP settings

There are some PHP and FOP settings that need to be changed in a production environment. To allow posting of large forms and increase PHP's memory limit for some processes edit php.ini so that the variables match the settings below:

````ini
max_input_vars = 5000
````

````ini
memory_limit = 512
````

Also in php.ini, for security reasons, we need to prevent the session cookie being read by javascript by setting the following:

````ini
session.cookie_httponly = true
````

If running under TLS we can ensure that the session cookie is only available in TLS requests as follows:

````ini
session.cookie_secure = true
````

We have also found that the Java Heap size needs to be larger for some FOP outputs. To do that, edit the file  /etc/fop.conf.d/headless.conf so that it contains the following:

````ini
HEADLESS="-Xmx1024m -Djava.awt.headless=true"
````

### Apache vhost set up

[https://www.digitalocean.com/community/tutorials/how-to-set-up-apache-virtual-hosts-on-ubuntu-18-04](https://www.digitalocean.com/community/tutorials/how-to-set-up-apache-virtual-hosts-on-ubuntu-18-04)

````bash
sudo pico /etc/apache2/sites-available/25-uzerp.conf 
````

An example Apache virtual hosts file is shown here which can be cut and pasted in - pay particular attention to the DocumentRoot and Directory entries. Everything else can be left as is.

````apache
<VirtualHost *:80>
  ServerName {{ the server name goes here - example = uzerp.local }}
  ServerSignature off
  TraceEnable off
  DocumentRoot "/var/www/uzerp/1.26.6"
  <Directory "/var/www/uzerp/1.26.6">
    Options -Indexes +FollowSymLinks -MultiViews
    AllowOverride None
    Require all granted
    AddOutputFilterByType DEFLATE text/plain
    AddOutputFilterByType DEFLATE text/html
    AddOutputFilterByType DEFLATE text/xml
    AddOutputFilterByType DEFLATE text/css
    AddOutputFilterByType DEFLATE application/xml
    AddOutputFilterByType DEFLATE application/xhtml+xml
    AddOutputFilterByType DEFLATE application/javascript
    AddOutputFilterByType DEFLATE application/x-javascript
    AddOutputFilterByType DEFLATE application/json
    # Set Cache-Control headers based on access
    ExpiresActive On
    ExpiresByType application/javascript "access plus 48 hours"
    ExpiresByType application/x-javascript "access plus 48 hours"
    ExpiresByType text/css "access plus 48 hours"
    ExpiresByType image/gif "access plus 48 hours"
    ExpiresByType image/png "access plus 48 hours"
    ExpiresByType image/jpeg "access plus 48 hours"
  </Directory>
  ## RedirectMatch rules
  RedirectMatch 404 ^/conf/.*$
  RedirectMatch 404 ^/utils/.*$
  RedirectMatch 404 ^/plugins/.*$
  RedirectMatch 404 ^/schema/.*$
  RedirectMatch 404 ^/vendor/.*$
  RedirectMatch 404 ^/composer.*$
  RedirectMatch 404 ^/phinx.*$
  RedirectMatch 404 ^/user/(?!theme.*.css)
  ## Logging
  ErrorLog "/var/log/apache2/uzerp_error.log"
  CustomLog "/var/log/apache2/uzerp_access.log" combined
</VirtualHost> 
````

Disable the default site, enable the uzERP vhost and restart Apache.

````bash
sudo a2dissite 000-default.conf
sudo a2ensite 25-uzerp.conf 
sudo systemctl restart apache2
````

At this point your server should respond on port 80 (by default) with a uzERP login - the credentials are admin/admin which should be changed as soon as possible after setup.

If you want a test instance then another vhost file will be required pointing to the relevant DocumentRoot.

## Beyond the basics

### HTTPS with Let's Encrypt

It is highly recommended that a production deployment should be secured with Let's Encrypt to provide a TLS/SSL certificate and enable encrypted HTTPS traffic.

More information on setting this up on an Ubuntu 18.04 server can be found here [https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu-18-04](https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu-18-04)
