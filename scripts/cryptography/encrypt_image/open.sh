
usage() {
  echo "Usage: $0 [keyfile path]" >&2
  exit 1
}

ENCRYPTED_KEYFILE="$1"


if [ -z "$ENCRYPTED_KEYFILE" ]
then
  echo "Error: missing source file path parameter." >&2
  usage
fi

mkdir decrypted
gpg -d "$ENCRYPTED_KEYFILE" > decrypted/key.keyfile

sudo cryptsetup luksOpen encrypted/encrypted.img myEncryptedVolume --key-file decrypted/key.keyfile
shred -zun 2 decrypted/key.keyfile

sudo mount /dev/mapper/myEncryptedVolume ./decrypted

