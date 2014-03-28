#!/bin/bash

cat ../run-script-on-original/puppet-docs/source/_includes/deploy_guide.html | grep "%}</li>" | cut -d, -f2 | sed 's/"\(.*\)".*/\1/' > ../metadata/input/deploy_guide.txt; 
cat ../run-script-on-original/puppet-docs/source/_includes/facter20.html | grep "%}</li>" | cut -d, -f2 | sed 's/"\(.*\)".*/\1/' > ../metadata/input/facter20.txt;
cat ../run-script-on-original/puppet-docs/source/_includes/hiera1.html | grep "%}</li>" | cut -d, -f2 | sed 's/"\(.*\)".*/\1/' > ../metadata/input/hiera1.txt;
cat ../run-script-on-original/puppet-docs/source/_includes/learning_nav.html | grep "%}</li>" | cut -d, -f2 | sed 's/"\(.*\)".*/\1/' > ../metadata/input/learning_nav.txt;
cat ../run-script-on-original/puppet-docs/source/_includes/mcollective_menu.html | grep "%}</li>" | cut -d, -f2 | sed 's/"\(.*\)".*/\1/' > ../metadata/input/mcollective_menu.txt;
cat ../run-script-on-original/puppet-docs/source/_includes/puppet_3_5.html | grep "%}</li>" | cut -d, -f2 | sed 's/"\(.*\)".*/\1/' > ../metadata/input/puppet_3_5.txt;
cat ../run-script-on-original/puppet-docs/source/_includes/puppetdb1.6.html | grep "%}</li>" | cut -d, -f2 | sed 's/"\(.*\)".*/\1/' > ../metadata/input/puppetdb1.6.txt;
cat ../run-script-on-original/puppet-docs/source/_includes/pe32.html | grep "%}</li>" | cut -d, -f2 | sed 's/"\(.*\)".*/\1/' > ../metadata/input/pe32.txt;  