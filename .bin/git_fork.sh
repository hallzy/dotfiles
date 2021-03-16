#!/bin/bash

SCRIPT_CALL="$0"
FORKER_USERNAME='hallzy'
REPO_NAME=''
REPO_DOMAIN=''
UPSTREAM_URL=''

usage() {
    echo "$SCRIPT_CALL url_of_repo_to_fork [forker_repo_domain]"
}

parseArgs() {
    if [ -z "$1" ]; then
        usage;
        exit 1;
    fi

    UPSTREAM_URL="$1"

    REPO_NAME="$(echo "$1" | awk -F'/' '/^https?:\/\// { print $5; exit } { print $3 }')"

    if [ -n "$2" ]; then
        REPO_DOMAIN="$2"
    else
        REPO_DOMAIN="$(echo "$1" | awk -F'/' '/^https?:\/\// { print $3; exit } { print $1 }')"
    fi
}

clone() {
    local repoToClone="git@${REPO_DOMAIN}:${FORKER_USERNAME}/${REPO_NAME}"
    git clone "$repoToClone"
    if [ $? -ne 0 ]; then
        err -e "Failed to clone your fork. Make sure the forked repo exists: https://${REPO_DOMAIN}/${FORKER_USERNAME}/${REPO_NAME}";
        exit 1;
    else
        echo "Cloned Repo: https://${REPO_DOMAIN}/${FORKER_USERNAME}/${REPO_NAME}";
    fi
}

addRemote() {
    git remote add upstream "$UPSTREAM_URL"
    if [ $? -ne 0 ]; then
        err -e "Failed to add 'upstream' remote: ${UPSTREAM_URL}";
        exit 1;
    else
        echo "Added 'upstream' remote: ${UPSTREAM_URL}";
    fi
}

setParentTracking() {
    git config --local "branch.${1}.git-radar-tracked-remote" "upstream/${1}";
    if [ $? -ne 0 ]; then
        err -e "Failed to set parent tracking: $1";
        exit 1;
    else
        echo "Set parent tracking: $1";
    fi
}

setUpstreamParentTracking() {
    git config --local "branch.upstream-${1}.git-radar-tracked-remote" "upstream/${1}";
    if [ $? -ne 0 ]; then
        err -e "Failed to set upstream parent tracking: $1";
        exit 1;
    else
        echo "Set upstream parent tracking: $1";
    fi
}

setUpstreamRemote() {
    git branch --set-upstream-to=upstream/"${1}"
    if [ $? -ne 0 ]; then
        err -e "Failed to set upstream remote: $1";
        exit 1;
    else
        echo "Set upstream remote: $1";
    fi
}

fetchUpstream() {
    git fetch upstream "${1}"
    if [ $? -ne 0 ]; then
        err -e "Failed to fetch upstream: upstream $1";
        exit 1;
    else
        echo "Fetched upstream: upstream $1";
    fi
}

main() {
    parseArgs "$@"

    clone
    cd "$REPO_NAME"
    if [ $? -ne 0 ]; then
        err -e "Couldn't enter repo clone './${REPO_NAME}'";
        exit 1;
    fi

    addRemote

    local forkMaster="$(git rev-parse --abbrev-ref HEAD)"

    setParentTracking "$forkMaster"

    # Create new local branch which will be tracking upstream
    git cob "upstream-${forkMaster}";
    setUpstreamParentTracking "$forkMaster"

    fetchUpstream "$forkMaster"

    setUpstreamRemote "$forkMaster"

    git reset --hard "upstream/${forkMaster}"

    git co "$forkMaster"
}

main "$@"
