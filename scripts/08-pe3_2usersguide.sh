#!/bin/bash

# Set up the variables
DIRECTORY='pe/latest';
FILENAME='pe3_2usersguide';
INPUTFILENAME='pe32_INPUT.txt';
TITLE="<dc:title>Puppet Enterprise 3.2 User's Guide</dc:title>";

# Create the XML metadata file
METADATA=`cat ../metadata/xml/TEMPLATE.xml`;
echo $TITLE$METADATA > ../metadata/xml/$FILENAME.xml;

# Change into the directory
cd ../puppetdocs-latest/$DIRECTORY;

# Copy /guides/module_guides/images/bgtmclassstructure.png to /pe/latest/images
cp ../../guides/module_guides/images/* images

# NOTES about pe32_INPUT.txt
# Replaced ./ with spaces
# Removed carriage returns 
# Changed appendix.html#release-notes to appendix.html
# Removed appendix.html#known-issues since it's included above
# Removed orchestration_integrating.html
# Changed quick_writing.html to quick_writing_nix.html 

# Run Pandoc to generate epub ($DIRECTORY is two levels deep)
pandoc -o $FILENAME.epub `cat ../../../metadata/input/$INPUTFILENAME` --epub-cover-image=../../../metadata/cover/$FILENAME.png --epub-metadata=../../../metadata/xml/$FILENAME.xml --toc --toc-depth=2;

# Copy the epub back to the metadata directory ($DIRECTORY is two levels deep)
mv $FILENAME.epub ../../../ebooks;