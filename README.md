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


[![Prompt](img/prompt.jpg)]()

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


### White and black lists

add white list to ```/etc/hosts.allow```:
```text
sshd: 10.83.33.77/32, 10.63.152.9/32, 10.12.100.11/28, 10.82.192.0/28
```

add black list to ```/etc/hosts.deny```:
```text
sshd: ALL
```

<a id="chapter-2"></a>
## Tips

### Bash
|       Command                       |   Description            |
|:------------------:                 | :------------------      |
|```Alt + . ``` ```Esc + .```         | Last object              |
|```Ctrl + r```                       | Search by bash_history   |
|```Ctrl + l```                       | Clear, like command clear |

```bash
rm -rf ~/BashConfig; git clone https://github.com/TheK4n/BashConfig && cp BashConfig/.bash* ~; rm -rf ~/BashConfig && . ~/.bashrc
```

```$RANDOM``` - Return random 0-32767\
```/command``` - Without using alias\
```df -h /``` - Size 

### Vim

|       Command        |   Description                           |
|:------------------:  | :------------------------------------   |
|```Ctrl + [```        |  Analog Esc                             |
|```d -> Ctrl + End``` |  Delete from cursor to end of file      |
| ```u```              |  Undo                                   |
|   ```Ctrl + r```     |  Redo                                   |
|    ```22G```         |  Go to line 22                          |

<p></p>


### Autostart
* create ```/etc/systemd/system/<service>.service```
```bash
sudo vim /etc/systemd/system/<service>.service
sudo systemctl daemon-reload
sudo systemctl start <service>.service
sudo systemctl status <service>.service
sudo systemctl enable <service>.service
```

### Cron

```crontab -e```

```0 0 1 1 * command.sh``` - Every year in 1 January 00:00:00 \
```*/1 * * * * command.sh``` - Every minute\
```0 */3 * * 2,5 command.sh``` - One time per 3 hours in Tue and Fri\
```0 0,12 1 */2 * command.sh``` - At minute 0 past hour 0 and 12 on day-of-month 1 in every 2nd month


<h1 align="center"><a href="#top">▲</a></h1>
