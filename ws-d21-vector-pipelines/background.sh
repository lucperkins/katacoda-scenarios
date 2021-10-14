# Remove unnecessary stuff that Vector installs automatically
rm -rf /etc/vector/vector.toml /etc/vector/examples

# Some handy aliases
alias dc="docker-compose"

# VS Code setup for extensions
echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
cd /tmp && apt-get update -y && apt install libarchive-tools -y

# TOML extension
curl https://bungcip.gallery.vsassets.io/_apis/public/gallery/publisher/bungcip/extension/better-toml/0.3.2/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage --output /root/better-toml.vsix

/opt/vscode/node /opt/vscode/out/node/entry.js "--install-extension=/root/better-toml.vsix" "--extensions-dir=/opt/.katacodacode/extensions/"

# VRL extension
curl https://marketplace.visualstudio.com/_apis/public/gallery/publishers/lucperkins/vsextensions/vrl-vscode/0.1.2/vspackage | bsdtar -xvf - extension
mv extension /opt/.katacodacode/extensions/lucperkins.vrl-vscode-0.1.2

# Datadog credentials
rm /usr/local/bin/prepenvironment
curl -sk https://datadoghq.dev/katacodalabtools/r?raw=true|bash
prepenvironment
statusupdate complete