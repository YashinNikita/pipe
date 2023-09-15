import jenkins.model.*
import hudson.model.*
import hudson.slaves.*

String agentName = "agent1"
String agentSecret = "jenkins-secret"

Node agent = Jenkins.instance.getNode(agentName)

if (agent == null) {
    DumbSlave newAgent = new DumbSlave(
            agentName,
            "Workspace",
            "/home/jenkins/agent",
            "1",
            Node.Mode.NORMAL,
            "",
            new JNLPLauncher(),
            RetentionStrategy.INSTANCE,
            Collections.EMPTY_LIST
    )

    Jenkins.instance.addNode(newAgent)
    println "Agent ${agentName} created"

    // If you also need to get and set the agent secret, you could
    JNLPLauncher launcher = (JNLPLauncher) newAgent.getLauncher()
    launcher.setWorkDirSettings(new WorkDirSettings(true, "/home/jenkins/agent", "1"))

    // Assuming you want to set this agent secret (not generally recommended)
    launcher.setSecret(agentSecret)
}
