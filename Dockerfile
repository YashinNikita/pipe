FROM jenkins/jenkins:lts

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

EXPOSE 8080
EXPOSE 50000
