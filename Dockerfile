# Use the official Jenkins LTS image as the base image
FROM jenkins/jenkins:lts

# Install Jenkins plugins using jenkins-plugin-cli
RUN jenkins-plugin-cli --plugins \
    git \
    github \
    docker-plugin \
    workflow-aggregator \
    junit \
    artifactory \
    pipeline-github \
    pipeline-stage-view \
    pipeline-utility-steps \
    pipeline-model-definition \
    code-coverage-api \
    markdown-formatter

# Copy startup script and make it executable
COPY jenkins-startup.sh /usr/local/bin/jenkins-startup.sh
RUN chmod +x /usr/local/bin/jenkins-startup.sh

# Execute startup script at container start
ENTRYPOINT ["/usr/local/bin/jenkins-startup.sh"]
