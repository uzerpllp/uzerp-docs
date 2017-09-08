# Copy Live Data to a Test System

When we install uzERP for customers we install a *live* instance and a *test* instance. The *test* instance is for testing, training, etc. and it is often useful for it to run on a recent copy of the live system.

To make a copy of the live system database and load it to the test system, use the following procedure.

<span class="attention note">Change the placeholders *[dump-file-name.sql]* and *[test-db-name]* in the commands, below, to suit your own uzERP configuration.</span>

1. Dump a copy of the live database:

`sudo -u postgres pg_dump -Fc uzerp-live > [dump-file-name.sql]`

2. Delete the existing test database:

`sudo -u postgres dropdb [test-db-name]`

3. Create an empty test database:

`sudo -u postgres createdb --locale=en_GB.UTF-8 [test-db-name]`

4. Load the dumped data into the test database:

`sudo -u postgres pg_restore --dbname=uzerp-test [dump-file-name.sql]`

5. Vacuum the database:

`sudo -u postgres /usr/bin/vacuumdb -z [test-db-name]`

