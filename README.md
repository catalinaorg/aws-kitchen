This repo creates a vagrant virtualbox box (ubuntu 16.04.06 server), installs nginx and tests if nginx is installed.

# Pre-req
* Packer 1.4.5
* Vagrant 2.2.6
* VirtualBox
* rbenv install 2.3.1
* rbenv local 2.3.1
* gem install bundler
* bundle install

# How to use this repo

1. install rbenv
   * for MacOS:`brew install rbenv`

1. Update bash profile:
   * `echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile`
   * `echo 'eval "$(rbenv init -)"' >> ~/.bash_profile`

1. reload bash profile 
  `source ~/.bash_profile`

1. check if rbenv versions is 2.3.1 `rbenv versions`

1. create Vagrant virtual box using Packer and template.json
   `packer build template.json`
   
1. check if the box is installed into Vagrant `vagrant box list`

1. add the box locally `vagrant box add --name test-box ubuntu-1604-vbox.box`

1. install Chef on the instance, upload cookbook files and minimal configuration and start Chef run based on kitchen.yml file
   * `bundle exec kitchen converge`
1. execute tests
   * `bundle exec kitchen verify`   
1. delete instance
   * `bundle exec kitchen destroy`

