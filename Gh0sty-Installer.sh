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
  echo "works"
else
  echo "this script dose not surport $distroname"
fi
#read -p "Enter Your Name: "  username
