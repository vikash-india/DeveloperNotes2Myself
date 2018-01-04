# Description: Package Management in R

### Note
- The packrat package in R is used for package management for different projects.
- The packrat package should be installed in global namespace and then every R project should be initialized using the 
  command `packrat::init(".")` once.
- After initializing the project using packrat, the project directory is no longer an ordinary R project but a Packrat 
  project directory or in Packrat mode.
- A packrat project has its own private package library in the directory `packrat/`. Any package installed from inside 
  a packrat project is only available to that particular project and any package installed outside of the project are 
  not available to the project.
- Isolation: Separating a project from other R projects is called 'isolation'. It means upgrading a package for one 
  project won’t break a totally different project that just happens to reside on the same machine, even if that package 
  contained incompatible changes.
- A packrat project contains a few extra files and directories. The init() function creates these files if they don’t 
  already exist.
    - packrat/packrat.lock: Lists the precise package versions that were used to satisfy dependencies, including 
      dependencies of dependencies. This file should NEVER be edited by hand!
    - packrat/packrat.opts: Project-specific packrat options. These can be queried and set with get_opts and set_opts. 
      Use `?"packrat-options"` to read more about it.
    - packrat/lib/: Private package library for this project.
    - packrat/src/: Source packages of all the dependencies that packrat has been made aware of.
    - .Rprofile: Directs R to use the private package library (when it is started from the project directory).

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

### Install R Packages Using RStudio
1. Go to R Studio - Tools - Install Packages
2. Type the package name to be installed, say igraph.
3. Choose Local packrat library from the dropdown "Install to Library".
4. Click to Install.

### Install R Packages Using Commandline
```R
# Install a package
install.packages("reshape2")

# Remove a package
remove.packages("plyr")
```

### Common packrat Commands

#### Check Status

```R
packrat::status()

# Output should be as follows 
Up to date.
```

#### Take a Snapshot
1. When packrat takes a snapshot, it looks in the project’s private package library for packages that have been added,
   modified, or removed since the last time snapshot was called. For packages that were added or modified, packrat 
   attempts to go find the uncompiled source package from CRAN, BioConductor, or GitHub (caveat: only for packages 
   that were installed using devtools version 1.4 or later), and save them in the packrat/src project subdirectory. 
2. Snapshot records metadata about each package to the file packrat/packrat.lock.
3. If automatic snapshots are turned on, Packrat will record package upgrades and additions in the background, so you 
   don’t even need to remember to call ::snapshot() manually unless you’re performing a less common action.
4. Because we save source packages for all of your dependencies, packrat makes your project more reproducible.

```R
packrat::snapshot()
```

#### Restore snapshot
1. Once the project has a snapshot, one can easily install the packages from that snapshot into your private library 
   at any time.

```R
packrat::restore()
```

#### Set packrat options
1. You may be working on a project with an R package that is not available on any external repository. The  packrat can 
   still handle this! With source packages, we expect these packages live in a local repository.
2. A local repository is just a directory containing package sources. This can be set within a packrat project with:

```R
packrat::set_opts(local.repos = "<path_to_repo>")
```

# TODO
# 1. None
