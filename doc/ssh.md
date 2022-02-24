`/etc/ssh/sshd_config`
     

* Access for VPS:
     * ```
       PubkeyAuthentication yes
       PasswordAuthentication no  # only ssh-key
       
       Match User root
           PasswordAuthentication yes
       ```

* For local server:
    * ```
      PermitRootLogin no  # only sudo and su
      PubkeyAuthentication yes
      PasswordAuthentication no  # only ssh-key

      Match Host 192.168.50.*,127.0.0.1
          PermitRootLogin yes  # root only local
          Match User root
              PasswordAuthentication yes  # root auth only password from local   
      ```

https://www.opennet.ru/base/sec/ssh_tips.txt.html
