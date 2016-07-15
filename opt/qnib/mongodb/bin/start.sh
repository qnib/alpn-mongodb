#!/usr/local/bin/dumb-init /bin/bash

cd /var/lib/mongodb/
mongod --rest
