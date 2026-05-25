#!/bin/sh
#
# aezafetch - tiny system info for aeza servers

## INFO
host="$(hostname)"
user="${USER}"

os="$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')"
kernel="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
shell="$(basename "$SHELL")"

## LOCATION
location="$(curl -fsSL https://ipapi.co/country_name/ 2>/dev/null || echo "Unknown")"

## COLORS
bold="$(tput bold)"
reset="$(tput sgr0)"

white="$(tput setaf 7)"
cyan="$(tput setaf 6)"

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

## INFO BLOCK
info_1="${bold}${white}${user}@${host}${reset}"
info_2="OS:        ${os}"
info_3="KERNEL:    ${kernel}"
info_4="UPTIME:    ${uptime}"
info_5="SHELL:     ${shell}"
info_6="LOCATION:  ${location}"

## PRINT
printf "\n"

printf "${white}%-38s${reset} %b\n" "$art_1" "$info_1"
printf "${white}%-38s${reset} %b\n" "$art_2" "$info_2"
printf "${white}%-38s${reset} %b\n" "$art_3" "$info_3"
printf "${white}%-38s${reset} %b\n" "$art_4" "$info_4"
printf "${white}%-38s${reset} %b\n" "$art_5" "$info_5"
printf "${white}%-38s${reset} %b\n" "$art_6" "$info_6"

printf "${white}%s${reset}\n" "$art_7"
printf "${white}%s${reset}\n" "$art_8"
printf "${white}%s${reset}\n" "$art_9"
printf "${white}%s${reset}\n" "$art_10"
printf "${white}%s${reset}\n" "$art_11"
printf "${white}%s${reset}\n" "$art_12"
printf "${white}%s${reset}\n" "$art_13"
printf "${white}%s${reset}\n" "$art_14"
printf "${white}%s${reset}\n" "$art_15"
printf "${white}%s${reset}\n" "$art_16"

printf "\n"
