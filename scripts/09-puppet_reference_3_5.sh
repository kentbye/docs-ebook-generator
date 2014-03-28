#!/bin/bash

# Set up the variables
DIRECTORY='puppet/latest/reference';
FILENAME='puppet_reference_3_5';
INPUTFILENAME='puppet_3_5_INPUT.txt';
TITLE="<dc:title>Puppet 3.5 Reference Manual</dc:title>";

# Create the XML metadata file
METADATA=`cat ../metadata/xml/TEMPLATE.xml`;
echo $TITLE$METADATA > ../metadata/xml/$FILENAME.xml;

# Change into the directory
cd ../puppetdocs-latest/$DIRECTORY;

# Copy image `/images/windows-logo-small.jpg' - Still not picking it up (?)
cp ../../../pe/latest/images/windows-logo-small.jpg images;

# NOTES about puppet_3_5_INPUT.txt
# Replaced  ./ with spaces
# Removed carriage returns 
# Changed /guides/plugins_in_modules.html to ../../../guides/plugins_in_modules.html
# Changed /references/* to ../../../references/* 
# subsystem_catalog_compilation.html is MISSING!!! TEMPORARILY DELETED IT

# Run Pandoc to generate epub ($DIRECTORY is three levels deep)
pandoc -o $FILENAME.epub `cat ../../../../metadata/input/$INPUTFILENAME` --epub-cover-image=../../../../metadata/cover/$FILENAME.png --epub-metadata=../../../../metadata/xml/$FILENAME.xml --toc --toc-depth=2;

# Copy the epub back to the metadata directory ($DIRECTORY is one level deep)
mv $FILENAME.epub ../../../../ebooks;