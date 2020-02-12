#!/bin/bash
set -eu -o pipefail

export DEV_HOME=/opt/dev
export LOCAL_BIN="$DEV_HOME/.local/other/bin"
export AUTHORIZED_KEYS="$DEV_HOME/.ssh/authorized_keys"

hostnamectl set-hostname ${host_name}

# create authorized key file
curl -fs https://github.com/${github_user}.keys > $AUTHORIZED_KEYS

# change default username to requested
usermod -l ${user} aeu
ssh-keygen -t ed25519 -a 100 -f $DEV_HOME/.ssh/id_ed25519 -C "${user}" -N ""
sudo -i -u ${user} whoami
sudo -i -u ${user} git config --global user.name "${full_name}"
sudo -i -u ${user} git config --global user.email "${email}"
sudo -i -u ${user} echo "${env}" > $DEV_HOME/.annalectenv
sudo -i -u ${user} echo "${dns}" > $DEV_HOME/.annalectr53
sudo -i -u ${user} echo "${host_name}.dev1.in.accuenplatform.com" > $DEV_HOME/.annalectr53-interanl

cat << EOF
EC2_INSTANCE_ID="`wget -q -O - http://169.254.169.254/latest/meta-data/instance-id || die \"wget instance-id has failed: $?\"`"
test -n "$EC2_INSTANCE_ID" || die 'cannot obtain instance-id'
EC2_AVAIL_ZONE="`wget -q -O - http://169.254.169.254/latest/meta-data/placement/availability-zone || die \"wget availability-zone has failed: $?\"`"
test -n "$EC2_AVAIL_ZONE" || die 'cannot obtain availability-zone'
EC2_REGION="`echo \"$EC2_AVAIL_ZONE\" | sed -e 's:\([0-9][0-9]*\)[a-z]*\$:\\1:'`"

key_contents=$(cat ~/.ssh/id_ed25519.pub)
echo "go to: https://github.com/settings/keys"
echo "github key name: dc-dev-annalect-$EC2_INSTANCE_ID"
echo "$key_contents"

EOF > $LOCAL_BIN/connect_github
chmod +x $LOCAL_BIN/connect_github

chown -R ${user}:aeu $DEV_HOME
chmod 600 $DEV_HOME/.ssh/id_ed25519
