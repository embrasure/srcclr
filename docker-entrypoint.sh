#!/bin/sh
echo "scmToken: $GITHUBTOKEN" >> ~/.srcclr/agent.yml
echo "agentAuthorization: $SRCCLRTOKEN" >> ~/.srcclr/agent.yml
exec /home/app/srcclr/bin/srcclr "$@"
