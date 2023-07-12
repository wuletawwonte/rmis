# Database setup

> This rails application uses postgreSQL database management server. 

## Install Postgres
Run these command to install postgres database on ubuntu linux
```bash
sudo apt install postgresql postgresql-contrib
```
According to postgres documentation `postgresql` package holds the main PostgreSQL program, while `postgresql-contrib` adds several PostgreSQL features that extend its capabilities

Another dependency that needs to be installed is `libpq-dev`, which is a PostgreSQL library that allows clients to send queries and receive responses from the back-end server, which will allow your application to communicate with the database.

## Setup the Database

To create a PostgreSQL super user role(user), use the following command
```bash
sudo -u postgres createuser -s ictadmin -P
```
You will be prompted to enter a password for your new user. Enter your desired password. Then edit your `.env` file accordingly. 

Lastly the authentication configuration of the server must be changed from `peer` to `md5`. To do that edit the `pg_hba.conf`.

This line:
```bash
local   all             postgres                                peer
```
Should be:
```bash
local   all             postgres                                md5
```

After altering this file, don't forget to restart your PostgreSQL server using these linux command
```bash
sudo systemctl restart postgresql
```
