#!/usr/bin/env bash

set -Eeuo pipefail

trap cleanup SIGINT SIGTERM ERR EXIT

cleanup() {
    trap - SIGINT SIGTERM ERR EXIT
}

usage() {
    cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") [OPTIONS] <ARG1> [ARG2 ...]

FIXME: description

Options:
    -C      Disable color output
    -f FOO  Description for flag f with optarg FOO
    -h      Print this help message and exit
    -v      Enable verbose output
EOF
    exit
}

say() {
    echo -e "### ${1-}" >&2
}

error() {
    say "ERROR: ${1-}"
}

warn() {
    say "WARNING: ${1-}"
}

die() {
    error "${1-}"
    exit "${2-1}"
}

USE_COLOR=1

parse_opts() {
    while getopts ":Cf:hv" optname; do
        case "${optname}" in
            C)
                USE_COLOR=0
                ;;
            f)
                FOO=${OPTARG}
                ;;
            h)
                usage
                ;;
            v)
                set -x
                ;;
            \?)
                die "Invalid option: ${OPTARG}"
                ;;
            :)
                die "Invalid option: ${OPTARG} requires an argument"
                ;;
            *)
                break
                ;;
        esac
    done

    shift $((OPTIND - 1))
}

setup_colors() {
    if [[ -t 2 ]] && [[ ${USE_COLOR} -eq 1 ]] && [[ "${TERM-}" != "dumb" ]]; then
        BLUE="\033[0;34m]"
        CYAN="\033[0;36m]"
        GREEN="\033[0;32m]"
        NO_COLOR="\033[0;0m]"
        ORANGE="\033[0;33m]"
        PURPLE="\033[0;35m]"
        RED="\033[0;31m]"
        YELLOW="\033[0;33m]"
    else
        BLUE=""
        CYAN=""
        GREEN=""
        NO_COLOR=""
        ORANGE=""
        PURPLE=""
        RED=""
        YELLOW=""
    fi
}

parse_opts "$@"
setup_colors
