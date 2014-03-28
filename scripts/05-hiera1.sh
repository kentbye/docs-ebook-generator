#!/bin/bash

# Set up the variables
DIRECTORY='hiera/latest';
FILENAME='hiera1';
INPUTFILENAME='hiera1_INPUT.txt';
TITLE="<dc:title>Hiera 1 Manual</dc:title>";

# Create the XML metadata file
METADATA=`cat ../metadata/xml/TEMPLATE.xml`;
echo $TITLE$METADATA > ../metadata/xml/$FILENAME.xml;

# Change into the directory
cd ../puppetdocs-latest/$DIRECTORY;

# NOTES about hiera1_INPUT.txt
# Replace ./ with space
# Replaced carriage returns
# Deleted extraneous "Variables" line

# Run Pandoc to generate epub ($DIRECTORY is two levels deep)
pandoc -o $FILENAME.epub `cat ../../../metadata/input/$INPUTFILENAME` --epub-cover-image=../../../metadata/cover/$FILENAME.png --epub-metadata=../../../metadata/xml/$FILENAME.xml --toc --toc-depth=2;

# Copy the epub back to the metadata directory ($DIRECTORY is two levels deep)
mv $FILENAME.epub ../../../ebooks;