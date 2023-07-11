# Database setup

> This rails application uses postgreSQL database management server. 

## Install Postgres
Run these command to install postgres database on ubuntu linux
```bash
sudo apt install postgresql postgresql-contrib
```
According to postgres documentation `postgresql` package holds the main PostgreSQL program, while `postgresql-contrib` adds several PostgreSQL features that extend its capabilities

Another dependency that needs to be installed is `libpq-dev`, which is a PostgreSQL library that allows clients to send queries and receive responses from the back-end server, which will allow your application to communicate with the database.

