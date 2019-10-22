#!/bin/sh
# 2015 - Original: Whistle Master
# 2019 - Modified by: Andreas Nilsen <adde88@gmail.com>


[[ -f /tmp/SSLsplitNG_certificate.progress ]] && {
  exit 0
}

touch /tmp/SSLsplitNG_certificate.progress

# Generate the SSL certificate authority and key for SSLsplitNG to use
openssl genrsa -out /pineapple/modules/SSLsplitNG/cert/certificate.key 1024
openssl req -new -nodes -x509 -sha1 -out /pineapple/modules/SSLsplitNG/cert/certificate.crt -key /pineapple/modules/SSLsplitNG/cert/certificate.key -config /pineapple/modules/SSLsplitNG/cert/openssl.cnf -extensions v3_ca -subj '/O=SSLsplit Root CA/CN=SSLsplit Root CA/' -set_serial 0 -days 3650

rm -rf /tmp/SSLsplitNG_certificate.progress
