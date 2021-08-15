
all: /etc/initramfs-tools/hooks/keys /etc/initramfs-tools/scripts/local-premount/loadkeys

/etc/initramfs-tools/hooks/keys: hooks.keys
	install -m 755 hooks.keys /etc/initramfs-tools/hooks/keys

/etc/initramfs-tools/scripts/local-premount/loadkeys: local-premount.loadkeys
	install -m 755 local-premount.loadkeys /etc/initramfs-tools/scripts/local-premount/loadkeys
