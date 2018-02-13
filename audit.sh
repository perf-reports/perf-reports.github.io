#!/bin/bash
# runs lighthouse (performance testing) for top pages of the site and saves them in date appropriate directories with simple-to-understand file names

# create a writable directory based on current month & year
NOW=$(date +"%m-%y")
mkdir "$NOW"; chmod +w "$NOW"
SECONDS=0

# the home page didn't format nicely into the array/loop/echo, so it runs outside the loop on its own
echo "Testing home"
lighthouse --config-path=./vitamix-config.json https://www.vitamix.com --quiet --chrome-flags="--headless" --output html --output-path="$NOW/home.html"


# these are the pages to be tested, using their url path minus the root domain (country and language codes also excluded)
PATHS="why-vitamix what-you-can-make find-recipes be-inspired support shop shop/blenders shop/ascent-series shop/legacy-series shop/personal-series shop/e310 shop/recommender"

# announces which page is being tested, creates a report with the page title for the file name and puts it in this month's directory
for path in $PATHS; do

    # removes sections from the URL path to provide page title only
    title=${path##*/}
    echo "Testing: $title"
    lighthouse --config-path=vitamix-config.json "https://www.vitamix.com/$path" --quiet --chrome-flags="--headless" --output html --output-path="$NOW/$title.html"

done

#calculates time taken to run all the audits
duration="$SECONDS"

echo "Audits completed in $(($duration / 60)) minutes and $(($duration % 60)) seconds."