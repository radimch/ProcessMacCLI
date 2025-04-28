## ProcessMacCLI
ProcessMacCLI is a single-click command line tool, that grabs and displays running processes on a MacBook.

### For Mac End users:

1. Download [ProcessMacCLI.zip](https://github.com/user-attachments/files/19943628/ProcessMacCLI.zip) and save it anywhere to your local disk.
2. Unzip the binary inside it by double-clicking.
3. Run the application:
   Since ProcessMacCLI is not a signed application (an it not resides in Apple Store) the execution of ***this version*** is little bit complicated (it can be simplified by making it trusted app)
   Doublecliking on ProcessMacCLI will result in following warning: <img src="https://github.com/user-attachments/assets/2cc82bbd-958d-4abf-8806-470b923feac3" alt="Run ProcessMacCLI" width="713"/>
4. You have to open `System settings...` either by clicking on Apple icon in the topleft corner of your screen and selecting `System settings...` item
   or by pressing `Option` key with `Fn1`

   <img src="https://github.com/user-attachments/assets/96518738-4a6d-4635-bb8b-1b7e2397efc0" alt="System settings..." width="275"/>
5. Scroll down to `Privacy and security` and on the right panel scroll down to `Security` section and push the button `Run anyway` on the right side of `ProcessMacCLI` app
   <img src="https://github.com/user-attachments/assets/ff7ec8fd-22c8-43ac-9a7b-9e4cb6073ec4" alt="Privacy and security... Run anyway" width="713"/>

The system may ask you for authorization (either password or fingerprint) and when pop-up window raises, click `Open Anyway`
 <img src="https://github.com/user-attachments/assets/4dec67f8-8500-413e-a72f-c51536a2ec87" alt="Open anyway" width="278"/>

The ProcessMacCLI app want to save the it's output to your filesystem, so allow it by clicking to `Allow` button
 <img src="https://github.com/user-attachments/assets/008b6bc4-be5e-47a4-b776-74edd426f474" alt="Access filesystem" width="277"/>

 6. Finally it runs, automatically takes snapshot of all running processes on your local Mac and saves it as `<timestamp>-<computer-name>.csv`
    e.g. `200250428-182400-MyMac.csv` file on your Desktop while opening it at the same time in Excell (or other associated table processor) to visualize the data on your screen. You can optionally edit & save it thereafter.

<img src="https://github.com/user-attachments/assets/29686ebb-eebc-4e1d-ac9e-76ab16d49fcc" alt="ProcessMacCLI" width="1418"/>

Colums:
1. User that run the process
2. PID - Process ID
3. CPU usage 
4. Memory consumption
5. Time (or date) of start of the process
6. Whole commandline together with paramters

*********

### For Mac (shell, swift) developers:
The implementation of `ProcessMacCLI` uses mac shell (`zsh`) - since MacOS is a BSD based system.

On top of it it `Swift` language has been used as most natural choice, because default development environment `XCode` comes with support of Swift out of the box.

`ProcessMacCLI` relies on presence of BSD version of `ps` command, executing standard `ps aux`
