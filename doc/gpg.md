## GPG

### Encrypt
1. ```gpg --full-generate-key```
2. ```gpg --export -a "thek4n" > public.key``` -a ASCII
3. ```gpg --fingerprint "thek4n"``` (send fingerprint IRL)
4. ```gpg -seaR "john" -u "thek4n" file``` -s sign, -e asymmetric, -a ASCII, -R ciphered receiver, -u secret key

### Decrypt
1. ```gpg --import public.key```
2. ```gpg --fingerprint "thek4n"``` (check fingerprint)
3. ```gpg -d --try-secret-key "john" file.asc > res.txt```

### Sign message (one file)
enc: ```gpg -u "thek4n" --clear-sign -s file``` -u secret key, --clear-sign ascii\
dec: ```gpg -d file.asc```

### Sign binary (file and sign)
enc: ```gpg -u "thek4n" -b file``` -b detached sign\
dec: ```gpg --verify file.sig file```
