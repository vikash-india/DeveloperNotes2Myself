# Description: Static File Checking Using MyPy

### Note
* References
    - [Mypy Official Documentation](https://mypy.readthedocs.io/en/latest/).
    - [Mypy Jetbrains Plugin](https://plugins.jetbrains.com/plugin/11086-mypy)

### Use mypy in IntelliJ Idea
* Go to plugins marketplace: `Menu - File - Settings - Plugins - Marketplace`.
* Search for `Mypy` plugin.
* Install plugin.
* Restart IntelliJ Idea.

### Use mypy on Command Line
* The mypy checks code statically, ie check for errors without ever running the code, just like a linter.
```
# Install mypy
pip install mypy

# Common Usages
mypy program.py         # Type check your program.py file and print out any errors it finds.
mypy directory          # Directories are checked recursively.
mypy program.py dir1    # Specify files and directories on the same line.
```

### Run pylint Using a Config File
```
# Run mypy using custom options stored in a configuration file
mypy --config-file project.mypy .
```

### The mypy Usage
```
mypy --help         # Get help
```