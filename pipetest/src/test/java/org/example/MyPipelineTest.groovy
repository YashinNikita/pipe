package org.example

import com.lesfurets.jenkins.unit.declarative.DeclarativePipelineTest
import static org.junit.Assert.*
import org.junit.Before
import org.junit.Test

class MyPipelineTest extends DeclarativePipelineTest {
    def script

    @Before
    void setUp() {
        helper.registerAllowedMethod('git', [Map.class], null)
        helper.registerAllowedMethod('sh', [String.class], null)
        helper.registerAllowedMethod("artifactoryUpload", [Map.class], null)
        script = loadScript('Jenkinsfile')
    }

    @Test
    void 'should execute all stages successfully'() {
        script.execute()
        assertJobStatusSuccess()
        printCallStack()
    }

    @Test
    void 'should execute all expected stages'() {
        script.execute()
        assertStageStatus('Checkout', 'SUCCESS')
        assertStageStatus('Install Dependencies', 'SUCCESS')
        assertStageStatus('Configure and Build', 'SUCCESS')
        assertStageStatus('Run Tests', 'SUCCESS')
    }

    @Test
    void 'should push to Artifactory with expected arguments'() {
        helper.registerAllowedMethod("artifactoryUpload", [Map.class], { args ->
            assertEquals('ExpectedArtifact', args.artifactId)
            assertEquals('1.0.0', args.version)
            return null
        })

        script.execute()
        assertStageStatus('Push to Artifactory', 'SUCCESS')
    }
}
