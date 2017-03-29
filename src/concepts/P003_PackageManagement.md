# Description: Package Management in R

### Install R packrat Globally
```R
install.packages("packrat");
```

### Initialize packrat Once for Every Project
1. Create a new directory that will contain all the .R scripts, CSV data, and other files for a particular project.
2. Set up the project directory to use Packrat with packrat::init:
```R
# Omit path if the current working directory is the project directory
packrat::init(".")
```

### Note
- After initializing the project, one will be placed into packrat mode in the project directory and ready to go! This is no longer an ordinary R project but a Packrat project.
- The main difference is that a packrat project has its own private package library. Any package installed from inside a packrat project is only available to that particular project; and packages installed outside of the project are not available to the project.
- This is what we mean by “isolation” and it’s a Very Good Thing, as it means that upgrading a package for one project won’t break a totally different project that just happens to reside on the same machine, even if that package contained incompatible changes.
- A packrat project contains a few extra files and directories. The init() function creates these files for you, if they don’t already exist.
    - packrat/packrat.lock: Lists the precise package versions that were used to satisfy dependencies, including dependencies of dependencies. (This file should never be edited by hand!)
    - packrat/packrat.opts: Project-specific packrat options. These can be queried and set with get_opts and set_opts; see  ?"packrat-options" for more information.
    - packrat/lib/: Private package library for this project.
    - packrat/src/: Source packages of all the dependencies that packrat has been made aware of.
    - .Rprofile: Directs R to use the private package library (when it is started from the project directory).

### Install R Packages Using RStudio
1. Go to R Studio - Tools - Install Packages
2. Type the package name to be installed. (Say igraph)
3. Choose Local packrat library from the dropdown "Install to Library"
4. Click to Install.
```

### Install R Packages Using Commandline
```R
# Install a package
install.packages("reshape2")

# Remove a package
remove.packages("plyr")
```

### Common packrat Commands
```R
# Take a snapshot to save the changes in Packrat
packrat::snapshot()

# Restore snapshots
packrat::restore().

# Check the status
packrat::status()
```

### List of R Packages
```R
# Install igraph for graph visualisations.
igraph

# The igraph installation might fail. Install the following dependency.
sudo apt-get install r-cran-plyr
sudo apt-get install r-cran-reshape2
sudo apt-get install r-cran-ggplot2
```

# TODO
# 1. None
