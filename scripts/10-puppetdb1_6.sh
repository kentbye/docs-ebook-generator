#!/bin/bash

# Set up the variables
DIRECTORY='puppetdb/latest';
FILENAME='puppetdb1_6';
INPUTFILENAME='puppetdb1.6_INPUT.txt';
TITLE="<dc:title>PuppetDB 1.6 User's Guide</dc:title>";

# Create the XML metadata file
METADATA=`cat ../metadata/xml/TEMPLATE.xml`;
echo $TITLE$METADATA > ../metadata/xml/$FILENAME.xml;

# Change into the directory
cd ../puppetdocs-latest/$DIRECTORY;

# NOTES about puppetdb1.6_INPUT.txt
# Replaced /puppetdb/1.6/ with spaces
# Removed carriage returns 

# Run Pandoc to generate epub ($DIRECTORY is two levels deep)
pandoc -o $FILENAME.epub `cat ../../../metadata/input/$INPUTFILENAME` --epub-cover-image=../../../metadata/cover/$FILENAME.png --epub-metadata=../../../metadata/xml/$FILENAME.xml --toc --toc-depth=2;

# Copy the epub back to the metadata directory ($DIRECTORY is two levels deep)
mv $FILENAME.epub ../../../ebooks;