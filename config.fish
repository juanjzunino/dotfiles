function fish_prompt
	set_color cyan
    echo -n '['
	set_color blue
	echo -n (whoami)
    echo -n '@'
    echo -n (hostname | cut -d . -f 1)
    echo -n " "
    if [ $PWD = $HOME ]
		set_color green
		echo -n "~"

    else
        set_color green
        echo -n (basename $PWD)
	end
	set_color cyan
    echo -n ']'
    echo -n " "
	set_color --bold bryellow
	echo -n '> '
    echo -n " "
	set_color normal
end

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3
