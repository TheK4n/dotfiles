# BashConfig

## SSH:

Create ssh key on local device

`ssh-keygen`

1. Save to `~/.ssh`
2. Copy content of `~/.ssh/id_rsa.pub` key to remote `~/.ssh/authorized_keys`


**~/.ssh/config:**
```
Host host_name
   HostName ip
   Port 22
   User root
   IdentityFile ~/.ssh/id_rsa
 ```

*Examples:*
```bash
ssh host_name
sftp host_name
```