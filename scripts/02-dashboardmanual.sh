#!/bin/bash

# Set up the variables
DIRECTORY='dashboard/manual/latest';
FILENAME='dashboardmanual';
INPUTFILENAME='dashboard_INPUT.txt';
TITLE="<dc:title>Puppet Dashboard Manual</dc:title>";

# Create the XML metadata file
METADATA=`cat ../metadata/xml/TEMPLATE.xml`;
echo $TITLE$METADATA > ../metadata/xml/$FILENAME.xml;

# Change into the directory
cd ../puppetdocs-latest/$DIRECTORY;

# NOTES about dashboard_INPUT.txt
# Had to completely hand-roll this from http://docs.puppetlabs.com/dashboard/manual/1.2/bootstrapping.html because there is no sidebar navigation

# Run Pandoc to generate epub ($DIRECTORY is three levels deep)
pandoc -o $FILENAME.epub `cat ../../../../metadata/input/$INPUTFILENAME` --epub-cover-image=../../../../metadata/cover/$FILENAME.png --epub-metadata=../../../../metadata/xml/$FILENAME.xml --toc --toc-depth=2;

# Copy the epub back to the metadata directory ($DIRECTORY is three levels deep)
mv $FILENAME.epub ../../../../ebooks;