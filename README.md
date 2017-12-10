# crank
Devise + Background Tasks + Python
Registration + Trial + Marketing

# Creation

## Dev

```
docker pull ubuntu:14.04
docker run -it ubuntu:14.04 bash

apt-get update
apt-get install curl nano wget vim python3 curl git nfs-common build-essential zlibc zlib1g-dev bzip2 lbzip2 libreadline-dev lbzip2 libssl-dev libbz2-dev libreadline-dev mysql-client -y

# MySQL

mysql -h docker.for.mac.localhost -u maksim -p tlo_dev

# Ruby

\curl -sSL https://get.rvm.io | bash
vim /etc/group # add 0 at the end to rvm group, i.e. `rvm:x:1000:0`
source /etc/profile.d/rvm.sh
vim ~/.bashrc # =============================
# add
source /etc/profile.d/rvm.sh
# =============================
source ~/.bashrc
rvm install ruby-2.4.2
gem install bundler --no-ri --no-rdoc

# Python

curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
vim ~/.bashrc # =============================
# add
export PATH="/root/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# =============================
source ~/.bashrc 
pyenv install 3.6.3
pyenv global 3.6.3

vim ~/.bashrc # =============================
# add
_virtualenv_auto_activate() {
  if [ -f ".venv" ]; then
    _VENV_NAME=$(head -n 1 .venv)
    _ACTIVATION_SCRIPT=~/.venv/$_VENV_NAME/bin/activate
    if [ ! -f $_ACTIVATION_SCRIPT ]; then
      echo "Creating venv $_VENV_NAME"
      python -m venv ~/.venv/$_VENV_NAME
    fi
    source "$_ACTIVATION_SCRIPT"
  fi
}
PROMPT_COMMAND="_virtualenv_auto_activate;"
# =============================

source ~/.bashrc

exit # from Docker

docker commit -m "Init" <CONTAINER ID> crank.vm:latest
docker images

vi ~/.profile # =============================
# add
alias crank-run="docker run -it -p 443:443 --privileged --add-host=app.crank.vm:127.0.0.1 -e NFS_PATH=/Users/maksim/other-apps/crank crank.vm bash"
# =============================
source ~/.profile

crank-run

# NFS

mkdir /root/app
vim ~/mount_nfs.sh =============================
#!/bin/sh

echo "Mounting NFS"
mkdir -p /root/nfs_mnt
mount -vvvvvvvv -t nfs -o proto=tcp,nfsvers=3,nolock docker.for.mac.localhost:$NFS_PATH /root/app
echo "Done with NFS"
=============================

chmod +x ~/mount_nfs.sh
~/mount_nfs.sh
ls -al /root/app

# Next

MySQL separate user/db
crank:passwd

apps, bundle install, rails
```

## Staging/Prod creation