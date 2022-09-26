# WSL ubuntu-2004-focal
## Powershell CLI

*powershell´s administrator*

* Create wsl ubuntu ```.\wsl_ubuntu.ps1 install name-wsl ```

* Upgrade wsl ubuntu ```.\wsl_ubuntu.ps1 upgrade name-wsl ```

* Remove wsl ubuntu ```.\wsl_ubuntu.ps1 remove name-wsl ```

## Requirement

[Install WSL](https://docs.microsoft.com/pt-br/windows/wsl/install-manual)

## Installation
*Obs*: All packages are optional, change fields [All](../wsl/scripts/ansible/group_vars/all.yml)

- enable(*yes*)

- disable(*no*) 

### Packages
* aws
* azure
* docker
* common
    - afuse
    - aptitude
    - axel
    - blueman
    - bash-completion
    - build-essential
    - bzip2
    - colortest
    - curl
    - diffutils
    - dnsutils
    - dos2unix
    - fdupes
    - ftp-ssl
    - gawk
    - gcc
    - grep
    - gzip
    - htop
    - httping
    - iftop
    - imagemagick
    - iotop
    - less
    - lftp
    - make
    - mtr
    - nfs-common
    - nmap
    - openssl
    - p7zip
    - pv
    - pwgen
    - ranger
    - rar
    - rsync
    - smbclient
    - software-properties-common
    - sshfs
    - sshpass
    - tar
    - tmux
    - trash-cli
    - tig
    - tree
    - unzip
    - vim
    - wget
    - whois
    - zip
    - zsh
    - zsh-common
* git
* golang
* kubernetes
    - kubectl
    - kubectx
    - kubens
    - kubie
    - stern
* locales
* python
    - pip
* package_manager
    - homebrew
    - snapd
* terraform 
    - terraform tfenv
    - terragrunt tgenv 
* zsh

    zsh_ohmy_custom_themes: powerlevel10k

    zsh_ohmy_plugins:
    - git
    - git-flow
    - docker
    - zsh-syntax-highlighting
    - zsh-autosuggestions
    - zsh-completions
    - kubectl
