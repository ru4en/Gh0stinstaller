red='\033[1;31m'
green='\033[1;32m'
reset='\033[0m'
On_Red='\033[41m'

echo '
  ____ _   _  ___  ____ _______   _____           _        _ _
 / ___| | | |/ _ \/ ___|_   _\ \ / /_ _|_ __  ___| |_ __ _| | | ___ _ __
| |  _| |_| | | | \___ \ | |  \ V / | || `_ \/ __| __/ _` | | |/ _ \ `__|
| |_| |  _  | |_| |___) || |   | |  | || | | \__ \ || (_| | | |  __/ |
 \____|_| |_|\___/|____/ |_|   |_| |___|_| |_|___/\__\__,_|_|_|\___|_|

'
echo "${On_Red}welcome to Gh0sty installer!${reset}"
distro=$(grep PRETTY_NAME /etc/os-release | sed 's/PRETTY_NAME=//g' | tr -d '="')
echo "${red}user${reset}: "$(echo "$USER")
echo "${red}distrobution${reset}: "$distro
echo "${red}Kernel${reset}: "$(uname -r)
echo "${red}Shell${reset}: "$(echo $SHELL | sed "s/bin//g" | tr -d "/")
echo "${red}CPU${reset}: "$(grep -m 1 "model name	: " /proc/cpuinfo | sed "s/model name	: //g" | tr -d '"')
#echo "GPU: "$(grep -m 1 "model" /proc/driver/nvidia/gpus/0/information | sed "s/model//g" | tr -d """)
echo "${red}Memory${reset}: "$(vmstat -s -SM | grep "used memory" | tr -d "used memory")$(echo " / ")$(vmstat -s -SM | grep "total memory" | tr -d "total memory")
echo ""
echo ""
if [ distroname="Debian $(cat /etc/debian_version)" ]; then
  echo "${On_Red}CORE${reset}"
  echo "${red}Updating and Upgrading${reset}"
  sudo apt -qq update && sudo apt -qq upgrade
  echo "${red}installing git${reset}"
  sudo apt -qq install git
  echo "${red}installing wget${reset}"
  sudo apt -qq install wget
  echo "${red}installing curl${reset}"
  sudo apt -qq install curl
  echo "${red}installing samba${reset}"
  sudo apt -qq install samba
  echo "${red}installing net tools${reset}"
  sudo apt -qq install net-tools
  echo "${red}installing htop${reset}"
  sudo apt -qq install htop
  echo "${red}installing openVPN${reset}"
  sudo apt -qq install openvpn
  echo "${red}installing TOR${reset}"
  sudo apt -qq install tor
  echo "${red}installing SSH${reset}"
  sudo apt -qq install openssh-server openssh-client

  echo "${On_Red}APPLICATIONS${reset}"

  echo "${red}Updating and Upgrading${reset}"
  sudo apt -qq update && sudo apt -qq upgrade

  echo "${red}Adding VirtualBox${reset}"
  wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
  echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
  echo "${red}Adding Atom${reset}"
  wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
  sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'

  curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
  curl -L https://get.oh-my.fish | fish
  curl -L https://get.oh-my.fish > install
  fish install --path=~/.local/share/omf --config=~/.config/omf
  wget https://ocean.surfshark.com/debian/pool/main/s/surfshark-release/surfshark-release_1.0.0-1.1_amd64.deb
  sudo dpkg -i surfshark-release_1.0.0-1.1_amd64.deb

  echo "${red}Updating and Upgrading${reset}"
  sudo apt -qq update && sudo apt -qq upgrade
  echo "${red}installing filezilla${reset}"
  sudo apt -qq install filezilla filezilla-common
  echo "${red}installing atom${reset}"
  sudo apt -qq install atom
  echo "${red}installing vlc${reset}"
  sudo apt -qq install vlc
  echo "${red}installing firefox${reset}"
  sudo apt -qq install firefox
  echo "${red}installing vim${reset}"
  sudo apt -qq install vim
  echo "${red}installing virtualbox${reset}"
  sudo apt -qq install virtualbox-6.0
  echo "${red}installing spotify${reset}"
  sudo apt -qq update && sudo apt -qq install spotify-client
  echo "${red}installing neofetch${reset}"
  sudo apt -qq install neofetch
  echo "${red}installing gimp${reset}"
  sudo apt -qq install gimp
  echo "${red}installing gparted${reset}"
  sudo apt -qq install gparted
  echo "${red}installing kodi${reset}"
  sudo apt -qq install kodi
  echo "${red}installing transmission${reset}"
  sudo apt -qq install transmission-gtk transmission-cli transmission-common transmission-daemon
  echo "${red}installing wine${reset}"
  sudo apt -qq install wine wine32
  echo "${red}installing nmap${reset}"
  sudo apt -qq install nmap
  echo "${red}installing gnome disk utility${reset}"
  sudo apt -qq install gnome-disk-utility
  echo "${red}installing latte dock${reset}"
  sudo apt -qq install latte-dock
  echo "${red}installing time shift${reset}"
  sudo apt -qq install timeshift
  echo "${red}installing nautilus${reset}"
  sudo apt -qq install nautilus
  echo "${red}installing blender${reset}"
  sudo apt -qq install blender
  echo "${red}installing fish${reset}"
  sudo apt -qq install fish
  omf -qq install bobthefish
  echo "${red}installing w3m${reset}"
  sudo apt -qq install w3m
  echo "${red}installing wireshark${reset}"
  sudo apt -qq install wireshark
  echo "${red}installing apache2${reset}"
  sudo apt -qq install apache2
  echo "${red}installing surfshark-vpn${reset}"
  sudo apt -qq install surfshark-vpn
  echo "${red}Surfshark login${reset}"
  sudo surfshark-vpn
else
  echo "this script dose not surport $distroname"
fi
#read -p "Enter Your Name: "  username
