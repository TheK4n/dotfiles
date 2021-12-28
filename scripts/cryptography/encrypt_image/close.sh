sudo umount ./decrypted
sudo cryptsetup luksClose myEncryptedVolume
shred -zun 2 decrypted
