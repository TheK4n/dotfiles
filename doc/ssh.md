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
      PermitRootLogin no  # only sudo and su
      PubkeyAuthentication yes  # only ssh-key
      PasswordAuthentication no

      Match Host 192.168.50.*,127.0.0.1
          PermitRootLogin yes  # root only local
          Match User root
              PasswordAuthentication yes  # root auth only password from local   
      ```

https://www.opennet.ru/base/sec/ssh_tips.txt.html
