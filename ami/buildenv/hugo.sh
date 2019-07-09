set -e 

#sudo apt-get install jq
LATEST=https://api.github.com/repos/gohugoio/hugo/releases/latest
QUERY='.assets[] | select(.name | contains("Linux-64bit.deb") and (contains("extended") | not )) | {name: .name, url: .url}'

meta=$( curl $LATEST | jq "$QUERY" )
name=$(echo $meta | jq '.name' | tr -d '"')
url=$(echo $meta | jq '.url' | tr -d '"')
curl -o $name $url
