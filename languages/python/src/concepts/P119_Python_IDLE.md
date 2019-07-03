# Description: Python IDLE

### Idle3
* IDLE stands for Integrated DeveLopment Environment. 
* Idle3 is an integrated development environment for python v3.x. 
* Install IDLE3 using the command `sudo apt-get install idle3`.
* Idle3 Official Documentation: [Python IDLE3](https://docs.python.org/3/library/idle.html)
* IDLE has two main window types
    - The Shell window: There should be only 1 shell window.
    - The Editor window. It is possible to have multiple editor windows simultaneously. 

### Uses of Idle
* IDLE can be used to execute a single statement just like Python Shell.
* IDLE can also be used to create, modify and execute Python scripts.
* IDLE can also be used to debug script.
* IDLE can also be used to explore data interactively.

### Launch Idle
* Launch Idle Without a Virtual Environment
    - Launch Idle using the command `idle`.
    - This uses default system python3.
* Launch using a Virtual Environment
    - Launch virtual environment.
    - Launch Idle using the command `idle` from the virtual environment prompt.
    - This uses python3 from virtual environment.

### Python Code in Shell Window 
* Type python commands one line at a time.
* Multi-line commands can be typed using colon(:) for conditions, loop, functions etc.
* The code gets executed as soon as ENTER is pressed.
* Use arrow keys to go up and re-enter the same command again.

### Python Code in Editor Window
* Create a Python Script: `Menu - File - New File`
* Type the following code.
``` 
def fibonacci(n):
    a, b = 0, 1
    for _ in range(n):
        print("*", _)
        yield a
        a, b = b, a + b

# Get the generator object
fib = fibonacci(5)
print(fib)

# Get 1 value at a time using the generator object
print()
print(next(fib))
print(next(fib))
print(next(fib))
print(next(fib))
print(next(fib))

# Get all values at once using the generator object
print()
print(list(fibonacci(10)))
```
* Save the code to a file: `Menu - File - Save`.
* Run the code: `Menu - Run - Run Module`. Alternatively press F5.

### Debug Python Script
* Launch Debugger: `Shell Window - Menu - Debug - Debugger`.
* Set Breakpoints: `Editor Window - Right click on the line - Set Breakpoint`.
* Run the code: `Menu - Run - Run Module`. Alternatively press F5.
* Use Step, Over, etc button on Debugger window to debug.

### Miscellaneous 
* Restart the shell to clean the environment.: `Shell Window - Menu - File - Restart Shell`.
* Explore System Path: `Editor Window - Menu - File - Path Browser`.
* Explore Classes and Modules: `Editor Window - Menu - File - Module Browser`.
* Check Syntax: `Editor Window - Menu - File - Check Module`.
* Show Calltip: `Editor Window - Menu - Edit - Show Call Tip`.

### TODO
* Read IDLE documentation and explore.
