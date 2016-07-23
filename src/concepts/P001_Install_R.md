# Description: Install R

### Install Default (and probably OLD) version of R
```
sudo apt-get install r-base
```

### Install the Latest Version of R
```
# Uninstall old R
sudo apt-get remove r-base-core

# Open sources.list file, add the following to the file, save and exit the file
sudo gvim /etc/apt/sources.list
deb http://cran.rstudio.com/bin/linux/ubuntu trusty/

# Now update the keys and install the latest version of R
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
sudo add-apt-repository ppa:marutter/rdev
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install r-base
```

### Note
1. None
