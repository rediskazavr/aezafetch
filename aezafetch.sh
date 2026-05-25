#!/bin/sh
#
# aezafetch - tiny system info for aeza servers

## INFO
host="$(hostname)"
os="$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')"
kernel="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
shell="$(basename ${SHELL})"

## DEFINE COLORS
bold="$(tput bold)"
black="$(tput setaf 0)"
red="$(tput setaf 1)"
green="$(tput setaf 2)"
yellow="$(tput setaf 3)"
blue="$(tput setaf 4)"
magenta="$(tput setaf 5)"
cyan="$(tput setaf 6)"
white="$(tput setaf 7)"
reset="$(tput sgr0)"

nc="${reset}${bold}${white}"
ic="${reset}${bold}${white}"
lc="${reset}${bold}${white}"
c0="${reset}${bold}${white}"
c1="${reset}${white}"

## DETECT DISTRO FOR COLORS
case "${os}" in
    *Arch*)      c0="${reset}${bold}${cyan}";   c1="${reset}${cyan}"    ;;
    *Ubuntu*)    c0="${reset}${bold}${red}";    c1="${reset}${yellow}"  ;;
    *Debian*)    c0="${reset}${bold}${red}";    c1="${reset}${red}"     ;;
    *Fedora*)    c0="${reset}${bold}${blue}";   c1="${reset}${white}"   ;;
    *CentOS*)    c0="${reset}${bold}${yellow}"; c1="${reset}${white}"   ;;
    *Alpine*)    c0="${reset}${bold}${blue}";   c1="${reset}${white}"   ;;
    *)           c0="${reset}${bold}${white}";  c1="${reset}${white}"   ;;
esac

## OUTPUT
cat <<EOF
${white}
${white}   :::::::::::::::::::-:
${white} :::::..............:::::::
${white}::..........:*##-......:::-:
${white}::..........:#@@-........::::
${white}::..........:==:.........:::::
${white}::.......:=#@@@@#-:......:::::
${white}::......-@@@@*#@@@%:.....:::::
${white}::.....:@@@+...:#@@*:....:::::
${white}::.....-@@@@@@@@@@@%:....:::::
${white}::.....:@@@+...::::::....:::::
${white}::......=@@@#++#@@@=.....:::::
${white}:::......:+@@@@@@*:......:::::
${white} ::.........::::.........:::::
${white} ::::::::::::::::::::::::::-:
${white}  ::::::::::::::::::::::::::
${white}     ::::::::::::::::::::
${reset}
  ${lc}${USER}@${host}${reset}
  ${lc}OS:        ${ic}${os}${reset}
  ${lc}KERNEL:    ${ic}${kernel}${reset}
  ${lc}UPTIME:    ${ic}${uptime}${reset}
  ${lc}SHELL:     ${ic}${shell}${reset}

EOF
