#!/bin/sh

GENKEY=ima.genkey

cat << __EOF__ >$GENKEY
[ req ]
default_bits = 1024
distinguished_name = req_distinguished_name
prompt = no
string_mask = utf8only
x509_extensions = v3_usr

[ req_distinguished_name ]
O = `hostname`
CN = `whoami` 2 signing key
emailAddress = `whoami`@`hostname`

[ v3_usr ]
basicConstraints=critical,CA:FALSE
#basicConstraints=CA:FALSE
keyUsage=digitalSignature
#keyUsage = nonRepudiation, digitalSignature, keyEncipherment
subjectKeyIdentifier=hash
authorityKeyIdentifier=keyid
#authorityKeyIdentifier=keyid,issuer
__EOF__

DIR=/etc/keys
mkdir -p $DIR
openssl req -new -nodes -utf8 -sha1 -days 365 -batch -config $GENKEY \
                -out csr_ima.pem -keyout $DIR/privkey_ima.pem
SIGN=../samples/signing_key.pem
openssl x509 -req -in csr_ima.pem -days 365 -extfile $GENKEY -extensions v3_usr \
                -CA $SIGN -CAkey $SIGN -CAcreateserial \
                -outform DER -out $DIR/x509_ima.der

openssl x509 -inform DER -in $DIR/x509_ima.der -pubkey -out $DIR/pubkey_ima.pem

