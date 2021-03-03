# How to set up a windows machine to build

## VSCode

Install VSCode https://code.visualstudio.com

## Git and GitBash

Install Git+GitBash https://gitforwindows.org

## Visual Studio

Install Visual Studio Community 2019 https://visualstudio.microsoft.com/free-developer-offers/

Choose: "Desktop development with C++"

Inividual Components: search for 10.0.19041.0 select "Windows 10 SDK (10.0.19041.0)"

## Python

Install python2 https://www.python.org/downloads/release/python-2718/

Select add to PATH

## Set up GitHub keys

Make ssh key

Add the key to github

## Make sure Windows and Git can handle long paths

Admin PowerShell
```bash
Set-ItemProperty 'HKLM:\System\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -value 1
git config --system core.longpaths true
```

## Clone chromium-update

clone chromium-update

## Use update script to set up environment

```bash
yes | ./update.sh -e
```
