
## TODO
* Generate the html-input-files.txt file with the right directory
** $find puppetdocs-latest -type f -name "*.html" > html-input-files.txt
* Set up a script to download the latest http://docs.puppetlabs.com/puppetdocs-latest.tar.gz into docs-ebook, and then copy into the docs-ebook/run-script-on-original folder. 
* Git clone - automatically clone in the puppet-docs repo.


* Clean up the other folders and post to GitHub
* Reproduce the production of the ebooks as much as possible (cheat by using the INPUT.txt files).

* Try to fix the broken links by adding a baseurl to the HTML to see if the links will complete.
* Automatically place the title text over a PNG for the title page with [ImageMagick annotations](http://www.imagemagick.org/Usage/annotating/).
* For files that have files in more than one directory, pandoc will only find images located in the original directory. Either copy or make symbolic links from all images in those subdirectories to the image directory in the root directory where pandoc is being executed.
** Automate the moving of MCollective photos and other photos that are annotated as TODOs in the scripts directory
* Remove extraneous "Hiera 1" & "Facter 2.0" from all of the HTML page titles


