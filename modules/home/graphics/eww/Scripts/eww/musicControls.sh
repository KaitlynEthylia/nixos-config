#!/usr/bin/env sh
while [ "$player" = "" ]; do
	player=$(playerctl --list-all | grep -v 'firefox' | head -1)
done

shuffle() {
	playerctl -F shuffle | while read line; do
		case $line in
			On)
				echo "{\"icon\":\"咽\", \"command\":\"playerctl --player $player shuffle off\"}";;
			Off)
				echo "{\"icon\":\"劣\", \"command\":\"playerctl --player $player shuffle on\"}";;
		esac
	done
}

status() {
	playerctl -F status | while read line; do
		case $line in
			Playing)
				echo "{\"icon\":\"\", \"command\":\"playerctl --player $player pause\"}";;
			Paused)
				echo "{\"icon\":\"契\", \"command\":\"playerctl --player $player play\"}";;
		esac
	done
}

loop() {
	playerctl -F loop | while read line; do
		case $line in
			Playlist)
				echo "{\"icon\":\"凌\", \"command\":\"playerctl --player $player loop track\"}";;
			Track)
				echo "{\"icon\":\"綾\", \"command\":\"playerctl --player $player loop none\"}";;
			None)
				echo "{\"icon\":\"稜\", \"command\":\"playerctl --player $player loop playlist\"}";;
		esac
	done
}

case $1 in
	shuffle)
		shuffle;;
	status)
		status;;
	loop)
		loop;;
esac
