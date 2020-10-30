# Description: Python Package Installation 

### Note
* The term 'package' in this context is a synonym for a distribution (ie a bundle of software to be installed) not to 
  refer to the kind of package that is import in Python source code (ie a container of modules).
* The pip package can install from either Source Distributions (sdist) or Wheels, but if both are present on PyPI, pip 
  will prefer a compatible wheel.
* The Python Package Index, abbreviated as PyPI and also known as the Cheese Shop, is the official third-party software 
  repository for Python. It is similar to CPAN, the repository for Perl.
* Wheels are a pre-built distribution format that provides faster installation compared to Source Distributions (sdist), 
  especially when a project contains compiled extensions.

### Install Packages
```
# Install the latest version of <package>
pip install "<package>"

# Install a specific version
pip install "<package>==1.4"

# Install package greater than or equal to one version and less than another
pip install "<package>>=1,<2"

# Install a version that's "compatible" with a certain version
pip install "<package>~=1.4.2"
```

### Upgrade Packages
```
# Upgrade package to the latest version
pip install --upgrade <package>
```

### Remove Package
* Packages installed using pip can be uninstalled completely using pip.
```
# Remove a package
pip uninstall <package>
```

### Install Using a Requirements File
* A list of packages can be installed at one go using a requirements file.
* The requirements file for each project can be checked in. 
```
# Typical content of a requirements.txt file
redis==2.10.2
configparser==3.4.0
argparse==1.1.1

# Install packages using requirements file
pip install -r requirements.txt
```
