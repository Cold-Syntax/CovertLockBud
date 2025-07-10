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

set_lock()
{
	# Get the numbers of min pins
	# See if difficulty is higher (Med to High) if so how many security pins
	# randomly select which are security pins
	# Easy 3-6 pins no security
	# Medium 4-6, 1-2 security pins of the same type
	# Hard 5-6, 3-6 security pins of randomized type and check to see if 5 pins 6 sec happens
	# Add an options be challenge to a selected pick from both geno and eche a turning position (Bottom for rakes only)
	# set_lock() min_pins min_sec max_sec random_sec
	t=$1
	num_of_pins=$(("$RANDOM"%6))
	min_sec=$2
	max_sec=$3
	if [[ max_sec -gt 0 && min_sec -gt 0 ]]; then
		num_of_sec=$(("$RANDOM"%$max_sec+$min_sec))
	else
		num_of_sec=0;
	fi
	random_sec=$4

	declare -a pins=()
	for ((i=0; i < $"num_of_pins"; i++))
	do
		if [[ "$num_of_sec" -gt 0 && "$num_of_pins"-"$i" -lt "$num_of_sec" ]]; then
			if [ "$RANDOM" % "2" -eq "0" ]; then
				pins+=("Standard")
			else
				pins+=("Special")
				let num_of_sec--
				# let num_of_pins--
			fi
		else
			pins+=("Standard")
		fi

		echo "pin $i:" ${pins[$i]}
		echo "sec" $num_of_sec
		echo "Number of pins left"$num_of_pins-$i
		echo "Loop remain"$i
	done
}

# This takes what we've selected from the main menu and carries it to the difficulty setter
difficulty()
{
	# Case statement to choose each setting
	case $1 in
		[Ee]* )
			echo "Choosing difficulty mode: Easy"
			set_lock 3 0 0 false;;
		[Mm]* )
			echo "Choosing difficulty mode: Middle"
			set_lock 4 1 2 false;;
		[Hh]* )
			echo "Choosing difficulty mode: Hard"
			set_lock 5 3 6 true;;
		*)
			echo "This is just plainly wrong"
			menu_opt;;
	esac
}

menu_opt()
{
	main_menu
	read option
	difficulty $option
}

banner

echo "$about"

menu_opt
