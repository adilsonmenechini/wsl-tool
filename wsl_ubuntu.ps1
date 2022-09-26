Param (
[Parameter(Mandatory=$True)][ValidateNotNull()][string]$wslInstallation,
[Parameter(Mandatory=$True)][ValidateNotNull()][string] $wslName
)

$username = ($env:username)
if ($wslInstallation -ieq "install") {
    if (-Not (Test-Path -Path C:\WSL\image )) { mkdir -p C:\WSL\image }
    if (-Not (Test-Path -Path C:\WSL\image\ubuntu.tar.gz)) { 
    # Download Ubuntu 20.04 Focal Fosa
    Invoke-WebRequest -Uri http://cloud-images-archive.ubuntu.com/releases/focal/release-20200423/ubuntu-20.04-server-cloudimg-amd64-wsl.rootfs.tar.gz -OutFile C:\WSL\image\ubuntu.tar.gz -UseBasicParsing
    }
    wsl --set-default-version 2 

    if (-Not (Test-Path -Path C:\WSL\$wslName )) { mkdir -p C:\WSL\$wslName }
    wsl --import $wslName C:\WSL\$wslName C:\WSL\image\ubuntu.tar.gz
    wsl -d $wslName /bin/bash -c "echo -e '[automount]\nenabled=true\nroot=/mnt/\noptions=\""metadata,umask=22,fmask=11\""\nmountFsTab=false\n' > /etc/wsl.conf"
    wsl -t $wslName
    wsl -d $wslName -u root -- find . -type f -name "*.sh" -print0 `| xargs -0 chmod +x
    wsl -d $wslName -u "root" -e sh -lic "./scripts/config/system/createUser.sh $username ubuntu"
    wsl -d $wslName -u "root" -e sh -ic "./scripts/config/system/sudoNoPasswd.sh $username"
    wsl -d $wslName -u $username -e sh -ic ./scripts/ansible/install.sh
    wsl -d $wslName -u "root" -e sh -ic "./scripts/config/system/sudoWithPasswd.sh $username"
    wsl --shutdown
    # Remove-Item C:\WSL\image\ubuntu-20.04-focal-wsl.tar.gz
} elseif ($wslInstallation -ieq "upgrade") {
    wsl -t $wslName
    wsl -d $wslName -u $username -e sh -ic "ansible-playbook scripts/ansible/ansible-sre.yml --ask-become-pass"
} elseif ($wslInstallation -ieq "remove") {
    wsl --unregister $wslName
    if (Test-Path -Path C:\WSL\$wslName ) { del C:\WSL\$wslName }
} else {
   write-host(" ")
   write-host(" .\wsl_ubuntu.ps1 |install | upgrade | remove| WSL-Name ")
   write-host(" ")
   write-host("Example:")
   write-host(" .\wsl_ubuntu.ps1 install $wslName ")
   write-host(" ")
}