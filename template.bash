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

die() {
    error "${1-}"
    exit "${2-1}"
}

parse_opts() {
    while getopts ":Cf:hv" optname; do
        case "${optname}" in
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
}

parse_opts "$@"
shift $((OPTIND - 1))
