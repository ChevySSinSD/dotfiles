# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Launch Neofetch
neofetch

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Eric's Configs

#Git
##Git aliases
alias config='/usr/bin/git --git-dir=/home/eric/.cfg/ --work-tree=/home/eric'
alias g='git'
alias gfu='git fetch upstream'
alias gfo='git fetch origin'
alias gr='git rebase'
alias gs='git status'
alias gc='git checkout'
alias gl="git log --pretty=format:'%Cblue%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%an%Creset' --abbrev-commit --date=relative"
alias gbranches='git branch -a'
alias gnb='git checkout -b'
alias gnewbranch='git checkout -b'
alias grmbranch='git branch -d'
alias gd='git diff'
alias gss='git stash save'
alias gsp='git stash pop'
alias gsl='git stash list'
alias ga='git add'
alias gaa='git add -A'
alias gcom='git commit'
alias gcommam='git add -A && git commit -m'
alias gcomma='git add -A && git commit'
alias gcommend='git add -A && git commit --amend --no-edit'
alias gm='git merge'
alias gcp='git cherry-pick'
alias gpoh='git push origin HEAD'
alias gcd='cd ~/Git/'
### From https://docs.gitlab.com/ee/user/project/merge_requests/#checkout-merge-requests-locally : e.g. gcmr upstream 12345
gcmr() { git fetch $1 merge-requests/$2/head:mr-$1-$2 && git checkout mr-$1-$2; }
### This function prunes references to deleted remote branches and
### deletes local branches that have been merged and/or deleted from the remotes.
### It is intended to be run when on a master branch, and warns when it isn't.
gclean (){
  local BRANCH=`git rev-parse --abbrev-ref HEAD`
  # Warning if not on a master* branch
  if [[ $BRANCH != master* ]]
  then
    echo -e "\e[91m!! WARNING: It looks like you are not on a master branch !!\e[39m"
    read -r -p "Are you sure you want to continue? [y/N] " response
    if ! [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
    then
      echo "Aborted. Nothing was changed."
      return 1
    fi
  fi
  echo "Simulating a clean on $BRANCH ..." \
  && echo "===== 1/3: simulating pruning origin =====" \
  && git remote prune origin --dry-run \
  && echo "===== 2/3: simulating pruning upstream =====" \
  && git remote prune upstream --dry-run \
  && echo "===== 3/3: simulating cleaning local branches merged to $BRANCH =====" \
  && git branch --merged $BRANCH | grep -v "^\**\s*master"  \
  && echo "=====" \
  && echo "Simulation complete."
  read -r -p "Do you want to proceed with the above clean? [y/N] " response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    echo "Running a clean on $BRANCH ..."
    echo "===== 1/3: pruning origin =====" \
    && git remote prune origin \
    && echo "===== 2/3: pruning upstream =====" \
    && git remote prune upstream \
    && echo "===== 3/3: cleaning local branches merged to $BRANCH =====" \
    && git branch --merged $BRANCH | grep -v "^\**\s*master" | xargs git branch -d \
    && echo "=====" \
    && echo "Clean finished."
  else
    echo "Aborted. Nothing was changed."
  fi
}
### Sync local and origin branch from upstream: runs a fetch from upstream + rebase local + push to origin
gsync (){
  local BRANCH=`git rev-parse --abbrev-ref HEAD`
  echo "Syncing the current branch: $BRANCH"
  echo "===== 1/3: fetching upstream =====" \
  && git fetch upstream \
  && echo "===== 2/3: rebasing $BRANCH =====" \
  && git rebase upstream/$BRANCH \
  && echo "===== 3/3: pushing to origin/$BRANCH =====" \
  && git push origin $BRANCH \
  && echo "=====" \
  && echo "Syncing finished."
}
### Function to take git interactive rebase argument. e.g.: gir 2
gri() { git rebase -i HEAD~$1; }
gir() { git rebase -i HEAD~$1; }
### Function to undo all changes (including stages) back to the last commit, with a confirmation.
gundoall () {
  echo "WARNING: This will delete all untracked files, and undo all changes since the last commit."
  read -r -p "Are you sure? [y/N] " response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    echo "===== 1/2: git reset --hard HEAD =====" \
    && git reset --hard HEAD \
    && echo "===== 2/2: git clean -fd \$(git rev-parse --show-toplevel) =====" \
    && git clean -fd $(git rev-parse --show-toplevel)
  else
    echo "Aborted. Nothing was changed."
  fi
}


## git bash completion for aliases
# To Setup:
# 1) Save the .git-completion.bash file found here:
#    https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
# 2) Add the following lines to your .bash_profile, be sure to reload (for example: source ~/.bash_profile) for the changes to take effect:
if [ -f ~/bashscripts/git-completion.bash ]; then
  . ~/bashscripts/git-completion.bash

  # Add git completion to the aliases: you must manually match each of your aliases to the respective function for the git command defined in git-completion.bash.
  __git_complete g __git_main
  __git_complete gc _git_checkout
  __git_complete gnb _git_checkout
  __git_complete gnewbranch _git_checkout
  __git_complete gm _git_merge
  __git_complete grmbranch _git_branch
  __git_complete gr _git_rebase
  __git_complete gl _git_log
  __git_complete ga _git_add
  __git_complete gd _git_diff
  __git_complete gcom _git_commit
  __git_complete gcomma _git_commit
  __git_complete gcmr _git_ls_remote
fi

## Custom git prompt configuration https://github.com/magicmonty/bash-git-prompt
  # Set config variables first
  GIT_PROMPT_ONLY_IN_REPO=0

  # GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status

  # Lucas: change fetch interval to 60 minutes (default is 5)
  GIT_PROMPT_FETCH_TIMEOUT=60

  # as last entry source the gitprompt script
  GIT_PROMPT_THEME=Lucas_bullettrain_tags # use custom .git-prompt-colors.sh
  source ~/bashscripts/bash-git-prompt/gitprompt.sh
