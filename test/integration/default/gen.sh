#!/usr/bin/env bash

# this script is not used in the test
# is just a helper to create the test based on a list of packages

pkg="nginx wget language-pack-en"

for p in ${pkg} ; do echo "describe package('${p}') do
  it { should be_installed }
end
"
done
