# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/adrsp/.oh-my-zsh"


ZSH_THEME="robbyrussell"
# Set spacship prompt

SPACESHIP_MODE='nerdfont-complete'
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_USER_SHOW=always
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_DIR_TRUNC=0


#---------------------------------------------------------------
#------------------- PLUGINS ----------------------------------

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
	colored-man-pages
	)
source $ZSH/oh-my-zsh.sh

#---------------------------------------------------------------

# User configuration

#---------------------------------------------------------------
#------------------- VIM MODE ----------------------------------

#Enable vi mode

bindkey -v
export KEYTIMEOUT=20

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
bindkey -M viins 'ii' vi-cmd-mode

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# ci"
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(, di{ etc..
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

#---------------------------------------------------------------
#------------------- ALIAS ----------------------------------
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias c:="cd /media/adrsp/Local"
alias d:="cd /media/adrsp/Data"
alias e:='cd "/media/adrsp/TOSHIBA EXT"'
alias webdev="cd /run/media/adrs/'Nuevo vol'/webDevelopment"
alias pz="cd ~/Documents/platzi"
alias lv="nvim -c':e#<1'"
alias v="nvim"
alias vrc="nvim ~/.config/nvim/init.vim"
alias zrc="nvim ~/.zshrc"
alias brc="nvim ~/.bashrc"
alias x=exit
alias cli="xclip"
alias pcli="xclip -out"
alias cpwd="pwd | tr -d '\n' | xclip && echo 'pwd copied to clipboard'"
alias open="xdg-open"
alias gdf='/usr/bin/git --git-dir=/home/adrs/dotfilesManjaro --work-tree=/home/adrs'
# alias treel='ls-tree -r dev --name-only'
alias treel='exa --tree --level=2 --icons --long'
alias hol='cd ~/Documents/holberton/'
alias micro='cd ~/Documents/microverse/'
alias cursos='cd ~/Documents/cursos'
alias rng='ranger'
alias py='python3'
alias ipy='ipython3'
alias aenv='source venv/bin/activate'
alias last='exa --long --icons -a'
alias ls='exa --icons'
alias tree='exa --tree --level=2 --icons'
alias cat='ccat'
alias ecom='cd ~/Documents/Freelance/ecommerce/ecommerce'
alias pwdf='echo '-------------' && pwd && echo '-------------' && ls'

#---------------------------------------------------------------
#------------------- FUNCTIONS ----------------------------------
c(){
  folder="compilers/"
  if [[ ! -d $folder   ]]; then
    mkdir $folder
  fi
  entry=$(echo "$1" | sed 's/\(\w\)\(\.c\)/\1/g')
    cc -o $entry $1
  mv $entry $folder
  ./$folder/$entry
}
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
ctrlz() {
  if [[ $#BUFFER == 0 ]]; then
    fg >/dev/null 2>&1 && zle redisplay
  else
    zle push-input
  fi
}
zle -N ctrlz
bindkey '^Z' ctrlz

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Use ranger to switch directories and bind it to ctrl-p
rngcd () {
    tmp="$(mktemp)"
    ranger --choosedir="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        # [ --datadir "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^f' 'rngcd\n'

#---------------------------------------------------------------
#-------------------  BINDKEYS AND EXPORTS ----------------------------------

# bindkey -M menuselect '^M' .accept-line
bindkey '^y' autosuggest-accept
LS_COLORS=$LS_COLORS:'tw=01;35:ow=01;35:' ; export LS_COLORS
export EDITOR='nvim'
export VISUAL='nvim'
# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"

export PATH=$PATH:'/home/adrsp/Documents/abin'

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

export SPICETIFY_INSTALL="/home/adrsp/spicetify-cli"
export PATH="$SPICETIFY_INSTALL:$PATH"

#. /etc/profile.d/vte.sh
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init - zsh)"

xsetwacom set "Wacom Intuos S 2 Pen stylus" Button 2 "pan"
xsetwacom --set "Wacom Intuos S 2 Pen stylus" "PanScrollThreshold" 200
