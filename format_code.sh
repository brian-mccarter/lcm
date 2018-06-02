#!/bin/bash

if (perl -e '' 2>/dev/null)
  then SCRIPT_DIR="$(dirname "$(perl -MCwd -le 'print Cwd::abs_path(shift)' "$0")")"
  else SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
fi

export SCRIPT_DIR

function format_dir_r {
    find "$1" -regex '.*\.\(c\|h\)\(pp\)?' -print0 | xargs -0 clang-format -i
}

format_dir_r "${SCRIPT_DIR}/lcm"
