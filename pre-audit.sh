#!/bin/bash
# runs lighthouse (performance testing) for new pages of the site and saves them in date appropriate directories with simple-to-understand file names

# create a writable directory based on current month & year

NOW=$(date +"%m-%y")
SECONDS=0

if [ ! -d "$NOW" ]
	then mkdir "$NOW"; chmod +w "$NOW"
fi


# the home and page not found page didn't format nicely into the array/loop/echo, so it runs outside the loop on its own
echo "Testing: page"
lighthouse --config-path=./vitamix-config.json https://vmx-preview-p.sparkred.com/us/en_us/commercial/non-commercial --quiet --chrome-flags="--headless" --output html --output-path="$NOW/prelaunch/non-commercial.html"

duration="$SECONDS"

echo "Audit completed in $(($duration / 60)) minutes and $(($duration % 60)) seconds."