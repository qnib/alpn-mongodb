FROM qnib/alpn-consul

ENV MONGODB_VER=3.2.8 \
    PATH=${PATH}:/opt/mongodb/bin/
RUN apk add --update curl tar openssl \
 && mkdir -p /opt/ \
 && curl -fsL https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-${MONGODB_VER}.tgz |tar xfz - -C /opt/ \
 && mv  /opt/mongodb-linux-x86_64-${MONGODB_VER} /opt/mongodb/ \
 && mkdir -p /data/db/
ADD etc/supervisord.d/mongodb.ini \
    etc/supervisord.d/mongorestore.ini \
    /etc/supervisord.d/
ADD etc/consul.d/mongodb.json /etc/consul.d/
ADD opt/qnib/mongodb/bin/start.sh \
    opt/qnib/mongodb/bin/restore.sh \
    /opt/qnib/mongodb/bin/
ADD backup/ /backup/
