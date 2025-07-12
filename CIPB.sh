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
	# set_lock() min_pins security_count random_sec
	case $1 in
		3)
			num_of_pins=$(("$RANDOM"%4+$1))
			;;
		4)
			num_of_pins=$(("$RANDOM"%3+$1))
			;;
		5)
			num_of_pins=$(("$RANDOM"%2+$1))
			;;
	esac

	case $2 in
		0)
			num_of_sec=0
			;;
		1)
			num_of_sec=$(("$RANDOM"%2+$2))
			;;
		3)
			num_of_sec=$(("$RANDOM"%4+$2))
			;;
	esac

	if [[ "$num_of_pins" -lt "$num_of_sec" ]]; then
		num_of_sec=$(("$num_of_pins"))
	fi

	random_sec=$3

	declare -a pins=()
	for ((i=0; i < "$num_of_pins"; i++))
	do
		if [[ "$num_of_sec" -gt 0 && $(("$num_of_pins"-"$i")) -ge "$num_of_sec" ]]; then
			if [[ $(("$RANDOM" % 2)) -eq 0 && $(("$num_of_pins"-"$i")) -gt "$num_of_sec" ]]; then
				pins+=("Standard")
			else
				pins+=("Special")
				let num_of_sec--
			fi
		else
			pins+=("Standard")
		fi

		echo "pin $(($i+1)):" ${pins[$i]}
		#echo "sec " $num_of_sec
		#echo "Number of pins left "$(("$num_of_pins"-"$i"-1))
	done
}

# This takes what we've selected from the main menu and carries it to the difficulty setter
difficulty()
{
	# Case statement to choose each setting
	case $1 in
		[Ee]* )
			echo "Choosing difficulty mode: Easy"
			set_lock 3 0 false
			;;
		[Mm]* )
			echo "Choosing difficulty mode: Middle"
			set_lock 4 1 false
			;;
		[Hh]* )
			echo "Choosing difficulty mode: Hard"
			set_lock 5 3 true
			;;
		*)
			echo "This is just plainly wrong"
			menu_opt
			;;
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
