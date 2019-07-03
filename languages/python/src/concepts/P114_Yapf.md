# Description: Code Formatting Using yapf

### YAPF
* YAPF - Yet Another Python Formatter.
* Auto-formatter tools like autopep8 serve slightly different roles. The autopep8's focus is larger than just 
  whitespace and formatting, and it won't touch code that isn't violating PEP 8 and just looks ugly.
* The clang-format is a tool to automatically format C/C++/Objective-C code, so that developers don't need to worry 
  about style issues during code reviews.
* YAPF is a new open-source tool for Python to apply clang-format. It is developed by Google and is in early releases.
* References
    - [Official YAPF Sourcecode on Github](https://github.com/google/yapf).
    - [YAPF Jetbrains Plugin](https://plugins.jetbrains.com/plugin/10960-yapf)

### Advantages of YAPF
* One need not worry about formatting when writing / tweaking code. This saves time when coding.
* It makes code from different developers consistent in a single project. This aids reading code.

### Use yapf in IntelliJ Idea
* Go to plugins marketplace: `Menu - File - Settings - Plugins - Marketplace`.
* Search for `yapf` plugin.
* Install plugin.
* Restart IntelliJ Idea.

### Use yapf on Command Line
```
# Install yapf
pip install yapf

# Run yapf on one single source file
python yapf P114_Yapf_CodeBeforeFormatting.py       # Show output of yapf on a source file
python yapf -i P114_Yapf_CodeBeforeFormatting.py    # Use -i option to overwrite the original source file.

# Run yapf recursively on all Python files, starting from current directory,
yapf -ir .

# The formatted code will be similar to P115_Yapf_CodeAfterFormatting.py
```

### Run yapf Using a Config File
YAPF will search for the formatting style in the following manner
1. Specified on the command line
2. In the [style] section of a .style.yapf file in either the current directory or one of its parent directories.
3. In the [yapf] section of a setup.cfg file in either the current directory or one of its parent directories.
4. In the [style] section of a ~/.config/yapf/style file in your home directory.
```
# Run yapf using custom options stored in a configuration file
python yapf -i --style project.yapf
```

### The yapf Usage
* YAPF accepts a bunch of other configuration parameters. 
```
usage: yapf [-h] [-v] [-d | -i] [-r | -l START-END] [-e PATTERN]
            [--style STYLE] [--style-help] [--no-local-style] [-p]
            [-vv]
            [files [files ...]]

Formatter for Python code.

Positional arguments
    files
    -h, --help                          Show this help message and exit
    -v, --version                       Show version number and exit
    -d, --diff                          Print the diff for the fixed source
    -i, --in-place                      Make changes to files in place
    -r, --recursive                     Run recursively over directories
    -l START-END, --lines START-END     Range of lines to reformat, one-based
    -e PATTERN, --exclude PATTERN       Patterns for files to exclude from formatting
    --style STYLE                       Specify formatting style: either a style name (for
                                        example "pep8" or "google"), or the name of a file
                                        with style settings. The default is pep8 unless a
                                        .style.yapf or setup.cfg file located in the same
                                        directory as the source or one of its parent
                                        directories (for stdin, the current directory is
                                        used).
    --style-help                        Show style settings and exit; this output can be saved
                                        to .style.yapf to make your settings permanent
    --no-local-style                    Don't search for local style definition
    -p, --parallel                      Run yapf in parallel when formatting multiple files.
                                        Requires concurrent.futures in Python 2.X
    -vv, --verbose                      Print out file names while processing
```
