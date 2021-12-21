
## Tips


1. ```bash
   echo $RANDOM  # Return random 0-32767
   ```
   
2. ```bash
   \command  #  without using alias
   ```

3. ```bash
   mount /dev/sda2 /home
   ```
   
4. ```bash
   mount /dev/sdb_ /mnt/Files  # Other disk 
   ln -s /mnt/Files $HOME  # symlink in Home
   ```
   
4. ```bash
   sudo pkill -9 -t pts/1  # close session
   ```
    
5. ```bash
   [space]command  # without saving in history
   sudo !!  # last command with sudo 
   ```


### Autostart
* create ```/etc/systemd/system/service.service```
```bash
sudo vim /etc/systemd/system/service.service  # create custom service
sudo systemctl daemon-reload
sudo systemctl start service.service  # start custom service
sudo systemctl status service.service  # check status
sudo systemctl enable service.service  # autostart custom service
```

set caps as ctrl for tmux prefix Ctrl+a
