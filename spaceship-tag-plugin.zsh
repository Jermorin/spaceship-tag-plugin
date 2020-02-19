SPACESHIP_TAG_PREFIX="${SPACESHIP_TAG_PREFIX="on"} "
SPACESHIP_TAG_SUFFIX="${SPACESHIP_TAG_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_TAG_SYMBOL="${SPACESHIP_TAG_SYMBOL="\uf02b"}"
SPACESHIP_TAG_COLOR="${SPACESHIP_TAG_COLOR="yellow"}"

spaceship_tag() {
  [[ $SPACESHIP_TAG_SHOW == false ]] && return

  spaceship::is_git || return

  local 'git_last_tag'
  git_last_tag=$(git describe --tags --abbrev=0 --always 2>/dev/null)

  [[ -z $git_last_tag ]] && return

  # Display WIP section
  spaceship::section \
    "$SPACESHIP_TAG_COLOR" \
    "$SPACESHIP_TAG_PREFIX" \
    "$SPACESHIP_TAG_SYMBOL $git_last_tag " 
}