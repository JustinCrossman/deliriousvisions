# portal-3.0
Portal 3.0 with AngularJS

Use this project from inside Vagrant Instance git@github.com:Sentinel-Internet-Systems-Inc/vagrant_environment.git
Add the follow line into your /etc/hosts
192.168.50.101  theme.dev

Install:

# Install/Upgrade your NodeJS
cd
wget http://nodejs.org/dist/v0.12.9/node-v0.12.9-linux-x64.tar.gz
tar -xzvf node-v0.12.9-linux-x64.tar.gz
sudo mv node-v0.12.9-linux-x64 /node
sudo ln -s /node/bin/npm /usr/sbin/npm
sudo ln -s /node/bin/node /usr/sbin/node
sudo npm install -g --unsafe-perm npm

# Install global packages
sudo npm install -g bower
sudo npm install -g grunt
sudo npm install -g karma@0.12.0

# Install app packages
cd /var/www/theme/
npm install
bower install
ln -s ../bower_components/ bower_components

Point a vHost in your httpd server to /vagrant/theme/app/ with domain theme.dev

Input the follow address into your browser:
http://theme.dev

Don't worry about avatar images, it's not included in template and will return 404 error.

Enjoy

PS.: Do not remove or change the "original" branch.  This branch preserve the full set of examples of the original template package.