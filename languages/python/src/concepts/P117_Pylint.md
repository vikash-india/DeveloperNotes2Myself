# Description: Linting Using pylint

### Note
* The pylint is a tool for finding bugs and style problems in Python source code. It finds problems that are typically 
  caught by a compiler for less dynamic languages like C and C++. Because of the dynamic nature of Python, some warnings 
  may be incorrect; however, spurious warnings should be fairly infrequent.
* Pylint catches easy-to-miss errors like typos, using-vars-before-assignment, etc.
* The pylint isn't perfect, just like it is case with other lint tools for other dynamic languages. To take advantage 
  of it, one might have to do the following 
    - Write around it 
    - Suppress its warnings 
    - Improve it
* References
    - [Lint Official Website](https://www.pylint.org/)
    - [Pylint Official Documentation](https://pylint.readthedocs.io/en/latest/).
    - [Pylint Jetbrains Plugin](https://plugins.jetbrains.com/plugin/11084-pylint)

### Use pylint in IntelliJ Idea
* Go to plugins marketplace: `Menu - File - Settings - Plugins - Marketplace`.
* Search for `pylint` plugin.
* Install plugin.
* Restart IntelliJ Idea.

### Use pylint on Command Line
* The general syntax of pylint is `pylint [options] module_or_package`.
``` 
# Install yapf
pip install pylint

pylint mymodule.py

pylint mymodule.py              # Should always work since the current working directory is automatically added on top  
                                # of the python path.
pylint directory/mymodule.py    # Will work if directory is a python package (ie has an __init__.py file or it is an 
                                # implicit namespace package) or if "directory" is in the python path.
pylint-gui                      # Start a thin gui around pylint. Enter the name of the package or module to check, at 
                                # Pylint messages will be displayed in the user interface.

# Parallel Execution of Pylint
# - If the computer has more than one CPU, then the files for checking could be spread on all cores via Pylints's 
#   sub-processes. This functionality is exposed via -j command line parameter. 
# - Use a number with option -j to specify the number of CPUs.
# - If the provided number is 0, then the total number of CPUs will be used.
pylint -j 4 mymodule1.py mymodule2.py mymodule3.py mymodule4.py

# Run pylint recursively 
pylint -j 4 *.py                # Run pylint on all python files in a directory
pylint -j 4 **/*.py             # Run pylint on all python files in a directory and its subdirectories
pylint -j 4 *.py **/*.py        # In case the above one does not work due to name globbling.

pylint --list-msgs              # Get a list of pylint warnings.
pylint --help-msg=C6409         # Get more information on a particular message.

```

### Run pylint Using a Config File
```
# Run pylint using custom options stored in a configuration file
pylint --rcfile=.pylintrc -j 4 <directory_name>
```

### The Pylint Command Line Options
```
--version	                    # Show program's version number and exit.
-h                              # Show help about the command line options.
--help	                        # Show help about the command line options.

--ignore=<file[,file…]>         # Add files or directories to the blacklist. They should be base names, not paths.
--output-format=<format>        # Select output format (text, html, custom).
--msg-template=<template>       # Modify text output message template.
--list-msgs	                    # Generate pylint's messages.
--full-documentation            # Generate pylint's full documentation, in reST format.
```
