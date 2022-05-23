+++
title = "uzERP Software Requirements"
tags = ["needs review"]
+++
## Required OS Packages

These package names are from Ubuntu, other distributions may use different names.

- apache2 *(Using either mod_php or proxying to php-fpm or other fcgi. Alternatively Nginx/php-fpm)*
- postgres (version 9.3)
- memcached *(Not strictly required, because uzERP will use the local disk if memcached is not installed, but highly recommended)*
- fop
- php (version 5.6)
- php-memcached
- php-pgsql
- php-bcmath
- php-xml
- pdftk

## Optional OS Packages

- cups (cups print server, required for direct [printing](/Setup/Initial-Setup#printing) to printers)
- postfix/Exim ([mail](/Setup/Initial-Setup#setting-up-email) MTA for sending documents from uzERP, e.g. Invoices, Purchase Orders)
- ghostscript (PDF thumbnails use the 'convert' utility)
- php-curl (used by sentry logging)

## Development Requirements

The following are only required to build a uzERP release package. Official, pre-built release packages are available from [github](https://github.com/uzerpllp/uzerp/releases).

- npm (Node package manager to install gulp)
- gulp (gulp task runner for building css and javascript)
- composer (for installing PHP dependencies)
