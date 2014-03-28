#!/bin/bash

# Set up the variables
DIRECTORY='facter/latest';
FILENAME='facter2_0';
INPUTFILENAME='facter20_INPUT.txt';
TITLE="<dc:title>Facter 2.0 Core Facts</dc:title>";

# Create the XML metadata file
METADATA=`cat ../metadata/xml/TEMPLATE.xml`;
echo $TITLE$METADATA > ../metadata/xml/$FILENAME.xml;

# Change into the directory
cd ../puppetdocs-latest/$DIRECTORY;

# NOTES about facter20_INPUT.txt
# Had to completely hand-roll this because the automation failed to pick up the links, which were not in the usual tags

# Run Pandoc to generate epub ($DIRECTORY is two levels deep)
pandoc -o $FILENAME.epub `cat ../../../metadata/input/$INPUTFILENAME` --epub-cover-image=../../../metadata/cover/$FILENAME.png --epub-metadata=../../../metadata/xml/$FILENAME.xml --toc --toc-depth=2;

# Copy the epub back to the metadata directory ($DIRECTORY is two levels deep)
mv $FILENAME.epub ../../../ebooks;