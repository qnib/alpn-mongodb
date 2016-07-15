#!/bin/bash

if [ "X${MONGO_RESTORE}" != "X" ];then
   if [ -f ${MONGO_RESTORE} ];then
      tar xf ${MONGO_RESTORE} -C /tmp/
      mongorestore /tmp/dump/
   else
      echo "Sorry, the file '${MONGO_RESTORE}' does not exist"
   fi
fi
