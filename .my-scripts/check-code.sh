#!/bin/bash

c_style_comments=1
hash_style_comments=0

export GREP_COLORS=ne

if [ "$#" -ne 1  ]; then
  echo "Illegal number of parameters"
  exit 1;
fi
cd $1

if [ "$#" -ne 1  ]; then
  echo "Illegal number of parameters"
  exit 1;
fi

# Grep for tab characters#{{{

# Exclude Makefiles because they require tabs in order to work.
grep -Pq "\t" * -R --exclude=Makefile
if [ "$?" -eq 0 ]; then
  echo "Found Tab Characters"
  grep -PHn --color "\t" * -R --exclude=Makefile
  echo " "
fi
#}}}
# Find trailing Whitespace#{{{
grep -q "[^\s]\{1\} \+$" * -R
if [ "$?" -eq 0 ]; then
  echo "Found Trailing Whitespace"
  grep -Hn --color "[^\s]\{1\} \+$" * -R
  # grep -Hn --color ".* \+\$" * -R
  echo " "
fi
#}}}
# look for spaces between if, while, and for and the brackets#{{{
grep -q "if(" * -R
if [ "$?" -eq 0 ]; then
  echo "Found no space between \"if\" and bracket"
  grep -Hn --color "if(" * -R
  echo " "
fi
grep -q "while(" * -R
if [ "$?" -eq 0 ]; then
  echo "Found no space between \"while\" and bracket"
  grep -Hn --color "while(" * -R
  echo " "
fi
grep -q "for(" * -R
if [ "$?" -eq 0 ]; then
  echo "Found no space between \"for\" and bracket"
  grep -Hn --color "for(" * -R
  echo " "
fi
#}}}
# look for spaces between functions and  brackets#{{{
grep -Hn --color=always "[a-zA-Z0-9]\{1,\} \+(.*)" * -R | grep --color=always -Evq "if *\(|while *\(|for *\(|return *\("
if [ "$?" -eq 0 ]; then
  echo "Spaces between function and its arguments (This gets a lot of false positives)"
  # grep -Hn --color=always ".* (" * -R | grep --color=always -Ev "if *\(|while *\(|for *\("
  grep -Hn --color=always "[a-zA-Z0-9]\{1,\} \+(.*)" * -R | grep --color=always -Ev "if *\(|while *\(|for *\(|return *\("
  echo " "
fi
#}}}
# look for proper {} formatting#{{{
grep -q "){" * -R
if [ "$?" -eq 0 ]; then
  echo "Found no space between \")\" and \"{\" and bracket"
  grep -Hn --color "){" * -R
  echo " "
fi
grep -q "^ *{" * -R
if [ "$?" -eq 0 ]; then
  echo "Curly Brace is on its own line"
  grep -Hn --color "^ *{" * -R
  echo " "
fi
grep -q "else{" * -R
if [ "$?" -eq 0 ]; then
  echo "Found no space between \"else\" and bracket"
  grep -Hn --color "else{" * -R
  echo " "
fi
grep -q "}while" * -R
if [ "$?" -eq 0 ]; then
  echo "Found no space between \"while\" and bracket"
  grep -Hn --color "}while" * -R
  echo " "
fi
grep -q "do{" * -R
if [ "$?" -eq 0 ]; then
  echo "Found no space between \"do\" and bracket"
  grep -Hn --color "do{" * -R
  echo " "
fi
#}}}
# Too many spaces between anything and the {#{{{
grep -q "  {" * -R
if [ "$?" -eq 0 ]; then
  echo "Too Many spaces between a character and {"
  grep -Hn --color "  {" * -R
  echo " "
fi
#}}}
# Check for exceeding 80 characters on a line#{{{
grep -q ".\{82\}" * -R
if [ "$?" -eq 0 ]; then
  echo "Line exceeds 80 characters"
  grep -Hn --color ".\{82\}" * -R
  echo " "
fi
#}}}
# Comments must be on their own lines #{{{

# C-Style#{{{
if [ "$c_style_comments" -eq 1  ]; then
  grep -q "^.*[a-zA-Z0-9]\{1,\}.*//" * -R
  if [ "$?" -eq 0 ]; then
    echo "Comments must be on their own lines"
    grep -Hn --color "^.*[a-zA-Z0-9]\{1,\}.*//" * -R
    echo " "
  fi

  grep -q "^.*[a-zA-Z0-9]\{1,\}.*/\*" * -R
  if [ "$?" -eq 0 ]; then
    echo "Comments must be on their own lines"
    grep -Hn --color=always "^.*[a-zA-Z0-9]\{1,\}.*/\*" * -R
    echo " "
  fi
fi
#}}}
# Shell/ Python Style#{{{
if [ "$hash_style_comments" -eq 1  ]; then
  grep -q "^.*[a-zA-Z0-9]\{1,\}.*#" * -R
  if [ "$?" -eq 0 ]; then
    echo "Comments must be on their own lines"
    grep -Hn --color "^.*[a-zA-Z0-9]\{1,\}.*#" * -R
    echo " "
  fi
fi
#}}}

#}}}
# Do not use CRLF line endings#{{{
grep -q "" * -R
if [ "$?" -eq 0 ]; then
  echo "Cannot have CRLF line endings"
  grep -Hn --color "" * -R
  echo " "
fi
#}}}

