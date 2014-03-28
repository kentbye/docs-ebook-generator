#!/bin/bash

echo "** Generating Puppet Labs Community Information"; 
./01-community.sh

echo "** Generating Puppet Dashboard Manual"; 
./02-dashboardmanual.sh

echo "** Generating Facter 2.0 Core Facts"; 
./03-facter2_0.sh

echo "** Generating Geppetto User's Guide"; 
./04-geppetto.sh

echo "** Generating Hiera 1 Manual"; 
./05-hiera1.sh

echo "** Generating Learning Puppet"; 
./06-learningpuppet.sh

echo "** Generating Puppet Enterprise Deployment Guide"; 
./07-pe_deployment_guide.sh

echo "** Generating Puppet Enterprise 3.2 User's Guide"; 
./08-pe3_2usersguide.sh

echo "** Generating Puppet 3.5 Reference Manual"; 
./09-puppet_reference_3_5.sh

echo "** Generating PuppetDB 1.6 User's Guide"; 
./10-puppetdb1_6.sh

echo "** Generating Puppet Documentation"; 
./11-puppetmanual.sh

echo "** Generating MCollective User's Guide"; 
./12-mcollective.sh