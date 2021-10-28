<h1 align="center">dotfiles</h1>

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
git clone https://github.com/TheK4n/dotfiles
chmod u+x dotfiles/setup.sh
dotfiles/setup.sh
rm -rf dotfiles
```


<a id="chapter-2"></a>
## Tips


```$RANDOM``` - Return random 0-32767\
```\command``` - Without using alias



### Autostart
* create ```/etc/systemd/system/<service>.service```
```bash
sudo vim /etc/systemd/system/<service>.service  # create custom service
sudo systemctl daemon-reload
sudo systemctl start <service>.service  # start custom service
sudo systemctl status <service>.service  # check status
sudo systemctl enable <service>.service  # autostart custom service
```



<h1 align="center"><a href="#top">▲</a></h1>
