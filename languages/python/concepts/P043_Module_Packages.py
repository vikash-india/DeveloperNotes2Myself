# Description: Packages in Python

# Notes
# 1. A collection of modules is called a package.
# 2. Packages are a way of structuring Python's module namespace by using "dotted module names".
# 3. The module name A.B means a submodule named B in a package named A.
# 4. When importing a package, Python searches through the directories on sys.path looking for the package subdirectory.
# 5. The __init__.py files are required to make Python treat the directories as containing packages; this is done to
#    prevent directories with a common name, such as string, from unintentionally hiding valid modules that occur later
#    on the module search path.

# Method 1: Importing individual module from a package.
# 1. When using syntax like import item.subitem.subsubitem, each item except for the last must be a package; the last
#    item can be a module or a package but can't be a class or function or variable defined in the previous item.

# An example Directory Structure
# sound/                         Top-level package
#      __init__.py               Initialize the sound package
#      formats/                  Subpackage for file format conversions
#              __init__.py
#              wavread.py
#              wavwrite.py
#              aiffread.py
#              aiffwrite.py
#              auread.py
#              auwrite.py
#              ...
#      effects/                  Subpackage for sound effects
#              __init__.py
#              echo.py
#              surround.py
#              reverse.py
#              ...
#      filters/                  Subpackage for filters
#              __init__.py
#              equalizer.py
#              vocoder.py
#              karaoke.py
#              ...

import sound.effects.echo

# Method 2: Loads the submodule sound.effects.echo. It must be referenced with its full name.
sound.effects.echo.echofilter(input, delay = 0.7, atten = 4)

# Method 3: An alternative way of importing the submodule
from sound.effects import echo

# Method 4: Another alternative way of importing the desired function or variable
# 1. When using from package import item, the item can be either a submodule (or subpackage) of the package, or some
#    other name defined in the package, like a function, class or variable.
# 2. The import statement first tests whether the item is defined in the package; if not, it assumes it is a module and
#    attempts to load it. If it fails to find it, an ImportError exception is raised.
from sound.effects.echo import echofilter

echofilter(input, delay=0.7, atten=4)

# Method 5:  Importing * From a Package
# 1. If a package's __init__.py code defines a list named __all__, it is taken to be the list of module names that
#    should be imported when from package import * is encountered.
