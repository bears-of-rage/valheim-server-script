GAME_DIR="/games/valheim"
CONFIG_DIR="/home/steam/.config/unity3d/IronGate/Valheim/"
SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
IS_STEAM_HERE=$(command -v steamcmd >/dev/null 2>&1 || { echo >&2 "no"; })

#install steamcmd if needed
echo "Checking for and if needed installing steamcmd"
if [ "$IS_STEAM_HERE" = "no" ]; then sudo apt install steamcmd -y; fi

#installing & updateing valheim
steamcmd +force_install_dir $GAME_DIR +login anonymous +app_update 896660 validate +quit

#make sure service file is installed & loaded
  if [ ! -f /etc/systemd/system/valheim.service ]; then
    echo "valheim service file not found, installing and enabling service"
    sudo cp $SCRIPT_DIR/valheim.service /etc/systemd/system/
    sudo systemctl daemon-reload
    sudo systemctl enable valheim
  fi

#check if configs for valheim exist yet
if [ -f $CONFIG_DIR/adminlist.txt ]; then rm -rf $CONFIG_DIR/adminlist.txt; fi
if [ ! -d $CONFIG_DIR ]; then mkdir -p $CONFIG_DIR; fi

cp $SCRIPT_DIR/adminlist.txt $CONFIG_DIR

#was used for testing
#cp /repos/valheim-server-script/adminlist.txt $CONFIG_DIR

#start the service
echo "starting valheim service"
sudo systemctl start valheim
