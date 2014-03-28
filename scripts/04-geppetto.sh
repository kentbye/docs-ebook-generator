#!/bin/bash

# Set up the variables
DIRECTORY='geppetto/latest';
FILENAME='geppetto';
INPUTFILENAME='geppetto_INPUT.txt';
TITLE="<dc:title>Geppetto User's Guide</dc:title>";

# Create the XML metadata file
METADATA=`cat ../metadata/xml/TEMPLATE.xml`;
echo $TITLE$METADATA > ../metadata/xml/$FILENAME.xml;

# Change into the directory
cd ../puppetdocs-latest/$DIRECTORY;

# NOTES about geppetto_INPUT.txt
# It's just a single index.html file at http://docs.puppetlabs.com/geppetto/latest/index.html

# Run Pandoc to generate epub ($DIRECTORY is two levels deep)
pandoc -o $FILENAME.epub `cat ../../../metadata/input/$INPUTFILENAME` --epub-cover-image=../../../metadata/cover/$FILENAME.png --epub-metadata=../../../metadata/xml/$FILENAME.xml --toc --toc-depth=2;

# Copy the epub back to the metadata directory ($DIRECTORY is two levels deep)
mv $FILENAME.epub ../../../ebooks;