
## Tips

4. ```bash
   sudo pkill -9 -t pts/1  # close session
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
