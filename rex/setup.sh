#!/usr/bin/env bash
set -e

src_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dst_dir="${XDG_CONFIG_HOME:-${HOME}/.config}/rex"

mkdir -p "${dst_dir}"
ln -s "${src_dir}/init.lua" "${dst_dir}/init.lua"
