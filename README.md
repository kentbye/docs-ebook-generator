# Generate ebooks from Puppet Labs Documentation
This is a set of scripts to download the documentation from [Puppet Labs' Documentation](http://docs.puppetlabs.com) site and [GitHub repo](https://github.com/puppetlabs/puppet-docs). At the moment it just produces epub files since there are too many broken links to generate mobi/kindle or pdf files.

This is a preliminary draft that needs some feedback and general clean-up, and is not completely automated yet.

## Instructions
Run scripts/setup.sh to download all of the source files. It'll download the puppetdocs-latest file of HTML files, and run a nokogiri script to remove the sidebars, headers and footers from the documentation.

To generate all of the ebooks, then run scripts/GENERATE-ALL-EBOOKS.sh. The finished ebooks will be located in the ebooks directory.

To generate individual ebooks, then run an individual script in the scripts folder.

## Creating new ebooks

The numbered shell scripts in the scripts folder show the process for generating an ebook.

An ebook requires four script variables to be generated

* The puppetdocs-latest directory where the files exist (DIRECTORY) 
* The name of the final pdf to be generated, as well as the cover image (FILENAME)
* The name of input filename in the metadata/input directory (INPUTFILENAME)
* And the title that is used to generate the metadata.xml file that's added to the ebook.

For example, here are the four variables from script/08-pe3_2usersguide.sh:

    DIRECTORY='pe/latest';
    FILENAME='pe3_2usersguide';
    INPUTFILENAME='pe32_INPUT.txt';
    TITLE="<dc:title>Puppet Enterprise 3.2 User's Guide</dc:title>";
    
You can copy an existing script, and then modify it. Note how many levels down the files are located and try to pick a script that matches that. For example, the 05-hiera1.sh script has a note of "($DIRECTORY is two levels deep)" because DIRECTORY='hiera/latest.' So choose a file that has the same number of levels to ensure that the last couple of commands can navigate to the proper directory.

You'll also need to hand-roll a new cover image located in metadata/cover. There's a template called Cover-Page-Template.psd. This could be more automated in the future.

The biggest thing that needs to be created is the INPUTFILENAME. A tentative order is scraped from the sidebar of the HTML page. This sidebar is generated from the files located in the run-script-on-original/puppet-docs/source/_includes/ directory of the documenation GitHub repo. There's a scripts/extract_sources.sh file that does a first pass of scraping the data from the pages based upon a crazy regex. This file requires some manual clean-up, and has been renamed with an "_INPUT" appended to the name. You can find the notes of what was manually cleaned up for each ebook in the scripts folder. There's a combination of clean-up needed in the source code, but also some room for potentially further automating this in a cleaner and more sane way. The current method of determining the order is done in a similar manual process of scraping through these HTMl files, and then is defined in this YAML file run-script-on-original/puppet-docs/pdf_mask/pdf_targets.yaml


## TODO
* For files that have files in more than one directory, pandoc will only find images located in the original directory. Either copy or make symbolic links from all images in those subdirectories to the image directory in the root directory where pandoc is being executed.
* Reproduce the production of the ebooks as much as possible (cheat by using the INPUT.txt files).
* Clean up the other folders and post to GitHub
* Try to fix the broken links by adding a baseurl to the HTML to see if the links will complete.
* Automatically place the title text over a PNG for the title page with [ImageMagick annotations](http://www.imagemagick.org/Usage/annotating/).
* Automate the moving of MCollective photos and other photos that are annotated as TODOs in the scripts directory
* Remove extraneous "Hiera 1" & "Facter 2.0" from all of the HTML page titles


