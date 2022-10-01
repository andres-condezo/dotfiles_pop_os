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
# bindkey -M viins 'jk' vi-cmd-mode

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
alias omz="nvim ~/.oh-my-zsh"
alias c:="cd /media/adrsp/Local"
alias d:="cd /media/adrsp/Data"
alias e:='cd "/media/adrsp/TOSHIBA EXT"'
alias webdev="cd /run/media/adrs/'Nuevo vol'/webDevelopment"
alias pz="cd ~/Documents/platzi"
alias lv="nvim -c':e#<1'"
alias v="nvim"
alias vrc="nvim ~/.config/nvim/init.lua"
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
alias lsl='exa --icons -1'
alias last='exa --long --icons -a -s=created -r'
alias ls='exa --icons --group-directories-first'
alias gsts='gst -s'
alias tree='exa --tree --group-directories-first --level=1 --icons'
alias cat='ccat'
alias ecom='cd ~/Documents/Freelance/ecommerce/ecommerce'
alias pwdf='echo '-------------' && pwd && echo '-------------' && ls'
alias dnv='docker start -i mynginx2'
alias keysoup='sudo systemctl restart keyd'
alias kmd='sudo /etc/sv/kmonad/run'
alias devd='cd /home/adrsp/Documents/development'

#---------------------------------------------------------------
#------------------- FUNCTIONS ----------------------------------
compc(){
  folder="compilers/"
  if [[ ! -d $folder   ]]; then
    mkdir $folder
  fi
  entry=$(echo "$1" | sed 's/\(\w\)\(\.c\)/\1/g')
    cc -o $entry $1
  mv $entry $folder
  ./$folder/$entry
}


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

# Codi
# Usage: codi [filetype] [filename]
codi() {
  local syntax="${1:-python}"
  shift
  nvim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "$@"
}

#------------------------------------------------------------
#------------BINDKEYS AND EXPORTS --------------------------

# bindkey -M menuselect '^M' .accept-line
bindkey '\ey' autosuggest-accept
# Edit line in vim with ctrl-e:
bindkey '^e' edit-command-line

LS_COLORS=$LS_COLORS:'tw=01;35:ow=01;35:' ; export LS_COLORS
# export EDITOR='nvim'
# export VISUAL='nvim'
autoload edit-command-line; zle -N edit-command-line


if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_COMMAND="fdfind --exclude={.git,.sass-cache} --type f"
# source /usr/share/fzf/completion.zsh
# source /usr/share/fzf/key-bindings.zsh
# export FZF_DEFAULT_COMMAND='alias ag=ag . --path-to-ignore ~/.ignore'


# xsetwacom set "Wacom Intuos S 2 Pen stylus" Button 2 "pan"
# xsetwacom --set "Wacom Intuos S 2 Pen stylus" "PanScrollThreshold" 200

#------------------------------------------------------------
#---------------------PATHS --------------------------------

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"

export PATH=$PATH:'/home/adrsp/.scripts'

export PATH=$PATH:/home/adrsp/.cargo/bin

# bun completions
[ -s "/home/adrsp/.bun/_bun" ] && source "/home/adrsp/.bun/_bun"

# bun
export BUN_INSTALL="/home/adrsp/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export VISUAL=nvim;
export EDITOR=nvim;

export PATH=$PATH:$HOME/.dotnet/tools
export PATH=$PATH:$HOME/linuxbrew/.linuxbrew/bin/nvim/

#-------------------------------------------------------------
#-----------------VERSION MANAGERS --------------------------

# ruby version manager
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

