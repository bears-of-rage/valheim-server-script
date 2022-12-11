# valheim-server-script
Script will install and do all the crap for valheim.
Install/Update/create valheim as a service so it will run when console is closed.

Expectation is that you have a /games directory and a steam user who has sudo.

Will also insert placeholder admins in place for myself, danger & coren via steamIDs - yes these are hardcoded - I could probabably secretize these but meh.

# saving
Reminder that Valheim only saves every 30 minutes, and as far as I am aware this is hard-coded.
To manually initiate a save, an admin can type "save" into the in-game admin console

# in-game admin console
To enable the console, you have to enter "-console" (no quotes) into the launch options for valheim in steam.
Once in-game - if you are flagged as an admin, you can hit "F5" to open a console - why this is not ~, I have no idea.


# Lag Fix
If you want to implement the lag fix (late 2022) you can use use the included dll in this repo.
It was created using the steps here:
https://jamesachambers.com/revisiting-fixing-valheim-lag-modifying-send-receive-limits/

The path is slightly different in linux, if you used my install script the file is /games/valheim/valheim_server_Data/Managed
 - remember its linux - watch the character case...

 If you need to edit a new version of the file....you need to copy the ENTIRE Managed folder to wherever you run the dnspy utility so it has all the reference libraries when y ou compile.  After the DLL is re-compiled you only need to move over the edited/modified DLL.

 TLDR:
 Backup the original DLL,
 put this one in there with the same name.

