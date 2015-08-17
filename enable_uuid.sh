#!/bin/bash

# Enable uuid_ossp in postgres
sudo -u postgres -H -- psql -d docker -c "CREATE EXTENSION \"uuid-ossp\";"
