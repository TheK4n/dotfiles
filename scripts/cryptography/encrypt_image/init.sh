
mkdir decrypted
mkdir encrypted && cd encrypted

# create image size 1GB
dd if=/dev/zero of=encrypted.img bs=1 count=0 seek=1G

# create keyfile
dd if=/dev/random of=key.keyfile bs=1024 count=2

# create encrypted image with keyfile
sudo cryptsetup luksFormat encrypted.img key.keyfile

echo "Enter passphrase( first half - your master key, last half - random passphrase on paper )"

# encrypt keyfile with passphrase

# decrypt image
sudo cryptsetup luksOpen encrypted.img myEncryptedVolume --key-file key.keyfile

gpg -c key.keyfile
shred -zun 2 key.keyfile

sudo mkfs.ext4 /dev/mapper/myEncryptedVolume
sudo mount /dev/mapper/myEncryptedVolume ../decrypted
sudo chown -R $USER ../decrypted


# close image
sudo umount ../decrypted
sudo cryptsetup luksClose myEncryptedVolume
rm -fr ../decrypted

echo "move encrypted/key.keyfile on external media"
