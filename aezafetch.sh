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

lc="${reset}${bold}${cyan}"
nc="${reset}${bold}${cyan}"
ic="${reset}${bold}${white}"
c0="${reset}${bold}${cyan}"
c1="${reset}${cyan}"

## OUTPUT
cat <<EOF
${c0}        /\        ${nc}${USER}${ic}@${nc}${host}${reset}
${c0}       /^^\       ${lc}OS:        ${ic}${os}${reset}
${c0}      /\   \      ${lc}KERNEL:    ${ic}${kernel}${reset}
${c0}     /  ${c1}__  \     ${lc}UPTIME:    ${ic}${uptime}${reset}
${c1}    /  (  )  \    ${lc}SHELL:     ${ic}${shell}${reset}
${c1}   / __|  |__\\\\   ${reset}
${c1}  ///        \\\\\  ${reset}
EOF
