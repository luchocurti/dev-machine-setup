# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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
HISTSIZE=10000      # Current session commands
HISTFILESIZE=20000  # History file commands

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
# [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color|*-256color) color_prompt=yes;;
#esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#	# We have color support; assume it's compliant with Ecma-48
#	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

# Build a custom PS1 prompt with colors, relevant info, and custom separators
#     Format: ✔/✘ HH:MM 🗂️ ╭⟮[env] user@host:directory [branch/hash][*]⟯
#                          ╰──❭ $/# 
#    Example:   ✔ 10:43 🗂️ ╭⟮luciano@vivobook:~/project master⟯
#                          ╰──❭ $ 
# Escape sequences (See "PROMPTING" section in man bash)
BELL="\a"         # An ASCII bell character (causes the terminal to beep; equal to \007)
DATE="\d"         # The date in "Weekday Month Date" format (e.g., "Tue May 26")
ESC="\e"          # An ASCII escape character (used to begin a color escape sequence; equal to \033)
HOSTNAME="\h"     # The hostname. Options:
#        "\h"     #  - Up to the first dot
#        "\H"     #  - Full hostname
JOBS="\j"         # The number of jobs currently managed by the shell
DEVICE_NAME="\l"  # The basename of the shell's terminal device name (e.g., "tty1")
NEWLINE="\n"      # A newline character (equal to \012)
CAR_RETURN="\r"   # A carriage return (equel to \015)
SHELL_NAME="\s"   # The name of the shell, the basename of $0 (e.g., "bash")
TIME="\A"         # The current time. Options:
#    "\t"         #  - In 24-hour format (HH:MM:SS)
#    "\T"         #  - In 12-hour format (HH:MM:SS)
#    "\@"         #  - In 12-hour am/pm format
#    "\A"         #  - In 24-hour format (HH:MM)
USERNAME="\u"     # The current username
BASH_VERSION="\v" # The version of Bash (e.g., 5.0)
BASH_RELEASE="\V" # The release of Bash, version + patch level (e.g., 2.00.0)
DIRECTORY="\w"    # The working directory, Options:
#         "\w"    #  - Current working directory, with $HOME abbreviated as "~"
#         "\W"    #  - Basename of the current working directory, with $HOME abbreviated as "~"
COMMAND_HIST="\!" # The history number of this command
COMMAND_NUMB="\#" # The command number of this command
PROMPT="\$"       # If the effective UID is 0, a "#" is displayed; otherwise, a "$" is shown
BACKSLASH1="\\"   # A literal backslash
BACKSLASH2="\b"   # A backslash. (equal to \010)
# Icons:
EXIT_OK="✔"       # OK exit status indicator. Other options: "ok", "OK", "✓", "✅"
EXIT_ERR="✘"      # Error exit status indicator. Other options: "x", "X", "error", "ERROR", "✘", "❌"
SEP_HOST="@"      # Hostname separator. Other options: " at ", "＠", "﹫", "@"
SEP_DIR=":"       # Directory separator. Other options: " ", " : ", " in ", ":"
EMPTY="📂"        # Empty directory. Other option: 📭
NONEMPTY="🗂️ "    # Non-empty directory. Other option: 📬
ARROW_START="╭⟮"  # Arrow that surrounds the prompt and points to the next line
ARROW_NEWLINE="⟯${NEWLINE}"
ARROW_END="           ╰──❭ "
# True Color (24-bit) Mode
RESET="\[${ESC}[00m\]"
NORMAL_FONT=""
BOLD_FONT="1;"
FOREGROUND="38"   # Change the Text Color
BACKGROUND="48"   # Change the Background Color
MODE_TRUE_COLOR="2"
MODE_256_COLOR="5"
BOLD_FORE="${BOLD_FONT}${FOREGROUND};${MODE_TRUE_COLOR}"
# Colors
RED="\[${ESC}[${BOLD_FORE};255;0;0m\]"
LIGHT_RED="\[${ESC}[${BOLD_FORE};255;102;102m\]"
DARK_RED="\[${ESC}[${BOLD_FORE};139;0;0m\]"
CRIMSON="\[${ESC}[${BOLD_FORE};220;20;60m\]"
TOMATO="\[${ESC}[${BOLD_FORE};255;99;71m\]"
FIREBRICK="\[${ESC}[${BOLD_FORE};178;34;34m\]"
SALMON="\[${ESC}[${BOLD_FORE};250;128;114m\]"
BROWN="\[${ESC}[${BOLD_FORE};165;42;42m\]"
GREEN="\[${ESC}[${BOLD_FORE};0;255;0m\]"
LIGHT_GREEN="\[${ESC}[${BOLD_FORE};144;238;144m\]"
DARK_GREEN="\[${ESC}[${BOLD_FORE};0;100;0m\]"
LIME_GREEN="\[${ESC}[${BOLD_FORE};50;205;50m\]"
SPRING_GREEN="\[${ESC}[${BOLD_FORE};0;255;127m\]"
SEA_GREEN="\[${ESC}[${BOLD_FORE};46;139;87m\]"
CHARTREUSE="\[${ESC}[${BOLD_FORE};127;255;0m\]"
BLUE="\[${ESC}[${BOLD_FORE};0;0;255m\]"
LIGHT_BLUE="\[${ESC}[${BOLD_FORE};173;216;230m\]"
DODGER_BLUE="\[${ESC}[${BOLD_FORE};30;144;255m\]"
BRIGHT_BLUE="\[${ESC}[${BOLD_FORE};0;102;255m\]"
NAVY="\[${ESC}[${BOLD_FORE};0;0;128m\]"
YELLOW="\[${ESC}[${BOLD_FORE};255;255;0m\]"
GOLD="\[${ESC}[${BOLD_FORE};255;215;0m\]"
ORANGE="\[${ESC}[${BOLD_FORE};255;165;0m\]"
DARK_ORANGE="\[${ESC}[${BOLD_FORE};210;103;21m\]"
CYAN="\[${ESC}[${BOLD_FORE};0;255;255m\]"
TURQUOISE="\[${ESC}[${BOLD_FORE};64;224;208m\]"
MAGENTA="\[${ESC}[${BOLD_FORE};255;0;255m\]"
PURPLE="\[${ESC}[${BOLD_FORE};128;0;128m\]"
PINK="\[${ESC}[${BOLD_FORE};200;10;100m\]"
DEEP_PINK="\[${ESC}[${BOLD_FORE};255;20;147m\]"
WHITE="\[${ESC}[${BOLD_FORE};255;255;255m\]"
GRAY="\[${ESC}[${BOLD_FORE};128;128;128m\]"
LIGHT_GRAY="\[${ESC}[${BOLD_FORE};211;211;211m\]"
DARK_GRAY="\[${ESC}[${BOLD_FORE};169;169;169m\]"
SILVER="\[${ESC}[${BOLD_FORE};192;192;192m\]"
BLACK="\[${ESC}[${BOLD_FORE};0;0;0m\]"
# Display test colors
#echo -e "${COLOR_NAME} COLOR_NAME ${RESET}"

