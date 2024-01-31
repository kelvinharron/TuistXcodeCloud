#!/bin/sh
echo "--- Generating mocks"
echo "--- Generating mocks"
echo "Start PATH"
echo $PATH
echo "End PATH"
echo "Start ~/.local/bin/"
echo ls -l ~/.local/bin/
echo "End ls -l ~/.local/bin/"

current_path=$(pwd)
echo "Current working directory: $current_path"
relative_root_path="./Targets/TuistXcodeCloud"
relative_path="./Targets/TuistXcodeCloud/Tests/GeneratedMocks.swift"

mise x -- mockolo -s $relative_root_path -d $relative_path -i TuistXcodeCloud
