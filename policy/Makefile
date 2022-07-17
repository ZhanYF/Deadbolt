# run "make" to configure policy load
#

all: /etc/keys/policy.ima /etc/systemd/system/ima-policy.service /usr/local/sbin/loadpol

/usr/local/sbin/loadpol: loadpol
	install -m 755 loadpol /usr/local/sbin/loadpol

/etc/systemd/system/ima-policy.service: ima-policy.service
	cp ima-policy.service /etc/systemd/system/ima-policy.service
	systemctl enable ima-policy.service

/etc/keys/policy.ima: policy.ima
	cp policy.ima /etc/keys/policy.ima

