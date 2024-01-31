#!/bin/sh
echo "--- Generating mocks"

current_path=$(pwd)
echo "Current working directory: $current_path"
relative_root_path="./Targets/TuistXcodeCloud"
relative_path="./Targets/TuistXcodeCloud/Tests/GeneratedMocks.swift"

~/.local/bin/mise x -- mockolo -s $relative_root_path -d $relative_path -i TuistXcodeCloud
