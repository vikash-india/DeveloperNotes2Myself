# Description: Python Installation

### Note
* This will work on both, Ubuntu 16.04 and 18.04.
* Current stable version is 3.7.3. Modify the version below if needed.
* Always install specific python version WITHOUT overwriting the system python or else it can break the system.

### Install Python 3.7.3  via PPA
```
# Check the currently installed python
python -V       # Say Python 2.7.12
python3 -V      # Say Python 3.5.2

# Update the packages list and install the prerequisites.
sudo apt-get update
sudo apt-get install software-properties-common

# Add the PPA for 3.7/3.7.3
sudo add-apt-repository ppa:deadsnakes/ppa

# Install Python
sudo apt-get update
sudo apt-get install python3.7

# Check Installation
python3.7 --version

# Verify that other system versions exist
python -V       # Python 2.7.12
python3 -V      # Python 3.5.2
```

### Install Python 3.7.3 MANUALLY from Source
```
# Install required packages needed to build Python from source
sudo apt-get update
sudo apt-get install build-essential 
sudo apt-get install zlib1g-dev 
sudo apt-get install libncurses5-dev 
sudo apt-get install libgdbm-dev 
sudo apt-get install libnss3-dev 
sudo apt-get install libssl-dev 
sudo apt-get install libreadline-dev 
sudo apt-get install libffi-dev 
sudo apt-get install wget

# Get the source code
cd /tmp
wget https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tgz

# Extract and Configure 
tar -xf Python-3.7.3.tgz
cd Python-3.7.3
./configure --enable-optimizations

# Build Python and Install
# 1. Replace the 4 with the number of CPU cores on the system for faster build time.
# 2. Use altinstall. Do not use the standard make install as it will overwrite the default system python3 binary. 
make -j 4
sudo make altinstall

# Check Installation
python3.7 --version

# Verify that other system versions exist
python -V       # Python 2.7.12
python3 -V      # Python 3.5.2
```

### Install Python 3.6.3  via PPA
```bash
# Check the currently installed python
python -V       # Python 2.7.12
python3 -V      # Python 3.5.2

# Update the packages list and install the prerequisites.
sudo apt-get update
sudo apt-get install software-properties-common python-software-properties

# Add the PPA for 3.6/3.6.3
sudo add-apt-repository ppa:jonathonf/python-3.6

# Install Python
sudo apt-get update
sudo apt-get install python3.6

# Check Installation
python3.6 --version

# Verify that other system versions exist
python -V       # Python 2.7.12
python3 -V      # Python 3.5.2
```

### Install Python 3.6.3 MANUALLY from Source
```
# Install required packages needed to build Python from source
sudo apt-get update
sudo apt-get install make 
sudo apt-get install build-essential 
sudo apt-get install libssl-dev 
sudo apt-get install zlib1g-dev 
sudo apt-get install libbz2-dev 
sudo apt-get install libreadline-dev 
sudo apt-get install libsqlite3-dev 
sudo apt-get install wget 
sudo apt-get install curl 
sudo apt-get install llvm 
sudo apt-get install libncurses5-dev  
sudo apt-get install libncursesw5-dev 
sudo apt-get install xz-utils 
sudo apt-get install tk-dev

# Get the source code
cd /tmp
wget https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tgz

# Extract and Configure 
tar -xvf Python-3.6.3.tgz
cd Python-3.6.3
./configure --enable-optimizations

# Build Python and Install
# 1. Replace the 4 with the number of CPU cores on the system for faster build time.
# 2. Use altinstall. Do not use the standard make install as it will overwrite the default system python3 binary. 
make -j 4
sudo make altinstall

# Check Installation
python3.7 --version

# Verify that other system versions exist
python -V       # Python 2.7.12
python3 -V      # Python 3.5.2
```
