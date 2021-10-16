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
* [Installation](#chapter-1)
* [Tips](#chapter-2)


<a id="chapter-0"></a>
## Project description

Bash config files


[![Prompt](img/prompt.jpg)]()


<a id="chapter-1"></a>
## Installation

```bash
git clone https://github.com/thek4n/BashConfig
chmod u+x BashConfig/setup.sh
BashConfig/setup.sh
rm -rf BashConfig
```


<a id="chapter-2"></a>
## Tips


```$RANDOM``` - Return random 0-32767\
```\command``` - Without using alias

### Vim

|       Command        |   Description                           |
|:------------------   | :------------------------------------   |
|```Ctrl + [```        |  Analog Esc                             |
|```d -> Ctrl + End``` |  Delete from cursor to end of file      |
| ```u```              |  Undo                                   |
|   ```Ctrl + r```     |  Redo                                   |
|    ```22G```         |  Go to line 22                          |

<p></p>


### Autostart
* create ```/etc/systemd/system/<service>.service```
```bash
sudo vim /etc/systemd/system/<service>.service  # create custom service
sudo systemctl daemon-reload
sudo systemctl start <service>.service  # start custom service
sudo systemctl status <service>.service  # check status
sudo systemctl enable <service>.service  # autostart custom service
```

### Cron

```crontab -e```

```0 0 1 1 * script.sh``` - Every year in 1 January 00:00:00 \
```*/1 * * * * script.sh``` - Every minute\
```0 */3 * * 2,5 script.sh``` - One time per 3 hours in Tue and Fri\
```0 0,12 1 */2 * script.sh``` - At minute 0 past hour 0 and 12 on day-of-month 1 in every 2nd month


<h1 align="center"><a href="#top">▲</a></h1>
