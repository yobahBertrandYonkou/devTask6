job("podLauncher") {

    description("checks code language and launches the respective pod")

    //sets a custom work space
    customWorkspace("/var/lib/jenkins/workspace/devtask6")

    //executes commands on shell
    steps{
        shell("
            echo \"hi\"
        ")
    }

    //triggers website tester on success
    publishers{
    downstream("websiterTester", "SUCCESS")
    }
}

job("websiterTester"){
    description("connects to website and gets status code")

    //sets a custom work space
    customWorkspace("/var/lib/jenkins/workspace/devtask6")

    //executes on shell
    steps{
        shell()
        shell()
        shell()
        shell()
        shell()
        shell()
        shell()
    }
}

