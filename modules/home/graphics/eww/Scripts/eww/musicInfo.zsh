#!/usr/bin/env zsh
while [ "$player" = "" ]; do
	player=$(playerctl --list-all | grep -v 'firefox' | head -1)
done

case $1 in
	song)
		playerctl -F --player $player metadata --format '{"player":"{{playerName}}","title":"{{xesam:title}}","artist":"{{xesam:artist}}"}';;
	position)
		playerctl -F --player $player position --format  '{{duration(position)}}';;
	progress)
		playerctl -F --player $player metadata --format '{{position * 100 / mpris:length}}';;
	length)
		playerctl -F --player $player metadata mpris:length --format '{{duration(mpris:length)}}';;
	*)
		playerctl --player $player position $(($(playerctl metadata mpris:length) * $1 / 100000000))
esac

exit 0;
