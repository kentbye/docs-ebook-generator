#!/bin/bash

# Set up the variables
DIRECTORY='learning';
FILENAME='learningpuppet';
INPUTFILENAME='learning_nav_INPUT.txt'
TITLE="<dc:title>Learning Puppet</dc:title>";

# Create the XML metadata file
METADATA=`cat ../metadata/xml/TEMPLATE.xml`;
echo $TITLE$METADATA > ../metadata/xml/$FILENAME.xml;

# Change into the directory
cd ../puppetdocs-latest/$DIRECTORY;

# Run Pandoc to generate epub  ($DIRECTORY is one level deep)
pandoc -o $FILENAME.epub `cat ../../metadata/input/$INPUTFILENAME` --epub-cover-image=../../metadata/cover/$FILENAME.png --epub-metadata=../../metadata/xml/$FILENAME.xml --toc --toc-depth=2;

# Copy the epub back to the metadata directory ($DIRECTORY is one level deep)
mv $FILENAME.epub ../../ebooks;