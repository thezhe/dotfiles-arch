#!/usr/bin/env sh
## Strict mode
set -eu
IFS="$(printf '\n')"
readonly IFS
## Constants
template_script_path="$(
	script_directory="$(dirname -- "${0}")"
	cd -- "${script_directory}" >/dev/null 2>&1
	pwd -P
)"
# shellcheck disable=SC2034
readonly template_script_path
## CLI
template_help() {
	printf 'POSIX shell script template\n\nUsage:\n\t%s' \
		'template.sh'
}
if [ 1 -eq "${#}" ] && [ "-h" = "${1}" ]; then
	template_help
	exit 0
fi
if ! [ 0 -eq "${#}" ]; then
	template_help
	exit 1
fi
## Process
echo 'Hello, World!'
exit 0
