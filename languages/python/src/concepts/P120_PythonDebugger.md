# Description: Python Debugger

### Python Debugger
* [Python Debugger Documentation](https://docs.python.org/3/library/pdb.html)
* The pdb is Python’s interactive source code debugger.
* pdb is part of Python’s standard library, so it's always there and available for use.

### Invoke Python Debugger
* The python debugger can be invoked in following ways
    - Modify source
        ```
        import pdb
        
        # Add this line at the location where the code should invoke the python debugger. 
        pdb.set_trace()
        ```
    - Use breakpoint() for Python 3.7 or later
        ```
        # Add this line at the location where the code should invoke the python debugger.
        # This will 'import pdb' and call 'pdb.set_trace()' 
        breakpoint()
        ```
    - Invoke Python debugger directly from the command-line by passing the option `-m pdb`
        ``` 
        python3 -m pdb /path/to/python/source/file.py
        ```

### Common Uses of Python Debugger
* Print expressions
* Step through code with n (next) and s (step)
* Use breakpoints
* Continue execution with unt (until)
* Display expressions
* Find the caller of a function

### Python Debugger Reference
```
* p	        : Print the value of an expression.
* pp	    : Pretty-print the value of an expression.
* n	        : Continue execution until the next line in the current function is reached or it returns.
* s	        : Execute the current line and stop at the first possible occasion (either in a function that is called or 
              in the current function).
* c	        : Continue execution and only stop when a breakpoint is encountered.
* unt	    : Continue execution until the line with a number greater than the current one is reached. With a line 
              number argument, continue execution until a line with a number greater or equal to that is reached.
* l	        : List source code for the current file. Without arguments, list 11 lines around the current line or 
              continue the previous listing.
* ll	    : List the whole source code for the current function or frame.
* b	        : With no arguments, list all breaks. With a line number argument, set a breakpoint at this line in the 
              current file.
* w	        : Print a stack trace, with the most recent frame at the bottom. An arrow indicates the current frame, which 
              determines the context of most commands.
* u	        : Move the current frame count (default one) levels up in the stack trace (to an older frame).
* d	        : Move the current frame count (default one) levels down in the stack trace (to a newer frame).
* h	        : See a list of available commands.
* h <topic> : Show help for a command or topic.
* h pdb	    : Show the full pdb documentation.
* q	        : Quit the debugger and exit.
```

### TODO
* None
