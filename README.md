<h1 align="center">BashConfig</h1>

<p align="center">
  <a href="https://github.com/TheK4n">
    <img src="https://img.shields.io/github/followers/TheK4n?label=Follow&style=social">
  </a>
  <a href="https://github.com/TheK4n/BashConfig">
    <img src="https://img.shields.io/github/stars/TheK4n/BashConfig?style=social">
  </a>
</p>


## Content
* [Project description](#chapter-0)
* [SSH](#chapter-1)
* [Tips](#chapter-2)


<a id="chapter-0"></a>
## Project description

Bash config files


<a id="chapter-1"></a>
## SSH

Create ssh key on local device

1. `ssh-keygen`
2. Save to `~/.ssh`
3. Enter passphrase 
4. Copy content of `~/.ssh/id_rsa.pub` key to remote `~/.ssh/authorized_keys`

\
Add aliases for ssh to `~/.ssh/config`:
```
Host host_name
   HostName ip
   Port 22
   User root
   IdentityFile ~/.ssh/id_rsa
 ```

\
Using aliases:
```bash
ssh host_name
sftp host_name
```

<a id="chapter-2"></a>
## Tips

### Bash
|       Command                       |   Description            |
|:------------------:                 | :------------------      |
|```Alt + . ``` ```Esc + .```         | Last object              |
|```Ctrl + r```                       | Search by bash_history   |
|```Ctrl + l```                       | Clear, like command clear |


### Vim

|       Command        |   Description                           |
|:------------------:  | :------------------------------------   |
|```Ctrl + [```        |  Analog Esc                             |
|```d -> Ctrl + End``` |  Delete from cursor to end of file      |
| ```u```              |  Undo                                   |
|   ```Ctrl + r```     |  Redo                                   |
|    ```22G```         |  Go to line 22

<p></p>

#### Update .bashrc .bash_aliases by ssh
```bash
ssh hosting 'rm -rf ~/BashConfig; git clone https://github.com/TheK4n/BashConfig && cp BashConfig/.bash* ~/BashConfig; rm -rf ~/BashConfig'
```


### Autostart

```bash
sudo vim /etc/systemd/system/<your_bot_name>.service
sudo systemctl daemon-reload
sudo systemctl start <your_bot_name>.service
sudo systemctl status <your_bot_name>.service
sudo systemctl enable <your_bot_name>.service
```

**"/etc/systemd/system/<your_bot_name>.service"**
```text
[Unit]
Description=<DESCRIPTION>
After=network.target

[Service]
Type=simple
User=<username>
Group=<user_group>

ExecStart=<full_path_to_executor> <full_path_to_script>
ExecReload=<full_path_to_executor> <full_path_to_script>
WorkingDirectory=<full_path_to_bot>
KillMode=process
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
```

<h1 align="center"><a href="#top">▲</a></h1>