# Capture the exit status of the last command and build the prompt
PROMPT_COMMAND='LAST_EXIT=$?; build_prompt'

# Check if the current directory is empty
check_empty() {
    # ls -A lists all files except . and ..
    if [ -z "$(ls -A 2>/dev/null)" ]; then
        echo "${EMPTY}"    # Emoji for an empty directory.
    else
        echo "${NONEMPTY}" # Emoji for a non-empty directory.
    fi
}

# Get git information with dirty marker if changes exist
parse_git_info() {
    # Check if we are in a git repository
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        return
    fi

    local branch_info dirty_status

    # Try to get the current branch name (or "HEAD" if detached)
    branch_info=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ $? -eq 0 ]; then
        # When on a branch, branch_info will not be "HEAD"
        if [ "$branch_info" = "HEAD" ]; then
            branch_info="det@$(git rev-parse --short HEAD 2>/dev/null)"
        fi
    fi

    # Check for any changes or untracked files
    # git status --porcelain returns output if there are changes
    if [ -n "$(git status --porcelain 2>/dev/null)" ]; then
        dirty_status="*"
    else
        dirty_status=""
    fi

    echo "${branch_info}${dirty_status}"
}

# Build the PS1 prompt
build_prompt() {
    local prompt="${RESET}"

    # Exit status indicator (green check or red x)
    if [[ $LAST_EXIT == 0 ]]; then
        prompt+="${GREEN}${EXIT_OK} "
    else
        prompt+="${RED}${EXIT_ERR} "
    fi

    # Current time
    prompt+="${PURPLE}${TIME} "

    # Empty or non-empty folder
    prompt+="$(check_empty) "

    # Start the arrow that surrounds the prompt
    prompt+="${GRAY}${ARROW_START}"

    # Virtual environment
    if [ -n "$VIRTUAL_ENV" ]; then
        prompt+="${WHITE}($(basename $VIRTUAL_ENV)) "
    fi

    # Chroot info if available
    if [[ -n "$debian_chroot" ]]; then
        prompt+="${WHITE}(${debian_chroot}) "
    fi

    # Current username
    prompt+="${SEA_GREEN}${USERNAME}"

    # Host symbol
    prompt+="${WHITE}${SEP_HOST}"

    # Hostname
    prompt+="${DARK_ORANGE}${HOSTNAME}"

    # Directory symbol
    prompt+="${WHITE}${SEP_DIR}"

    # Current working directory
    prompt+="${BRIGHT_BLUE}${DIRECTORY}"

    # Git branch or detached commit (if in a git repository)
    local git_info
    git_info=$(parse_git_info)
    if [[ -n "$git_info" ]]; then
        prompt+=" ${DARK_RED}${git_info}"
    fi

    # End the arrow that points to the next line
    prompt+="${GRAY}${ARROW_NEWLINE}"

    # Second line
    prompt+="${RESET}${GRAY}${ARROW_END}"

    # Prompt symbol ('#' for root / '$' for non-root)
    prompt+="${WHITE}${PROMPT} ${RESET}"

    # Set the terminal window title (Format: username@host:directory)
    prompt+="\[${ESC}]0;${USERNAME}${SEP_HOST}${HOSTNAME}${SEP_DIR}${DIRECTORY}${BELL}\]"

    PS1="${prompt}"
}

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

# Create an alias for python to point to python3
alias python='python3'
