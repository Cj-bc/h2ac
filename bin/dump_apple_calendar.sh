#!/usr/bin/env bash
#
# wrapper script of applescript/dump_apple_calendar.applescript
#
# Copyright 2019 (c) Cj-bc a.k.a Cj.BC_SD
# This software is released under MIT License
#
# @(#) version 0.1.0

temp_output=$(mktemp -t h2ac_dump_a_c_XXXXXXXXXXX)
osascript ${BASH_SOURCE[0]%/*}/../applescript/dump_apple_calendar.applescript "$temp_output" >/dev/null
cat "$temp_output"
rm "$temp_output"
