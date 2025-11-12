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
* zsh
* alacritty
* tmux
* ssh
* git
* ranger
* sway
* vim
* nvim


### Prompt
<p align="center">
    <img src=".assets/prompt.png" alt="Prompt">
</p>

You can add your files to the  `~/.config/zsh/zshrc.d` directory for zsh so
that they automatically run in ascending order when you open a terminal.\
Example:\
`~/.config/zsh/zshrc.d/01_hello.sh`
```sh
echo "Hello $USER!"
```

<a id="chapter-1"></a>
## Installation

```sh
git clone https://github.com/TheK4n/dotfiles
cd dotfiles
./install zsh nvim ...
```


## Installation script
Per-user dotfiles "package" manager

### Features
1. Installing files from dotfiles/home/user to $HOME
2. Uninstalling installed files
3. Check installation integrity
4. Transaction based installation
5. Does not overwrite your configs


<h1 align="center"><a href="#top">▲</a></h1>
