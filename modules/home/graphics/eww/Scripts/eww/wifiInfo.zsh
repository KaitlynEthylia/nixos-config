#!/usr/bin/env zsh
case $1 in
	name)
		nmcli -f IN-USE,SSID d w | grep '*' | sed 's/[\* ]//g' | cat
		exit 0;;
	strength)
		str=$(nmcli -f ACTIVE,BARS d w | grep 'yes')
		case ${str: -5:-1} in
		'****')
			echo "󰤨";;
		'****')
			echo "󰤥";;
		'**')
			echo "󰤢";;
		'*')
			echo "󰤟";;
		*)
			echo "󰤯";;
		esac
		exit 0;;
	colour)
		str=$(nmcli -f ACTIVE,BARS d w | grep 'yes')
		case ${str: -5:-1} in
		'****')
			echo "green";;
		'***')
			echo "yellow";;
		'**')
			echo "peach";;
		'*')
			echo "maroon";;
		*)
			echo "red";;
		esac
		exit 0;;
esac
