<h1 align="center">Kan`s dotfiles</h1>

<p align="center">
  <a href="https://github.com/TheK4n">
    <img src="https://img.shields.io/github/followers/TheK4n?label=Follow&style=social" alt="TheK4n">
  </a>
  <a href="https://github.com/TheK4n/dotfiles">
    <img src="https://img.shields.io/github/stars/TheK4n/dotfiles?style=social" alt="project">
  </a>
</p>


## Content 

* [Project description](#chapter-0)
* [Installation](#chapter-1)


<a id="chapter-0"></a>
## Project description

Config files for:
* bash
* zsh
* alacritty
* tmux
* ssh
* git
* ranger
* i3


### Prompt
<p align="center">
    <img src=".assets/prompt.png" alt="Prompt">
</p>

### i3


| Feature                 |                        Shortcut                         |
|:------------------------|:-------------------------------------------------------:|
| Full Screen             |                    <kbd>PrtScr</kbd>                    |
| Selection               |          <kbd>Shift</kbd> + <kbd>PrtScr</kbd>           |
| Active Window           |          <kbd>Super</kbd> + <kbd>PrtScr</kbd>           |
| Clipboard Full Screen   |           <kbd>Ctrl</kbd> + <kbd>PrtScr</kbd>           |
| Clipboard Selection     | <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>PrtScr</kbd>  |
| Clipboard Active Window | <kbd>Ctrl</kbd> + <kbd>Super</kbd> + <kbd>PrtScr</kbd>  |


### ZSH global aliases

| Alias                   |                      Equals                      | Description                 |
|:------------------------|:-------------------------------------------------|:----------------------------|
| `git diff L`            | `git diff \| less -R`                            | View stdout                 |
| `cat main.py S -S py`   | `cat main.py \| highlight -O ansi --syntax py`   | Highlight syntax            |
| `redis-server BG`       | `redis-server &>/dev/null &`                     | Run command in background   |


You can add your files to the `~/.subbash/bashrc.d` for bash or `~/.subzsh/zshrc.d` for zsh directory so that they automatically run in ascending order when you open a terminal.\
Example:\
`~/.subbash/bashrc.d/01_hello.sh`
```bash
echo "Hello $USER!"
```


<a id="chapter-1"></a>
## Installation

```bash
git clone https://github.com/TheK4n/dotfiles
cd dotfiles
make
```


<h1 align="center"><a href="#top">▲</a></h1>
