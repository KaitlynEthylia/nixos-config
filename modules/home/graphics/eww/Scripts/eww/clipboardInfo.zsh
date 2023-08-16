#!/usr/bin/env zsh
if wl-paste | iconv -f UTF8 > /dev/null; then
	case $1 in
		head)
			wl-paste 2> /dev/null |
				head -1 |
				awk 'length > 20{$0 = substr($0, 1, 20) "..."} {printf "%s", $0}' |
				sed 's/^[[:space:]]*//g'
			echo "";;
		all)
			wl-paste 2> /dev/null
			true;;
	esac
fi
