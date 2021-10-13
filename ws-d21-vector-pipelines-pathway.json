#!/bin/bash

rm /usr/local/bin/prepenvironment
curl -sk https://datadoghq.dev/katacodalabtools/r?raw=true|bash

statusupdate "Running apt-get update"

apt-get update

statusupdate "Installing Vector"

curl -1sLf \
  'https://repositories.timber.io/public/vector/cfg/setup/bash.deb.sh' \
| bash

apt-get install vector

# Remove Vector's automatically installed config and examples
rm -rf /etc/vector/vector.toml /etc/vector/examples

prepenvironment
statusupdate complete
