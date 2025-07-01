#!/usr/bin/env sh
# shellcheck disable=SC2251 # '!' should invert and override exit codes
## Strict mode
set -eu
IFS="$(printf '\n')"
readonly IFS
## Constants
test_script_path="$(
	script_directory="$(dirname -- "${0}")"
	cd -- "${script_directory}" >/dev/null 2>&1
	pwd -P
)"
test_template_sh="${test_script_path}/template.sh"
readonly test_template_sh test_script_path
## Test
(
	set -x
	# Script
	"${test_template_sh}"
	# Help
	"${test_template_sh}" -h
	! "${test_template_sh}" --test
	! "${test_template_sh}" -h test
) >/dev/null
