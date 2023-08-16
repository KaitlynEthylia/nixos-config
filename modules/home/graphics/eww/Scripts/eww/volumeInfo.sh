#!/usr/bin/env sh
count=$(pamixer --get-volume)
colour="green"
if ((count > 75)); then colour="yellow"; fi
if ((count > 90)); then colour="peach"; fi
if ((count > 100)); then colour="maroon"; fi
if ((count > 110)); then colour="red"; fi
echo "{\"count\":\"${count}\", \"colour\":\"${colour}\"}"
