# TurtleBrowser Chromium Update

The main component in this repo is the update.sh script. This script automates a lot of the workflow around taking in a new Chromium version, setting up a local checkout with the current branch and building both Chromium and Qt+Chromium.

To see the options the script has
```bash
bash update.sh -h
```

Example output on Linux
```bash
TurtleBrowser Chromium update script, running on linux-gnu
General Options
-j <num> number of compile jobs (Default 8)
-v verbose output from tools invoked (Default off)
-k compilation should continue on error (Default off)
-w work directory (Default '/c/Code' (win) or '/Code' (linux))
-x external, does not require rights (Default off)
-s skip actual build steps (Default off)
-r only build release (Default off)
Workflow Options - only one of the below at a time
-d Developer      Workflow: (Default) Building the current branch Qt+Chromium
-e Environment    Workflow: Setting up the development environment for a dev using the current branch
-u Update         Workflow: Updating to a new Chromium version and set up a branch
-p Patching       Workflow: Applying the patches to an update branch
-q Qt build       Workflow: Just build Qt (Assumes setup has been done)
-c Chromium build Workflow: Just build Chromium (Assumes setup has been done)
```

On Windows the script is meant to be run in GitBash.
