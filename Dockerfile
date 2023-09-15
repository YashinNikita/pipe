FROM jenkins/jenkins:lts
COPY init-agent.groovy /usr/share/jenkins/ref/init.groovy.d/init-agent.groovy

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
