## ProcessMacCLI
ProcessMacCLI is a single-click command line tool, that grabs and displays running processes on a MacBook.

### For Mac Users:

Simply download [ProcessMacCLI.zip](https://github.com/user-attachments/files/19943628/ProcessMacCLI.zip) anywhere to your local disk, unzip it, and execute the binary ProcessMacCLI inside.

It automatically makes snapshot of all running processes on your local Mac and saves it as `<timestamp>-<computer-name>.csv` e.g. `200250428-182400-MyMac.csv` file on your Desktop while opening it at the same time in Excell (or other associated table processor) to visualize the data on your screen. You can optionally edit & save it thereafter.


### For Mac (shell, swift) developers:
The implementation of `ProcessMacCLI` uses mac shell (`zsh`) - since MacOS is a BSD based system.

On top of it it `Swift` language has been used as most natural choice, because default development environment `XCode` comes with support of Swift out of the box.

`ProcessMacCLI` relies on presence of BSD version of `ps` command, executing standard `ps aux`
