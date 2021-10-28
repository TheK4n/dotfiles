### GPG

Caching passphrases disable:
```bash
echo -e "default-cache-ttl 1\nmax-cache-ttl 1" > ~/.gnupg/gpg-agent.conf; echo RELOADAGENT | gpg-connect-agent
```

\
Generate key:\
```gpg --full-generate-key```


Encrypt:\
```gpg -e file.txt```

```text
-e — asymmetric encryption
-c — symmetric encryption
-r 'id' — encrypt data for a user with a specific id
```

Decrypt:\
```gpg -d file.txt.gpg```

