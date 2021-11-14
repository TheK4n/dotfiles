
## Tips


```$RANDOM``` - Return random 0-32767\
```\command``` - Without using alias



### Autostart
* create ```/etc/systemd/system/service.service```
```bash
sudo vim /etc/systemd/system/service.service  # create custom service
sudo systemctl daemon-reload
sudo systemctl start service.service  # start custom service
sudo systemctl status service.service  # check status
sudo systemctl enable service.service  # autostart custom service
```
