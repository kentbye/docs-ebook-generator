#!/bin/bash

echo "** Downloading the latest Puppet documentation";
cd ../;
wget http://docs.puppetlabs.com/puppetdocs-latest.tar.gz;

echo "** Uncompressing all of the docs into puppetdocs-latest";
tar zxf puppetdocs-latest.tar.gz -C puppetdocs-latest;

echo "** Copying the original puppetdocs";
cp -r puppetdocs-latest run-script-on-original;

echo "** Cloning the puppet-docs repo for additional metadata on document ordering.";
cd run-script-on-original;
git clone https://github.com/puppetlabs/puppet-docs.git;

echo "** Collecting all of the HTML input files";
find puppetdocs-latest -type f -name "*.html" > html-input-files.txt;

echo "** Extracting main content from the docs to docs-ebook/puppetdocs-latest"
cd ../run-script-on-original;
./extract-content.rb

echo "** Extracting order from puppet-docs/source/_includes"
cd ../scripts;
./extract_sources.sh
