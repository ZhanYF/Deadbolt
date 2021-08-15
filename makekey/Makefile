
DIR=/etc/keys

all: ${DIR}/privkey_evm.pem ${DIR}/pubkey_evm.pem ${DIR}/rsa_public.pem

${DIR}/privkey_ima.pem: ima.genkey makekey.sh
	./makekey.sh

${DIR}/privkey_evm.pem: ${DIR}/privkey_ima.pem
	ln -sf ${DIR}/privkey_ima.pem ${DIR}/privkey_evm.pem

${DIR}/pubkey_evm.pem: ${DIR}/pubkey_ima.pem
	ln -sf ${DIR}/pubkey_ima.pem ${DIR}/pubkey_evm.pem

${DIR}/rsa_public.pem: ${DIR}/pubkey_ima.pem
	ln -sf ${DIR}/pubkey_ima.pem ${DIR}/rsa_public.pem
