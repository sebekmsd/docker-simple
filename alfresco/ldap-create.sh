#!/bin/bash

LDAP_DATA=$('pwd')

docker run -d \
  -v $LDAP_DATA/ldap_data/:/var/lib/ldap:rw \
  -e LDAP_DOMAIN=arkhotech.com \
  -e LDAP_ADMIN_PWD=toor \
  -e LDAP_ORGANISATION="Arkhotech Ltda." \
  -p 389:389 \
  -p 80:80 \
  -p 10022:22 \
  --name ldap \
  --hostname ldapserver \
  sharaku/ldap


#  -v /path/to/ldap/etc/ldap/slapd.d/:/etc/ldap/slapd.d:rw \
