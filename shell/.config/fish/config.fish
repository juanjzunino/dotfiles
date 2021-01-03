abbr -a vim nvim

function fish_prompt
	set_color white
    echo -n (hostname | cut -d . -f 1)
    echo -n " "
    set_color yellow
    echo -n "::"
    echo -n " "
    if [ $PWD = $HOME ]
		set_color blue
		echo -n "~"
    else
        set_color blue
        echo -n (basename $PWD)
	end
    echo -n " "
	set_color --bold brgreen
	echo -n '| '
    echo -n " "
	set_color normal
end

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3
