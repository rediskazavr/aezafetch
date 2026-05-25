#!/bin/sh
#
# aezafetch - tiny system info for aeza servers

## USER / HOST
user="${USER}"
host="$(hostname)"

## SYSTEM
os="$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')"
kernel="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
shell="$(basename "$SHELL")"

## CPU
cpu="$(grep -m1 'model name' /proc/cpuinfo | cut -d: -f2- | sed 's/^ //')"
cores="$(nproc)"

## MEMORY
ram="$(free -h | awk '/Mem:/ {print $2}')"

## STORAGE
disk="$(df -h / | awk 'NR==2 {print $2}')"

## VIRTUALIZATION
virt="$(systemd-detect-virt 2>/dev/null)"
[ -z "$virt" ] && virt="unknown"

## LOCATION
location="$(curl -fsSL https://ipinfo.io/country 2>/dev/null || curl -fsSL https://ifconfig.co/country 2>/dev/null || echo "unknown")"

## SERVER TYPE DETECTION
server_type="unknown"

case "$cpu" in

    *Ryzen\ 5\ 3600*)
        if [ "$cores" -eq 1 ]; then
            server_type="promo"
        fi
        ;;

    *Xeon*8260*|*Platinum*)
        server_type="storage-vps"
        ;;

    *i9-14900K*|*EPYC\ 9454*)
        server_type="hi-cpu"
        ;;

    *7950X3D*|*9950X*)
        server_type="shared/dedicated"
        ;;

esac

## COLORS
bold="$(tput bold)"
reset="$(tput sgr0)"
white="$(tput setaf 7)"

## ASCII ART
art_1="   :::::::::::::::::::-:"
art_2=" :::::..............:::::::"
art_3="::..........:*##-......:::-:"
art_4="::..........:#@@-........::::"
art_5="::..........:==:.........:::::"
art_6="::.......:=#@@@@#-:......:::::"
art_7="::......-@@@@*#@@@%:.....:::::"
art_8="::.....:@@@+...:#@@*:....:::::"
art_9="::.....-@@@@@@@@@@@%:....:::::"
art_10="::.....:@@@+...::::::....:::::"
art_11="::......=@@@#++#@@@=.....:::::"
art_12=":::......:+@@@@@@*:......:::::"
art_13=" ::.........::::.........:::::"
art_14=" ::::::::::::::::::::::::::-:"
art_15="  ::::::::::::::::::::::::::"
art_16="     ::::::::::::::::::::"

## INFO
info_1="${bold}${white}${user}@${host}${reset}"
info_2="os:         ${os}"
info_3="kernel:     ${kernel}"
info_4="uptime:     ${uptime}"
info_5="shell:      ${shell}"
info_6="cpu:        ${cpu}"
info_7="cores:      ${cores}"
info_8="ram:        ${ram}"
info_9="disk:       ${disk}"
info_10="location:   ${location}"
info_11="type:       ${server_type}"
info_12="virt:       ${virt}"

printf "\n"

printf "${white}%-38s${reset} %b\n" "$art_1" "$info_1"
printf "${white}%-38s${reset} %b\n" "$art_2" "$info_2"
printf "${white}%-38s${reset} %b\n" "$art_3" "$info_3"
printf "${white}%-38s${reset} %b\n" "$art_4" "$info_4"
printf "${white}%-38s${reset} %b\n" "$art_5" "$info_5"
printf "${white}%-38s${reset} %b\n" "$art_6" "$info_6"
printf "${white}%-38s${reset} %b\n" "$art_7" "$info_7"
printf "${white}%-38s${reset} %b\n" "$art_8" "$info_8"
printf "${white}%-38s${reset} %b\n" "$art_9" "$info_9"
printf "${white}%-38s${reset} %b\n" "$art_10" "$info_10"
printf "${white}%-38s${reset} %b\n" "$art_11" "$info_11"
printf "${white}%-38s${reset} %b\n" "$art_12" "$info_12"

printf "${white}%s${reset}\n" "$art_13"
printf "${white}%s${reset}\n" "$art_14"
printf "${white}%s${reset}\n" "$art_15"
printf "${white}%s${reset}\n" "$art_16"

printf "\n"
