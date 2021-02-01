#!/usr/bin/env bash
projects=(\
	"https://github.com/ogham/exa.git" \
	"https://github.com/starship/starship.git"\
)

for project_url in "${projects[@]}"
do
	git clone --verbose $project_url 2> /dev/null &
done
