#!/bin/bash

mkdir /weepee-che
cd /weepee-che

git clone https://github.com/lukas2511/letsencrypt.sh.git
cp config letsencrypt.sh
cp domains.txt letsencrypt.sh

cp /weepee-che/httpd-app.conf /opt/bitnami/apps/eclipseche/conf/httpd-app.conf 
/opt/bitnami/ctlscript.sh restart apache
/weepee-che/runle.sh
cat /weepee-che/letsencrypt.sh/certs/che.ops.weepee.io/privkey.pem > /opt/bitnami/apache2/conf/server.key 
cat /weepee-che/letsencrypt.sh/certs/che.ops.weepee.io/cert.pem > /opt/bitnami/apache2/conf/server.crt 
/opt/bitnami/ctlscript.sh restart apache
cp /weepee-che/index.html /opt/bitnami/apache2/htdocs/index.html
