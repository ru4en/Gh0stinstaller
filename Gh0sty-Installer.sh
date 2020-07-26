clear
#APPLICATIONS to be installed
apps="git samba net-tools htop openvpn tor ssh openssh-server openssh-client filezilla atom vlc firefox vim virtualbox spotify neofetch gimp gparted qbittorrent wine wine32 nmap gnome-disk-utility latte-dock timeshift nautilus blender fish w3m cmus wireshark apache2 surfshark-vpn terminator python3 python3-pip idle3 omf"

#colour and higlights for script
red='\033[1;31m'
green='\033[1;32m'
reset='\033[0m'
On_Red='\033[41m'

#Ghosty Logo
DIR=$(dirname "$0")
cat $DIR/gh0sty.txt  

#ASCII art of logo
echo '
  ____ _   _  ___  ____ _______   _____           _        _ _
 / ___| | | |/ _ \/ ___|_   _\ \ / /_ _|_ __  ___| |_ __ _| | | ___ _ __
| |  _| |_| | | | \___ \ | |  \ V / | || `_ \/ __| __/ _` | | |/ _ \ `__|
| |_| |  _  | |_| |___) || |   | |  | || | | \__ \ || (_| | | |  __/ |
 \____|_| |_|\___/|____/ |_|   |_| |___|_| |_|___/\__\__,_|_|_|\___|_|
'
#INFO of michine
echo "${On_Red}welcome to Gh0sty installer!${reset}"
distro=$(grep PRETTY_NAME /etc/os-release | sed 's/PRETTY_NAME=//g' | tr -d '="')
echo "${red}user${reset}: "$(echo "$USER")
echo "${red}distrobution${reset}: "$distro
echo "${red}Kernel${reset}: "$(uname -r)
echo "${red}Shell${reset}: "$(echo $SHELL | sed "s/bin//g" | tr -d "/")
echo "${red}CPU${reset}: "$(grep -m 1 "model name	: " /proc/cpuinfo | sed "s/model name	: //g" | tr -d '"')
echo "${red}Memory${reset}: "$(vmstat -s -SM | grep "used memory" | tr -d "used memory")$(echo " / ")$(vmstat -s -SM | grep "total memory" | tr -d "total memory")
echo ""
#check if disrto surported
if [ distroname="Debian $(cat /etc/debian_version)" ]; then
  #confonation
  read -r -p "Do you want to continue? (Y/n)" input
  case $input in
      [yY][eE][sS]|[yY])
  		echo "Yes"
  		;;
      [nN][oO]|[nN])
      exit 1
  	echo "Invalid input..."
  	exit 1
  	;;
  esac

  #installing dependencies for instalation
  echo "${red}installing wget${reset}"
  sudo apt -qqy install wget
  echo "${red}installing curl${reset}"
  sudo apt -qqy install curl
  
  #change wallpaper
  qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript 'var allDesktops = desktops();print (allDesktops);for (i=0;i<allDesktops.length;i++){d = allDesktops[i];d.wallpaperPlugin = "org.kde.image";d.currentConfigGroup = Array("Wallpaper", "org.kde.image", "General");d.writeConfig("Image", "file:///'$DIR'/wallpaper.jpg" )}'
  xfconf-query -c xfce4-desktop -p insert_property_here -s /wallpaper.jpg
  gsettings set org.gnome.desktop.background picture-uri file:///'$DIR'/wallpaper.jpg
  
  #adding extra packages
  echo "${red}Adding VirtualBox${reset}"
  wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
  echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
  echo "${red}Adding Atom${reset}"
  wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
  sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
  echo "${red}Adding oh my fish${reset}"
  curl -L https://get.oh-my.fish | fish
  curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
  curl -L https://get.oh-my.fish | fish
  curl -L https://get.oh-my.fish > install
  fish install --path=~/.local/share/omf --config=~/.config/omf
  wget https://ocean.surfshark.com/debian/pool/main/s/surfshark-release/surfshark-release_1.0.0-1.1_amd64.deb
  sudo dpkg -i surfshark-release_1.0.0-1.1_amd64.deb

  echo "${red}Updating and Upgrading${reset}"
  sudo apt -qqy update && sudo apt -qqy upgrade

  for item in $apps;
    do
      echo "${red} Installing $item${reset}"
      sudo apt -qqy install $item
    done
  #setup
  #setup vpn
    sudo surfshark-vpn
#setting fish
    chsh -s /usr/bin/fish
    omf install bobthefish
    cp */config.fish  ~/.config/fish/config.fish
else
echo "this script dose not surport $distroname"
  fi
