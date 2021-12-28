sudo umount ./decrypted
sudo cryptsetup luksClose myEncryptedVolume
rm -rf decrypted
