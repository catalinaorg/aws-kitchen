This repo creates an EC2 box (ubuntu 16.04.06 server), installs nginx and tests if nginx is installed.

# Pre-req
* Packer 
* AWS credentials
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

1. create AMI using Packer and templateaws.json
   `packer build templateaws.json`
   
1. update file .kitchen.yml with the image_id that has been created in the previous step and your Amazon key pair

1. install Chef on the instance, upload cookbook files and minimal configuration and start Chef run based on kitchen.yml file
   * `bundle exec kitchen converge`
1. execute tests
   * `bundle exec kitchen verify`   
1. delete instance
   * `bundle exec kitchen destroy`

