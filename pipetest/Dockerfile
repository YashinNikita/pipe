# Base image
FROM jenkins/jenkins:lts

# Install Jenkins plugins
RUN jenkins-plugin-cli  \
    --plugins \
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

# Switch to root user to install additional packages
USER root

# Install required packages for building and testing cURL
RUN apt-get update && \
    apt-get install -y make gcc g++ automake libtool libssl-dev && \
    apt-get clean

# Switch back to the jenkins user
USER jenkins

# Expose ports
EXPOSE 8080
EXPOSE 50000
