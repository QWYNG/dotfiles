set fish_greeting ""

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

alias gpm='git pull --rebase origin master'
alias gcf 'git branch | grep -v "master" | xargs git branch -D'
alias gl='git log -p --name-only'
alias rua='git diff --name-only | grep .rb | grep -v schema.rb | xargs bundle exec rubocop -A'
alias current_branch='git branch --show-current'
alias zed='zed-preview'

set PATH ~/.cargo/bin/ $PATH
set PATH /opt/homebrew/bin $PATH

alias be='bundle exec'
alias bi='bundle install'
alias ls='eza -lh --group-directories-first --icons'

function dirtouch
  mkdir -p "$(dirname $1)"
  touch "$1"
end

set EDITOR 'emacs -nw'
set PATH ~/.cargo/bin/ $PATH
set PATH /Users/qwyng/Library/Application\ Support/JetBrains/Toolbox/scripts/ $PATH
set PATH /opt/homebrew/bin $PATH
if status is-interactive
    eval (/opt/homebrew/bin/brew shellenv)
end
~/.local/bin/mise activate fish | source

if status is-interactive && not set -q TMUX
    exec tmux new-session
end

export DISABLE_SPRING=true
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hiroaki.osawa/google-cloud-sdk/path.fish.inc' ]; . '/Users/hiroaki.osawa/google-cloud-sdk/path.fish.inc'; end
