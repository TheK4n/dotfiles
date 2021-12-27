## GPG

Caching passphrases disable:
```bash
echo -e "default-cache-ttl 1\nmax-cache-ttl 1" > ~/.gnupg/gpg-agent.conf; echo RELOADAGENT | gpg-connect-agent
```

### Encrypt
1. ```gpg --full-generate-key```
2. ```gpg —export -a "thek4n" > public.key``` -a ASCII
3. ```gpg --fingerprint "thek4n"``` (send fingerprint IRL)
4. ```gpg -seaR "john" -u "thek4n" file``` -s sign, -e asymmetric, -a ASCII, -R ciphered receiver, -u key to sign

### Decrypt
4. ```gpg —import public.key```
5. ```gpg --fingerprint "thek4n"``` (check fingerprint)
7. ```gpg -d --try-secret-key "john" file.asc > file```

### Sign message (one file)
1. ```gpg -u "thek4n" --clear-sign -s file``` -u secret key, --clear-sign message
2. ```gpg -d file.asc```

### Sign binary (file and sign)
3. ```gpg -u "thek4n" -b file``` -b detached sign
4. ```gpg --verify file.sig file```