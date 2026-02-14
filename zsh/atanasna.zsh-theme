# vim:ft=zsh ts=2 sw=2 sts=2
#
# agnoster's Theme - https://gist.github.com/3712874
# A Powerline-inspired theme for ZSH
#
# # README
#
# In order for this theme to render correctly, you will need a
# [Powerline-patched font](https://github.com/Lokaltog/powerline-fonts).
# Make sure you have a recent version: the code points that Powerline
# uses changed in 2012, and older versions will display incorrectly,
# in confusing ways.
#
# In addition, I recommend the
# [Solarized theme](https://github.com/altercation/solarized/) and, if you're
# using it on Mac OS X, [iTerm 2](https://iterm2.com/) over Terminal.app -
# it has significantly better color fidelity.
#
# If using with "light" variant of the Solarized color schema, set
# SOLARIZED_THEME variable to "light". If you don't specify, we'll assume
# you're using the "dark" variant.
#
# # Goals
#
# The aim of this theme is to only show you *relevant* information. Like most
# prompts, it will only show git information when in a git working directory.
# However, it goes a step further: everything from the current user and
# hostname to whether the last call exited with an error to whether background
# jobs are running in this shell will all be displayed automatically when
# appropriate.

### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts

CURRENT_BG='NONE'

case ${SOLARIZED_THEME:-dark} in
    light) CURRENT_FG='white';;
    *)     CURRENT_FG='black';;
esac

# Special Powerline characters

() {
  local LC_ALL="" LC_CTYPE="en_US.UTF-8"
  # NOTE: This segment separator character is correct.  In 2012, Powerline changed
  # the code points they use for their special characters. This is the new code point.
  # If this is not working for you, you probably have an old version of the
  # Powerline-patched fonts installed. Download and install the new version.
  # Do not submit PRs to change this unless you have reviewed the Powerline code point
  # history and have new information.
  # This is defined using a Unicode escape sequence so it is unambiguously readable, regardless of
  # what font the user is viewing this source code in. Do not replace the
  # escape sequence with a single literal character.
  # Do not change this! Do not make it '\u2b80'; that is the old, wrong code point.
  # SEGMENT_SEPARATOR=$'\ue0b0'
  SEGMENT_SEPARATOR=$'\\ue0b0'
  SEGMENT_SEPARATOR_RIGHT=$'\\ue0b2'  # Left-pointing separator
}

################################
# Left prompt
################################
# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

prompt_git() {
  bg='#FCA17D'
  fg='#FFFFFF'

  local ref=$(git symbolic-ref --short HEAD 2>/dev/null)
  [[ -z $ref ]] && return

  prompt_segment $bg $fg " $ref"
}

# prompt_git() {
#   bg='#FCA17D'
#   fg='#FFFFFF'
#   branch=$(git symbolic-ref --short HEAD 2>/dev/null)
#   tag=$(git describe --tags --exact-match 2>/dev/null)
#   stashes=$(git stash list 2>/dev/null | wc -l | xargs)
#   if [ "$stashes" -eq 0 ]; then 
#     stashes=""; 
#   else
#     stashes="  $stashes"
#   fi
#
#   if [ -n "$branch" ]; then
#     prompt_segment $bg $fg " $branch$stashes"
#   elif [ -n "$tag" ]; then
#     prompt_segment $bg $fg " $tag$stashes"
#   fi
# }

# Dir: current working directory
prompt_dir() {
  bg='#9A348E'
  fg='#FFFFFF'
  local path=${PWD/#$HOME/󰟒 }
  local -a parts=(${(s:/:)path})
  if (( ${#parts} > 3 )); then
    path="${parts[1]}/.../${parts[-2]}/${parts[-1]}"
  fi
  prompt_segment $bg $fg $path
}

#AWS Profile:
# - display current AWS_PROFILE name
# - displays yellow on red if profile name contains 'production' or
#   ends in '-prod'
# - displays black on green otherwise
prompt_aws() {
  bg='#DA627D'
  fg='#FFFFFF'
  if [ -n "$AWS_DEPLOYMENT" ]; then
    prompt_segment $bg $fg "󰅡 $AWS_DEPLOYMENT:$AWS_ENV"
  elif [ -n "$AWS_PROFILE" ]; then
    prompt_segment $bg $fg "󰅡 $AWS_PROFILE"
  fi
}

build_left_prompt() {
  RETVAL=$?
  #prompt_status
  #prompt_virtualenv
  #prompt_context
  prompt_dir
  prompt_aws
  prompt_git
  #prompt_bzr
  #prompt_hg
  prompt_end
}

################################
# Right prompt
################################
# Begin a right-side segment
prompt_segment_right() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  
  # First, print the separator
  if [[ $CURRENT_BG_RIGHT != 'NONE' && $1 != $CURRENT_BG_RIGHT ]]; then
    echo -n "%{%F{$1}%K{$CURRENT_BG_RIGHT}%}$SEGMENT_SEPARATOR_RIGHT"
  else
    echo -n "%{%F{$1}%}$SEGMENT_SEPARATOR_RIGHT"
  fi
  
  # Then print the content
  echo -n "%{$bg%}%{$fg%} "
  [[ -n $3 ]] && echo -n $3
  echo -n " "
  
  CURRENT_BG_RIGHT=$1
}

# Time prompt segment with clock icon
prompt_time() {
  prompt_segment_right '#6dd5c3' '#1e3a35' "󰥔 %T"
}

# Hostname prompt segment with computer icon
prompt_host() {
  prompt_segment_right '#6db8d5' '#192930' "󰒋 %m"
}

# Build right prompt
build_right_prompt() {
  CURRENT_BG_RIGHT='NONE'
  
  prompt_time
  # prompt_host
  
  # Reset at the end
  echo -n "%{%k%f%}"
}
################################
# FULL prompt
################################
PROMPT='$(build_left_prompt) '
RPROMPT='$(build_right_prompt)'
