# R/Shiny Installation with uzERP

## Apache

### Database Auth

Install postgresql dbd driver and enable modules


```
$ sudo apt-get update
$ sudo apt-get install libaprutil1-dbd-pgsql
$ sudo a2enmod proxy
$ sudo a2enmod proxy_http
$ sudo a2enmod dbd
$ sudo a2enmod authn_dbd
```

### Config

Add a new site config, e.g. /etc/apache2/sites-available/50-dashboard.example.com.conf:

```
<VirtualHost *:80>
    ServerName dashboard.example.com

    ProxyPass / http://localhost:3838/ retry=10
    ProxyPassReverse / http://localhost:3838/
    ProxyPreserveHost On

    DBDriver pgsql
    # password not needed for localhost
    DBDParams "host=localhost dbname=uzerp user=ooo-data"

    DBDMin  4
    DBDKeep 8
    DBDMax  20
    DBDExptime 300

    <ProxyMatch "/">
        # mod_authn_core and mod_auth_basic configuration
        # for mod_authn_dbd
        AuthType Basic
        AuthName "Dashboard"

        # To cache credentials, put socache ahead of dbd here
        AuthBasicProvider dbd

        # Also required for caching: tell the cache to cache dbd lookups!
        #AuthnCacheProvideFor dbd
        #AuthnCacheContext dashboard

        # mod_authz_core configuration
        Require valid-user

        # mod_authn_dbd SQL query to authenticate a user
        # Add the correct role id in the query below. Use hasrole.roleid in (1, 2) for multiple roles
        AuthDBDUserPWQuery "SELECT PASSWORD, users.username as USERNAME, EMAIL FROM users join hasrole on hasrole.username = users.username WHERE users.username = %s and hasrole.roleid = 2"
    </ProxyMatch>

    <Location "/">
        # Pass the username, etc in request headers to Shiny
        RequestHeader set X-Proxy-REMOTE-USER %{AUTHENTICATE_USERNAME}e
        RequestHeader set X-Proxy-REMOTE-EMAIL %{AUTHENTICATE_EMAIL}e
    </Location>

    # Optional friendly 'unathorised' page to show when user auth fails
    #ErrorDocument 401 /srv/shiny-server/auth.html

    ErrorLog /var/log/apache2/dashboard.log
</VirtualHost>

```

## Install R and Shiny server on Ubuntu 14.04

Install R, Shiny, Shiny Server


```
$ sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
$ gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
$ gpg -a --export E084DAB9 | sudo apt-key add -
$ sudo apt-get -y install r-base
$ sudo su - -c "R -e \"install.packages('shiny', repos='http://cran.rstudio.com/')\""
$ sudo apt-get install gdebi-core
$ sudo apt-get install gdebi-core
$ wget https://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.5.3.838-amd64.deb
$ sudo gdebi shiny-server-1.5.3.838-amd64.deb

```

Install dashboard dependencies (note: postgresql-server-dev-9.3 required to compile RPostgreSQL)

```
$ sudo apt-get install postgresql-server-dev-9.3
$ sudo su - -c "R -e \"install.packages(c('RPostgreSQL', \
'DT', \
'data.table, \
'shinydashboard', \
'ggplot2', \
'lubridate'), repos='http://cran.rstudio.com/')\""
```

## Upload Shiny app and Run

Upload shiny app to a directory in `/srv/shiny-server`

Enable site in Apache

```
$ sudo a2ensite 50-dashboard.example.com.conf
$ sudo service apache2 restart
```

The app should now be available at http://dashboard.example.com, use uzERP credentials to login.