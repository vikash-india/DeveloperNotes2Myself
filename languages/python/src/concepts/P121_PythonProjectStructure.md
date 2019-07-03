# Description: Python Project Structure

### Note
* README.md: A description of your project and its goals.
* LICENSE.md: Your project's license, if it's open source.
* .gitignore: A special file that tells Git what files and directories to ignore.
* A directory with the name of your project. The Python code files should actually belong in a separate subdirectory! 
  This is very important, as our repository's root directory is going to get mighty cluttered with build files, 
  packaging scripts, virtual environments, and all manner of other things that aren't actually part of the source code. 
* Module Names Using PEP8
    - Any Python (.py) file is a module, and a bunch of modules in a directory is a package.
    - Modules are named by filenames, and packages are named by their directory name.
    - Modules should have short, all-lowercase names. Underscores can be used in the module name if it improves 
      readability. Python packages should also have short, all-lowercase names, although the use of underscores is 
      discouraged.
    - Make a directory a package by adding a file called __init__.py into it. The file can be empty but the file should
      be present. It just has to be there.
    - If __init__.py is missed in your package by mistake, it's going to do something much weirder than just failing, 
      because that makes it an implicit namespace package.
       
### Typical Project Structure
* Let's say the project name is 'fractal'.
* See `python/topics/project_structure` for the the directory structure.
* One possible project structure is as follows
```
.
└── fractal
    ├── builds
    ├── data
    │   ├── processed
    │   └── raw
    ├── dist
    ├── docs
    │   └── README.md
    ├── fractal.mypy
    ├── fractal.pylintrc
    ├── fractal.yapf
    ├── LICENSE.md
    ├── README.md
    ├── resources
    │   ├── images
    │   ├── properties
    │   │   └── local.properties
    │   └── templates
    ├── src
    │   ├── app.py
    │   ├── common
    │   │   ├── classproperty.py
    │   │   ├── constants.py
    │   │   └── __init__.py
    │   ├── __init__.py
    │   ├── __main__.py
    │   ├── package_1
    │   │   ├── __init__.py
    │   │   ├── module_11.py
    │   │   └── module_12.py
    │   └── package_2
    │       ├── __init__.py
    │       ├── module_21.py
    │       ├── module_22.py
    │       └── subpackage_21
    │           ├── __init__.py
    │           ├── module_211.py
    │           └── module_212.py
    ├── tests
    │   ├── __init__.py
    │   ├── package_1
    │   │   ├── tests_module_11.py
    │   │   └── tests_module_12.py
    │   └── package_2
    │       ├── subpackage_21
    │       │   ├── __init__.py
    │       │   ├── tests_module_211.py
    │       │   └── tests_module_212.py
    │       ├── tests_module_21.py
    │       └── tests_module_22.py
    ├── utils
    │   ├── requirements.md
    │   └── requirements.txt
    └── venvironments
```

### TODO
* Add the build related files to the project structure.
    - Shell Script
    - Ant
    - Gradle
* Add the deployment related files to the project structure.
    - Shell Script
    - Python Script
    - Ansible
* Add IDE files
    - Idea
        - .idea
        - project.iml
    - Eclipse
        - .project
