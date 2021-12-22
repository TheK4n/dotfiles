sudo umount ./decrypted
sudo cryptsetup luksClose myEncryptedVolume
rm -fr decrypted
