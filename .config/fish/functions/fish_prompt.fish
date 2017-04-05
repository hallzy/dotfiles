function fish_prompt
	set red d75f5f
	set blue 87afaf
	set yellow afaf00
	set green 87af00

	# Username
	set_color $red
	if test $USER = steven
		set_color -o $red
	else
		set_color -o $blue
	end
	echo -n $USER

	# @ sign
	set_color -o white
	echo -n @

	# hostname
	if [ -z "$SSH_CLIENT" ]
		set_color -o $red
	else
		set_color -o $blue
	end
	echo -n (hostname)

	# Time of day
	set_color -o $green
	echo -n ' ['
	set_color -o $red
	echo -n (date +%r)
	set_color -o $green
	echo -n ']'

	# current directory
	set_color -o $yellow
	echo -n " ["
	set my_home (echo $HOME | grep -o "home/.*")
	set my_home2 (echo $HOME | grep -o "$USER.*")
	echo -n (pwd | sed "s=^$HOME=~=" | rev  | cut -d'/' -f1,2,3 --output-delimiter='/' | rev)
	echo -n ']'

	# newline
	echo

	set_color -o $blue
	echo -n "RET="
	# exit code is defined in config.fish in function get_ret_value
	echo -n $exit_code

	# git-radar
	set_color normal
	# echo -n (git-radar --fish --fetch)
	echo -n (~/Documents/git-repos/repos-i-contribute-to/git-radar/git-radar --fish --fetch)

	# $ prompt
	echo -n ' $ '
	set_color normal
end
