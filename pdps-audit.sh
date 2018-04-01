#!/bin/bash
# runs lighthouse (performance testing) for top pages of the site and saves them in date appropriate directories with simple-to-understand file names

# create a writable directory based on current month & year
NOW=$(date +"%m-%y")
mkdir "$NOW/pdps"; chmod +w "$NOW/pdps"
SECONDS=0

# these are the pdps to be tested, using their url path minus the root domain (country and language codes also excluded)
PATHS="shop/a3500 shop/a3300 shop/a2500 shop/a2300 shop/s55"

# announces which page is being tested, creates a report with the page title for the file name and puts it in this month's directory
for path in $PATHS; do

    # removes sections from the URL path to provide page title only
    title=${path##*/}
    echo "Testing: $title"
    lighthouse --config-path=vitamix-config.json "https://www.vitamix.com/$path" --quiet --chrome-flags="--headless" --output html --output-path="$NOW/pdps/$title.html"

done

#calculates time taken to run all the audits
duration="$SECONDS"

echo "Audits completed in $(($duration / 60)) minutes and $(($duration % 60)) seconds."