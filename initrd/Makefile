# run "make" to configure initrd to have the keys, then generate a new initrd and boot it
# after booting with the initrd containing /etc/keys run "make stage2" to generate the blobs
# then make a new initrd and boot again
#
# need to find a simpler process for this!

all: /etc/initramfs-tools/hooks/keys /etc/initramfs-tools/scripts/local-premount/loadkeys

/etc/initramfs-tools/hooks/keys: hooks.keys
	install -m 755 hooks.keys /etc/initramfs-tools/hooks/keys

/etc/initramfs-tools/scripts/local-premount/loadkeys: local-premount.loadkeys
	install -m 755 local-premount.loadkeys /etc/initramfs-tools/scripts/local-premount/loadkeys

stage2:
	dd if=/dev/urandom bs=1 count=32 status=none | keyctl padd user kmk-user @u
	keyctl print `keyctl search @u user kmk-user` > /etc/keys/kmk-user.blob
	keyctl add encrypted evm-key "new user:kmk-user 32" @u
	keyctl pipe `keyctl search @u encrypted evm-key` > /etc/keys/evm-user.blob

