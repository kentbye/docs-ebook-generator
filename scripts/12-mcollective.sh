#!/bin/bash

# Set up the variables
DIRECTORY='mcollective';
FILENAME='mcollective';
INPUTFILENAME='mcollective_menu_INPUT.txt';
TITLE="<dc:title>MCollective User's Guide</dc:title>";

# Create the XML metadata file
METADATA=`cat ../metadata/xml/TEMPLATE.xml`;
echo $TITLE$METADATA > ../metadata/xml/$FILENAME.xml;

# Change into the directory
cd ../puppetdocs-latest/$DIRECTORY;

# NOTES about mcollective_menu_INPUT.txt
# Replaced  /mcollective/ with spaces
# added index.html to the first line
# CHANGED deploy/middleware/ to deploy/middleware/index.html
# CHANGED simplerpc/ to simplerpc/index.html
# CHANGED reference/ to reference/index.html
# Removed carriage returns 

# TODO: Fix these photos
# Could not find image `/mcollective/images/mcollective-aaa.png', skipping...
# Could not find image `../../images/subcollectives-impact.png', skipping...
# Could not find image `../../images/subcollectives-collectives.png', skipping...
# Could not find image `../../images/subcollectives-multiple-middleware.png', skipping...
# Could not find image `/mcollective/images/activemq-multi-locations.png', skipping...

# Run Pandoc to generate epub ($DIRECTORY is one level deep)
pandoc -o $FILENAME.epub `cat ../../metadata/input/$INPUTFILENAME` --epub-cover-image=../../metadata/cover/$FILENAME.png --epub-metadata=../../metadata/xml/$FILENAME.xml --toc --toc-depth=2;

# Copy the epub back to the metadata directory ($DIRECTORY is one level deep)
mv $FILENAME.epub ../../ebooks;