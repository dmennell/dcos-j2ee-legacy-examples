# Instructions for WebLogic 12 Benefits App port to DC/OS

If you followed the instructions to run the setup program from Installation/setup_j2ee_demo.sh in this repository, then you already have all of the necessary components installed.  Before proceeding with this set of instructions, check that the following services are healy in your dc/os cluster:
* marathon-lb
* jenkins
* /dept-a/benefits-autoscale
* /dept-b/weblogic-sample-app

Assuming the above are up and healthy, you are ready to begin the rest of the examples.

## Step 1: Take a moment to review the configurations for the weblogic-sample-app
1. Select services from the DC/OS UI and then click on 'dept-b'.  If successful, you will see the service name ```weblogic-sample-app```.  Click on it and then edit the service to see the configurations.  Or you can just check out the JSON file ```Weblogic/demo_examples/weblogic_sample_deploy.sh``` within this repository for configuration details.
2. Check out the **cmd** section and the **containers** section of the JSON for insights to how the container will start and which ports get assigned.  Also note that for this example we are using the MESOS container for better reliability.  If you are interested, it is also possible to change the **type** from MESOS to DOCKER so you can use the native docker daemon.
3. Make note of the ServicePort as that plus the public node IP will be how you will access the web page.  For this example the servicePort has been hard coded to 10100.  In a production instance you will want to let DC/OS automatically assign the port to avoid conflict. 

## Step 2: Check the Sample app is exposed to the internet
1. First find the public node for your cluster.  The public node IP address is how you will identify the haproxy screen and also to access the sample app.
2. Verify the 'sample' WebLogic app exists in the haproxy screen.  If found, then you are ready to view the web page.
3. Assuming the public IP is 54.187.100.148 and our sample app has port 10000, then opening the URL ```http://54.187.100.148:10100/sample``` will display for you the sample application.


## Step 3: Now we have completed the validation for our first sample application.  Let's now go through the steps to migrate the WebLogic Sample 'benefits' app to look at the full migration process
1. From the services option from the DC/OS gui screen, click the '+' option in the upper right hand corner and then click the button for the 'JSON Editor' to enter the JSON editor
2. Copy the contents of the file ```Weblogic/demo_examples/weblogic_benefits_deploy.json``` into your computer's clipboard.  Then from the JSON Editor, paste the clipboard contents.  If successful you will see a fully formed JSON file in the editor on the right side of the screen and the translated configuration settings on the left hand side.
3. Take a moment to review the 'benefits' app configuraton paramters
4. Once ready click the 'review and run' button to start up the 'benefits' service.  Wait until the healthcheck for the service is indicating it is healthy.
5. Once healthy open the URL http://54.187.100.148:10100/benefits to see the migrated service

## Step 4: Execute a load test
1. Start up JMeter from the directory Weblogic/demo_examples
2. Open the 'Weblogic_Benefits_Scale_test.jmx' file using the JMeter file open command.
3. From the HTTP Request command in the load test script replace the ip address with the public address (in our example here it is 54.187.100.148, but your site will be different).  The Port should already be set to 10100.
4. Run the test and then watch the listeners.  Also have the screen positioned so you can the benefits app task instances.  As the test runs the benefits app should begin to stage new instances.  Once they are in a healthy state than all of the new instances will be available to handle queries on the benefits app.
