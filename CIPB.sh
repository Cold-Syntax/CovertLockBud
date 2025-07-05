#!/usr/bin/env bash

# This displays the main bio of the story
about="The Covert Instrument Practice Buddy or C.I.P.B. is an open source project where those who owns the C.I Practice Lock but are not sure on how to set up the product and practice with. You can choose from difficulty that will determine the number of pins, type of pins, and for an added bonus what type of tool to use to pick the lock. All while being timed and producing a log of personal bests."

# This displays our banner
banner()
{
	echo "░░      ░░░        ░░░░░░░░       ░░░       ░░░░      ░░░░      ░░░        ░░        ░░░      ░░░        ░░░░░░░░       ░░░  ░░░░  ░░       ░░░       ░░░  ░░░░  ░"
	echo "▒  ▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒▒  ▒▒  ▒▒"
	echo "▓  ▓▓▓▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓▓▓▓▓       ▓▓▓       ▓▓▓  ▓▓▓▓  ▓▓  ▓▓▓▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓▓  ▓▓▓▓▓  ▓▓▓▓▓▓▓▓      ▓▓▓▓▓▓▓▓▓▓       ▓▓▓  ▓▓▓▓  ▓▓  ▓▓▓▓  ▓▓  ▓▓▓▓  ▓▓▓▓    ▓▓▓"
	echo "█  ████  █████  ███████████  ████████  ███  ███        ██  ████  █████  ████████  █████  ████  ██  ██████████████  ████  ██  ████  ██  ████  ██  ████  █████  ████"
	echo "██      ███        ████████  ████████  ████  ██  ████  ███      ██████  █████        ███      ███        ████████       ████      ███       ███       ██████  ████"
	echo "                                                                                                                                                                  "
}

# This displays the main menu
main_menu()
{
	echo
	echo "================================================="
	echo "	Choose your difficulty"
	echo "(E)asy	 |	 (M)edium	 |	 (H)ard"
}

# This takes what we've selected from the main menu and carries it to the difficulty setter
difficulty()
{

	local lvl=$1

	if [[ "${lvl^^}" == "E" ]]; then
		echo "Choosing difficulty mode: Easy"
	elif [[ "${lvl^^}" == "M" ]]; then
		echo "Choosing difficulty mode: Middle"
	elif [[ "${lvl^^}" == "H" ]]; then
		echo "Choosing difficulty mode: Hard"
	else
		echo "This is just plainly wrong"
		menu_opt
	fi

}

menu_opt()
{
	main_menu
	read
	local diff=$REPLY
	difficulty $diff
}

banner

echo "$about"

menu_opt
