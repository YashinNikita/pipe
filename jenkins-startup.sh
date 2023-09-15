#!/bin/bash

# Wait for Jenkins to be up
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' http://localhost:8080)" != "200" ]]; do
    sleep 5
done

# Create a new pipeline job using Jenkins REST API
curl -X POST http://localhost:8080/createItem?name=cURL-Pipeline \
    --user 'admin:admin' \
    --header 'Content-Type:application/xml' \
    --data-binary @config.xml

# Start Jenkins
exec java -jar /usr/share/jenkins/jenkins.war
