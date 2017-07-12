#
# PATH
#
prepend_to_path $HOME/.composer/vendor/bin
prepend_to_path $HOME/.rbenv/shims
prepend_to_path $HOME/bin

#
# FISH
#
set -g fish_greeting

#
# DIRECTORIES
#
set -gx DOCS      "$HOME/Documents"
set -gx DROPBOX   "$HOME/Dropbox"
set -gx NOTES     "$DROPBOX/Notes"
set -gx CODE      "$HOME/src"
set -gx HOMESTEAD "$CODE/homestead"

append_to_cdpath "."
append_to_cdpath "$CODE"

#
# EDITOR
#
set -gx EDITOR nvim

#
# MAN
#
set -gx MANPAGER 'nvim -c "set filetype=man" -'

#
# COLORS
#
set -gx CLICOLOR 1

set -g fish_color_command     green   --bold
set -g fish_color_cwd         brgrey  --bold
set -g fish_color_end         green
set -g fish_color_error       red     --bold
set -g fish_color_escape      purple
set -g fish_color_param       green
set -g fish_color_quote       yellow
set -g fish_color_valid_path  blue    --underline
set -g fish_pager_color_prefix      yellow
set -g fish_pager_color_completion  white
set -g fish_pager_color_description purple

#
# HOMEBREW
#
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx HOMEBREW_NO_INSECURE_REDIRECT 1
set -gx HOMEBREW_CASK_OPTS --require-sha

#
# PINENTRY
#
# Suppress GUI prompt--use terminal
set -gx PINENTRY_USER_DATA "USE_CURSES=1"
set -gx GPG_TTY (tty)

#
# FZF
#
set -gx FZF_DEFAULT_OPTS "--inline-info --color=16,info:8"

#
# ABBREVIATIONS
#
if status --is-interactive
	abbr --add art php artisan
	abbr --add br  brew
	abbr --add bru brew upgrade
	abbr --add c   composer
	abbr --add ci  composer install
	abbr --add cu  composer update
	abbr --add cr  composer require
	abbr --add cgi composer global install
	abbr --add cgu composer global update
	abbr --add cgr composer global require
	abbr --add cda composer dump-autoload
	abbr --add ch  composer show
	abbr --add cm  composer remove
	abbr --add cs  composer search
	abbr --add cv  composer validate
	abbr --add e   emacsclient
	abbr --add ee  emacsclient --eval
	abbr --add en  emacsclient --no-wait
	abbr --add et  emacsclient --tty
	abbr --add g   git
	abbr --add ga  git add
	abbr --add gaa git add --all
	abbr --add gb  git branch
	abbr --add gc  git commit --verbose
	abbr --add gca git commit --all --verbose
	abbr --add gcl git clone
	abbr --add gco git checkout
	abbr --add gd  git diff
	abbr --add gdc git diff --cached
	abbr --add gf  git fetch
	abbr --add gi  git init
	abbr --add gl  git log
	abbr --add gp  git push
	abbr --add gpu git pull
	abbr --add gs  git status
	abbr --add gst git stash
	abbr --add gsp git stash pop
	abbr --add lba ledger balance
	abbr --add leq ledger equity
	abbr --add lst ledger stats
	abbr --add lre ledger register
	abbr --add lxa ledger xact
	abbr --add v   nvim
	abbr --add vs  nvim -S
	abbr --add vn  nvim -u NONE
	abbr --add vd  nvim --noplugin -u minimal.vim
	abbr --add wk  webkit2png --fullsize --timestamp
	abbr --add ww  words
	abbr --add we  words --english
	abbr --add wi  words --interactive
end
