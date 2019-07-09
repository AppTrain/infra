set -e 
DEBIAN_FRONTEND=noninteractive
sleep 5
mkdir ~/Downloads
sudo apt-get update && sudo apt-get upgrade -y -q
sudo apt-get install -y -q jq

LATEST=https://api.github.com/repos/gohugoio/hugo/releases/latest
QUERY='.assets[] | select(.name | contains("Linux-64bit.deb") and (contains("extended") | not )) | {name: .name, url: .browser_download_url}'

meta=$( curl $LATEST | jq "$QUERY" )
name=$(echo $meta | jq '.name' | tr -d '"')
url=$(echo $meta | jq '.url' | tr -d '"')
cd ~/Downloads 
curl -L -o $name $url 
dpkg-deb --info $name
sudo dpkg -i $name