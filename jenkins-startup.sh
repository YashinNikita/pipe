#!/bin/bash

# Requires curl to be installed

# Wait for Jenkins to be up
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' http://localhost:8080)" != "200" ]]; do
    sleep 5
done

# TODO: Use a more secure way to authenticate
# Create a new pipeline job using Jenkins REST API
curl -X POST http://localhost:8080/createItem?name=cURL-Pipeline \
    --user 'admin:admin' \
    --header 'Content-Type:application/xml' \
    --data-binary @config.xml


curl -X POST "http://localhost:8080/computer/doCreateItem?name=new_agent&type=hudson.slaves.DumbSlave" \
    --user 'admin:admin' \
    --data "json={
        \"name\": \"new_agent\",
        \"nodeDescription\": \"\",
        \"remoteFS\": \"/home/jenkins/agent\",
        \"numExecutors\": \"1\",
        \"mode\": \"NORMAL\",
        \"type\": \"hudson.slaves.DumbSlave\",
        \"retentionStrategy\": {
            \"stapler-class\": \"hudson.slaves.RetentionStrategy\$Always\",
            \"\$class\": \"hudson.slaves.RetentionStrategy\$Always\"
        },
        \"launcher\": {
            \"stapler-class\": \"hudson.slaves.JNLPLauncher\",
            \"\$class\": \"hudson.slaves.JNLPLauncher\"
        }
    }"

# Start Jenkins
exec java -jar /usr/share/jenkins/jenkins.war
