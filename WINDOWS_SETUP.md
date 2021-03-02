Install VSCode https://code.visualstudio.com

Install Git+GitBash https://gitforwindows.org

Install Visual Studio Community 2019 https://visualstudio.microsoft.com/free-developer-offers/

Choose: "Desktop development with C++"

Inividual Components: search for 10.0.19041.0 select "Windows 10 SDK (10.0.19041.0)"

Make ssh key

Add the key to github

clone chromium-update

Admin PowerShell
Set-ItemProperty 'HKLM:\System\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -value 1
git config --system core.longpaths true

yes | ./update.sh -e
