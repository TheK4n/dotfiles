`/etc/ssh/sshd_config`
* Adding public key to remote machine :\
     * ```ssh remotehost "umask 077; cat > .ssh/authorized_keys" < .ssh/id_rsa_backup.pub```
     

* Access for VPS:
     * ```
       PubkeyAuthentication yes
       
       PasswordAuthentication no
       Match User root
           PasswordAuthentication yes
       ```

* For local server:
    * ```
      PubkeyAuthentication yes  # only ssh-key
      
      PermitRootLogin no  # only sudo and su
      Match Host 192.168.5.*,127.0.0.1
          PermitRootLogin yes  # root only local
      
      PasswordAuthentication no
      Match User root
          PasswordAuthentication yes  # root auth only password from local
      ```

https://www.opennet.ru/base/sec/ssh_tips.txt.html