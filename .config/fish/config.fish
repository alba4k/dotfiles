if status --is-interactive
    albafetch &
    # uptime-record -s
end

# tide configure --auto --style=Classic --prompt_colors='True color' --classic_prompt_color=Light --show_time='24-hour format' --classic_prompt_separators=Angled --powerline_prompt_heads=Sharp --powerline_prompt_tails=Round --powerline_prompt_style='Two lines, character and frame' --prompt_connection=Dotted --powerline_right_prompt_frame=No --prompt_connection_andor_frame_color=Darkest --prompt_spacing=Sparse --icons='Many icons' --transient=No

alias p="paru"
alias g="git"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'

alias yeet_the_orphans="sudo pacman -Rssn (pacman -Qdtq) 2>/dev/null || echo No orphan packages were found!"
alias fwupd="fwupdmgr refresh; fwupdmgr get-updates && sudo fwupdmgr install"
if test (cat /proc/sys/kernel/hostname | string trim) = "dell-xps"
    alias sudo="sudo -p '[sudo] impronta digitale o password: "\n"'"
end
alias texclean="/bin/rm -rf *.aux *.fdb_latexmk *.fls *.log *.out *.synctex.gz"

alias c="tput reset && fish && exit"
alias :q="exit"
alias :wq="exit"
alias :Wq="exit" # 'cause I like misstyping

alias l="eza --group-directories-first --icons --color=always"
alias ls="eza --group-directories-first --icons --color=always"
alias la="eza -a --group-directories-first --icons --color=always"
alias ll="eza -la --group-directories-first --icons --git --color=always"

alias rm="rmtrash"
alias rmf="/usr/bin/rm"

alias white="python -c \"import tkinter as tk; tk.Tk().config(bg='#FFFFFF');tk.mainloop()\""
alias black="python -c \"import tkinter as tk; tk.Tk().config(bg='#000000');tk.mainloop()\""

alias reboot="systemctl reboot" # so I can uise --firmware-setup
alias hibernate="systemctl hibernate"
if [ "$TERM" = "xterm-kitty" ]
    alias icat="kitten icat"
    alias ssh="kitten ssh"
end

alias smallfetch="albafetch --config /home/alba4k/.config/albafetch/albafetch_small.conf" &

set fish_greeting

set tide_git_icon 

#alias sudo=doas
#alias sudoedit="doas nvim"

alias v4l2start="gst-launch-1.0 libcamerasrc name="hi556" ! queue ! videoconvert ! video/x-raw,format=YUY2 ! v4l2sink name=v4l2sink-hi556 device=/dev/video60"

zoxide init --cmd cd fish | source

#thefuck --alias | source
