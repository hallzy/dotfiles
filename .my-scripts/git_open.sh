#!/bin/bash

## Make sure that the browser variable is set.
if [ -z "$BROWSER" ] && [ -z "$browser" ]; then
  echo "ERROR: \$BROWSER variable was not set"
  exit 1
fi

REMOTE=$1

if [ "$#" -eq 2 ]; then
  BRANCH=$2
fi

## If remote is empty then fill it with origin as default
if [ -z "$REMOTE" ]; then
  REMOTE="origin"
fi

REPO_URL=$(git config --get remote.${REMOTE}.url)

if [ "$?" -ne 0 ]; then
  echo "You are either not in a git repository, or the remote \"${REMOTE}\""
  echo "doesn't exist"
  exit 2
fi

## If branch is empty then fill it with the current branch as default
if [ -z "$BRANCH" ]; then
  BRANCH=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)

  ## If that last command failed revert to use the master branch
  if [ "$?" -ne 0 ]; then
    BRANCH="master"
  ## If the branch has returned head then we are detached. Instead use the
  ## commit hash for the branch
  elif [ "$BRANCH" == "HEAD" ]; then
    BRANCH=$(git rev-parse HEAD)
  fi
fi

destination="$(git config --get "branch.${BRANCH}.git-radar-tracked-remote" | cut -d'/' -f2-)"

if  [ -z "$destination" ]; then
  destination="master"
fi

# TODO: Pretty sure this matching will only work with SSH remotes
REPO_URL="$(echo "$REPO_URL" | awk -F'[@:]' -v BRANCH="$BRANCH" -v DESTINATION="$destination" '
  {
    domain = $2;
    $1 = $2 = "";

    gsub("^ *", "");
    gsub(" *$", "");
    gsub(".git$", "");

    if (domain == "bitbucket.org") {
      print "https://bitbucket.org/" $0 "/branch/" BRANCH "?dest=" DESTINATION;
    } else if (domain == "github.com") {
      print "https://github.com/" $0 "/compare/" DESTINATION "..." BRANCH;
    } else {
      print "Unknown domain: " DOMAIN;
      print "git open will need to be modified to work with this domain";
    }
  }
')"

echo "Opening \"$REPO_URL\"..."

## Open  the REPO URL in your browser
$BROWSER $REPO_URL
