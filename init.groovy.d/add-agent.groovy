import jenkins.model.*;
import hudson.model.*;
import hudson.slaves.*;

String agent_name = "my-agent"

Node agentNode = Jenkins.instance.getNode(agent_name)

if (agentNode == null) {
    DumbSlave agent = new DumbSlave(
            agent_name,
            "home",
            new JNLPLauncher()
    )
    Jenkins.instance.addNode(agent)
    agentNode = Jenkins.instance.getNode(agent_name)
}

String agent_secret = agentNode.getComputer().getJnlpMac()

println("Agent Secret: " + agent_secret)
