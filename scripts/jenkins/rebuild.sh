#!/bin/bash
set -e
source ~/.docker-host-ssh-credentials

# Create a droplet

PRIVATE_IP=$(ssh "$DOCKERHOSTUSER"@"$DOCKERHOST" \
  "./digitalocean/scripts/new-droplet.sh docker-yaml-lint")
# https://github.com/dcycle/docker-digitalocean-php#public-vs-private-ip-addresses
IP=$(ssh "$DOCKERHOSTUSER"@"$DOCKERHOST" "./digitalocean/scripts/list-droplets.sh" |grep "$PRIVATE_IP" --after-context=10|tail -1|cut -b 44-)
echo "Created Droplet at $IP"
sleep 90
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no \
  root@"$IP" "mkdir -p docker-yaml-lint-job"
scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no \
  ~/.dcycle-docker-credentials.sh \
  root@$IP:~/.dcycle-docker-credentials.sh
scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no \
  -r * root@"$IP":docker-yaml-lint-job
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no \
  root@"$IP" "cd docker-yaml-lint-job && ls -lah && ./scripts/rebuild.sh"
