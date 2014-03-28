#!/bin/bash

# Set up the variables
DIRECTORY='guides/deployment_guide';
FILENAME='pe_deployment_guide';
INPUTFILENAME='deploy_guide_INPUT.txt';
TITLE="<dc:title>Puppet Enterprise Deployment Guide</dc:title>";

# Create the XML metadata file
METADATA=`cat ../metadata/xml/TEMPLATE.xml`;
echo $TITLE$METADATA > ../metadata/xml/$FILENAME.xml;

# Change into the directory
cd ../puppetdocs-latest/$DIRECTORY;

# NOTES about deploy_guide_INPUT.txt
# Replace ./ with space
# Replaced carriage returns
# DELETE all of these "Other Resources
# ../../references/glossary.html
# ../../puppet/2.7/reference/index.html
# ../../pe/latest/index.html
# ../../pe/latest/quick_start.html
# ../../pe/latest/quick_writing.html

# Run Pandoc to generate epub ($DIRECTORY is two levels deep)
pandoc -o $FILENAME.epub `cat ../../../metadata/input/$INPUTFILENAME` --epub-cover-image=../../../metadata/cover/$FILENAME.png --epub-metadata=../../../metadata/xml/$FILENAME.xml --toc --toc-depth=2;

# Copy the epub back to the metadata directory ($DIRECTORY is two levels deep)
mv $FILENAME.epub ../../../ebooks;