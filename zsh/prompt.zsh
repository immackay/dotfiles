# Prompt with SHA
# PROMPT='$(_user_host)$(_python_venv)%{$fg[cyan]%}%c $(git_prompt_info)%{$reset_color%}$(git_prompt_short_sha)%{$fg[magenta]%}$(_git_time_since_commit)$(git_prompt_status)${_return_status}➜ '

_return_status="%F{red}%(?..⍉ )%f"

function _user_host() {
  if [[ $(who am i) =~ \([-a-zA-Z0-9\.]+\) ]]; then
    me="%n ->"
  elif [[ logname != $USER ]]; then
    me="%n"
  fi
  if [[ -n $me ]]; then
    echo "%F{cyan}$me%f "
  fi
}

# Determine if there is an active Python virtual environment
function _python_venv() {
  if [[ $VIRTUAL_ENV != "" ]]; then
    echo "%F{blue}(${VIRTUAL_ENV##*/})%f "
  fi
}

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%F{yellow}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%f "

ZSH_THEME_GIT_PROMPT_PREFIX="%F{green}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}✗%f "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{white}◒ "
ZSH_THEME_GIT_PROMPT_CLEAN=" "
ZSH_THEME_GIT_PROMPT_ADDED="%F{cyan}✓ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{yellow}△ "
ZSH_THEME_GIT_PROMPT_DELETED="%F{red}✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%F{blue}➜ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{cyan}§ "
ZSH_THEME_GIT_PROMPT_AHEAD="%F{blue}▲ "

ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%F{white}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%F{yellow}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%F{red}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%F{white}"

#
# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function _git_time_since_commit() {
  # Only proceed if there is actually a commit.
  if git log -1 >/dev/null 2>&1; then
    # Get the last commit.
    last_commit=$(git log --pretty=format:'%at' -1 2>/dev/null)
    now=$(date +%s)
    seconds_since_last_commit=$((now - last_commit))

    # Totals
    minutes=$((seconds_since_last_commit / 60))
    hours=$((seconds_since_last_commit / 3600))

    # Sub-hours and sub-minutes
    days=$((seconds_since_last_commit / 86400))
    sub_hours=$((hours % 24))
    sub_minutes=$((minutes % 60))

    if [ $hours -gt 24 ]; then
      commit_age="${days}d "
    elif [ $minutes -gt 60 ]; then
      commit_age="${sub_hours}h${sub_minutes}m "
    else
      commit_age="${minutes}m "
    fi
    if [[ -n $(git status -s 2>/dev/null) ]]; then
      if [ "$hours" -gt 4 ]; then
        COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG"
      elif [ "$minutes" -gt 30 ]; then
        COLOR="$ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM"
      else
        COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT"
      fi
    else
      COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL"
    fi

    echo "$COLOR$commit_age%f"
  fi
}

# The prompt
NEWLINE=$'\n'
PROMPT="┍━▏$(_user_host)$(_python_venv)%F{magenta}%4~ $(git_prompt_info)%f$(_git_time_since_commit)$(git_prompt_status)${_return_status}${NEWLINE}╘══ "
export PROMPT
