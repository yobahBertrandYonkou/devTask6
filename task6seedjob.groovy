//creates first job
job("podLauncher") {

    description("checks code language and launches the respective pod")

    //sets a custom work space
    customWorkspace("/var/lib/jenkins/workspace/devtask6")

    //executes commands on shell
    steps{
         shell("#!/bin/bash \nchmod +x podLauncher.sh siteTester.sh \n./podLauncher.sh")

    }

    //triggers website tester on success
    publishers{
    downstream("websiterTester", "SUCCESS")
    }
}

//creates second job
job("websiterTester"){
    description("connects to website and gets status code")

    //sets a custom work space
    customWorkspace("/var/lib/jenkins/workspace/devtask6")

    //executes on shell
    steps{
        shell("#!/bin/bash \n./siteTester.sh")
    }
}

//creates a build pipeline view
buildPipelineView('devTask6') {
    filterBuildQueue()
    filterExecutors()
    title('DevTask6 Pipeline')
    displayedBuilds(1)
    selectedJob('podLauncher')
    alwaysAllowManualTrigger()
    showPipelineParameters()
    refreshFrequency(60)
}
