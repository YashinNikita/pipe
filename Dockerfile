FROM jenkins/jenkins:lts

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
    markdown-formatter \
    ssh-slaves \

USER root
RUN apt-get update && \
    apt-get install -y curl git make gcc

USER jenkins

EXPOSE 8080
EXPOSE 50000



