#!/bin/bash

export SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

function format_dir_r {
    find "$1" -regex '.*\.\(c\|h\)\(pp\)?' -print0 | xargs -0 clang-format -i
}

format_dir_r "${SCRIPT_DIR}/lcm"
