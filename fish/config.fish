set fish_greeting ""

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

alias gpm='git pull --rebase origin master'
alias gcf 'git branch | grep -v "master" | xargs git branch -D'
alias gl='git log -p --name-only'
alias rua='git diff --name-only | grep .rb | grep -v schema.rb | xargs bundle exec rubocop -A'

set PATH ~/.cargo/bin/ $PATH
set PATH /opt/homebrew/bin $PATH

alias be='bundle exec'
alias bi='bundle install'
alias ls='exa -lh --group-directories-first --icons'

set EDITOR 'emacs -nw'
set PATH ~/.cargo/bin/ $PATH
set PATH /Users/qwyng/Library/Application\ Support/JetBrains/Toolbox/scripts/ $PATH
set PATH /opt/homebrew/bin $PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/qwyng/google-cloud-sdk/path.fish.inc' ]; . '/Users/qwyng/google-cloud-sdk/path.fish.inc'; end
if status is-interactive
    eval (/opt/homebrew/bin/brew shellenv)
end
~/.local/bin/mise activate fish | source

if status is-interactive && not set -q TMUX
    exec tmux new-session
end
