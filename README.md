<h1 align="center">BashConfig</h1>

<p align="center">
  <a href="https://github.com/Pendosv">
    <img src="https://img.shields.io/github/followers/Pendosv?label=Follow&style=social">
  </a>
  <a href="https://github.com/Pendosv/BashConfig">
    <img src="https://img.shields.io/github/stars/Pendosv/BashConfig?style=social">
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
|       Command        |   Description            |
|:------------------:  | :------------------      |
|```Esc + .```         | Last object              |
|```Ctrl + r```        | Search by bash_history   |
|```Ctrl + l```        | Clear, like command clear |


### Vim

|       Command        |   Description                           |
|:------------------:  | :------------------------------------   |
|```Ctrl + [```        |  Analog Esc                             |
|```d -> Ctrl + End``` |  Delete from cursor to end of file      |
| ```u```              |  Cancel last command                    |
|   ```Ctrl + r```     |  Cancel cancel                          |
|    ```22G```         |  Go to line 22                          |

<h1 align="center"><a href="#top">▲</a></h1>
