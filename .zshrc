export ZSH="$HOME/.oh-my-zsh"
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

#-------------------
#------------------- VIM MODE
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

#-------------------
#------------------- ALIAS
alias c:="cd /media/adrs/Local"
alias d:="cd /media/adrs/Data"
alias e:='cd "/media/adrs/TOSHIBA EXT"'
alias webdev="cd /run/media/adrs/'Nuevo vol'/webDevelopment"
alias pz="cd ~/Documents/platzi"
alias lv="nvim -c':e#<1'"
alias v="nvim"
alias vrc="v ~/.config/nvim/init.lua"
alias vimrc="vim ~/.vimrc"
alias zrc="v ~/.zshrc"
alias brc="v ~/.bashrc"
alias trc="v ~/.tmux.conf"
alias x=exit
alias cli="xclip"
alias pcli="xclip -out"
alias cpwd="pwd | tr -d '\n' | xclip && echo 'pwd copied to clipboard'"
alias open="xdg-open"
# alias treel='ls-tree -r dev --name-only'
alias micro='cd ~/Documents/microverse/'
alias cursos='cd ~/Documents/cursos'
alias rng='ranger'
alias py='python3'
alias ipy='ipython3'
alias aenv='source venv/bin/activate'
alias lst='exa --long --icons -a -s=created -r --group-directories-first'
alias ls='exa --icons -s=created -r --group-directories-first'
alias gsts='gst -s'
alias tree='exa --tree --group-directories-first --level=1 --icons'
alias pwdf='echo '-------------' && pwd && echo '-------------' && ls'
alias dnv='docker start -i mynginx2'
alias kmd='sudo /etc/sv/kmonad/run'
alias dvm='cd /home/$USER/Documents/development'
alias fd='fdfind'
alias dv='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim'
alias rvim='sudo vim -u ~/.rvimrc'
alias svim='sudo -E vim'
alias t='tmux_new'
alias dotf='cd /home/$USER/Documents/dotfiles_pop_os/' 
# USB
alias dvm2='/media/$USER/d9b427fd-dd9a-43f4-a718-52d7239d54d4/home/user02/Documents/development'
alias dotf2='/media/$USER/d9b427fd-dd9a-43f4-a718-52d7239d54d4/home/user02/Documents/dotfiles_pop_os'
alias user2='/media/$USER/d9b427fd-dd9a-43f4-a718-52d7239d54d4/home/user02/'

#-------------------
#------------------- FUNCTIONS
# Autopair
if [[ ! -d ~/.zsh-autopair ]]; then
  git clone https://github.com/hlissner/zsh-autopair ~/.zsh-autopair
fi

source ~/.zsh-autopair/autopair.zsh
autopair-init

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

# Tmux
bindkey -s '^s^s' 'tmux_session_xplorer\n'
bindkey -s '^s^d' 'tmux_session_xplorer dev\n'

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

rga-fzf() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
	echo "opening $file" &&
	xdg-open "$file"
}

#-------------------
#-------------------BINDKEYS 
# bindkey -M menuselect '^M' .accept-line
bindkey '\ey' autosuggest-accept
# Edit line in vim with ctrl-e:
bindkey '^e' edit-command-line

#-------------------
#-------------------PATHS 
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
export PATH="/home/$USER/.local/bin:$PATH"
export PATH="/home/$USER/.cargo/bin:$PATH"
export PATH=$PATH:"/home/$USER/Documents/dotfiles_pop_os/.scripts/"

#-------------------
#-------------------VERSION MANAGERS 
# node version manager
export PATH=~/.nvm/versions/node/v16.20.2/bin:$PATH
export NVM_DIR=~/.nvm
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh" --no-use
# ruby version manager
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
# export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

#-------------------
#-------------------OTHERS 
export VISUAL=nvim;
export EDITOR=nvim;
export FZF_DEFAULT_COMMAND="fdfind --exclude={.git,.sass-cache} --type f"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
LS_COLORS=$LS_COLORS:'tw=01;35:ow=01;35:' ; export LS_COLORS
# xsetwacom set "Wacom Intuos S 2 Pen stylus" Button 2 "pan"
# xsetwacom --set "Wacom Intuos S 2 Pen stylus" "PanScrollThreshold" 200
#zoxide
eval "$(zoxide init zsh)"
# Load Angular CLI autocompletion.
# source <(ng completion script)
