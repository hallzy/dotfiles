#!/bin/bash

isComment() {
    echo "$1" | grep "^\s*\/\/"
}

if [ -n "$1" -a "$1" = 'cached' ]; then
    extra="--cached"
fi

if ! git status > /dev/null 2>&1; then
    echo "Not in a git repo."
    exit 1;
fi

diff="$(git diff $extra --no-ext-diff --unified=0 --exit-code -a --no-prefix  | /bin/grep "^\(+\{1,2\}\|+\{4,\}\)[^+]")" | cut -c2-

regexes=(
    "	"
    "[^ ]\+ *function"
    "[^ =]\+ *[{\[]$"
    "} *, *[^ ]\+"
    "^ *[^ (]\+ *)"
)

fail=0
for regex in "${regexes[@]}"; do
    if echo "$diff" | grep "$regex"; then
        if ! isComment; then
            fail=1
        fi
    fi
done

if [ "$fail" -eq 1 ]; then
    echo "";
    err -e "Failed $extra"
    exit 1;
fi

err -s "Success $extra";
exit 0;
