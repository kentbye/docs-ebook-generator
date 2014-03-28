#!/bin/bash

# Set up the variables
DIRECTORY='guides'; 
FILENAME='puppetmanual';
INPUTFILENAME='puppetmanual_INPUT.txt';
TITLE="<dc:title>Puppet Documentation</dc:title>";

# Create the XML metadata file
METADATA=`cat ../metadata/xml/TEMPLATE.xml`;
echo $TITLE$METADATA > ../metadata/xml/$FILENAME.xml;

# Change into the directory
cd ../puppetdocs-latest/$DIRECTORY;

# NOTES about puppetmanual_INPUT.txt
# This order was taken and altered from: docs-ebook/run-script-on-original/puppet-docs/pdf_mask/pdf_targets.yaml
# Remove all guides/ paths since most files and images are there
# Add ../ to all paths not guides/, specifically
#  Replaced puppet/2.7/ with ../puppet/latest/
#  Replaced references/latest/ with ../references/latest/
#  Replaced man/ with ../references/latest/man/
#  Replaced windows/ with ../windows/
# CHANGED language_guide.html to puppet/latest/reference/lang_summary.html
# CHANGED parameterized_classes.html since it's now at puppet/latest/reference/lang_classes.html
# REMOVED cloud_pack_getting_started.html

# TODO: Replace these images
# Could not find image `./images/run_as_admin.jpg', skipping...
# Could not find image `./images/uac.png', skipping...
# Could not find image `./images/start_menu.png', skipping...
# Could not find image `./images/wizard_server.png', skipping...
# Could not find image `./images/forge_new_release.png', skipping...
# Could not find image `./images/forge_upload_tarball2.png', skipping...
# Could not find image `./images/forge_upload_tarball.png', skipping...
# Could not find image `./images/forge_publish_module.png', skipping...
# Could not find image `./images/forge_signup.png', skipping...
# Could not find image `/images/windows-logo-small.jpg', skipping...
# Could not find image `/images/Puppet_Layers.png', skipping...
# Could not find image `/images/Puppet_Star.png', skipping...
# Could not find image `/images/module_cheat_sheet_thumbnail.png', skipping...
# Could not find image `/images/puppet_core_types_cheatsheet_thumbnail.png', skipping...

# Run Pandoc to generate epub ($DIRECTORY is one levels deep)
pandoc -o $FILENAME.epub `cat ../../metadata/input/$INPUTFILENAME` --epub-cover-image=../../metadata/cover/$FILENAME.png --epub-metadata=../../metadata/xml/$FILENAME.xml --toc --toc-depth=2;

# Copy the epub back to the metadata directory ($DIRECTORY is one levels deep)
mv $FILENAME.epub ../../ebooks;