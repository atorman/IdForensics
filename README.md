#Identity Forensics

Companies continue to view identity fraud as a major concern. Given the number of logins daily, security practitioners might find it challenging to determine whether a specific user account is compromised.

The Identity Forensics Pilot helps administrators to determine which user behavior is legitimate. For example, details about users such as the following can help key personnel evaluate whether a behavior is atypical.

* The average number of logins per user per a specified time period
* Who logged in more than the average number of times
* Who logged in during nonbusiness hours
* Who logged in by using suspicious IP ranges
* Who logged in more than four times in ten minutes from different IP addresses

Administrators or users who are familiar with the Salesforce API and SOQL can track these types of events by using two objects that are available in the Identity Forensics Pilot: LoginEvent and PlatformEventMetrics. 

The Identity Forensics Pilot has no user interface in the Salesforce application to manage or view login event or metric data. However, you can access these events through the API. Several tools and programming languages can consume the Force.com SOAP API and REST API with the cURL utility. For example, you can use the [Force.com IDE](https://developer.salesforce.com/page/Force.com_IDE), [Workbench](https://workbench.developerforce.com/login.php), and [other development tools](https://developer.salesforce.com/page/Tools).

#Installation

The easiest way to install this project into your organization is to make use of the [workbench tool](http://workbench.developerforce.com).

1. Download a ZIP of the repository.
2. Open [Workbench](http://workbench.developerforce.com/)
3. Login to the desired organization with a user that has Modify All Data.
4. Select Deploy from the migration menu and when prompted, choose your zip file and select 'Allow Missing Files' check box before deploying it.
5. If you get an error that the deployment failed because package.xml cannot be found: unzip the cloneUser.zip file you downloaded and use the terminal to re-zip it (e.g. zip -r cloneUser.zip cloneUser) before retrying step four.

#Enhancements

Right now, the code is copy and pasted to separate out each metric. This makes it easy to remove or add sections of code to add metrics in a modular fashion. However, it's inherently inefficient to make separate calls for each set of metric data. It would be better to get all the metric results and then use the page to parse each set of metric data. This should result in less round trips to get the data and load the page quicker as a result.

#Credit

Doug Bitting and John Brock helped me a great deal to get over some significant issues integrating Google Charting API with Identity Forensic data. The original Google charting API code was based on a [force.com blog posting by Abhinav Gupta](http://developer.force.com/cookbook/recipe/easy-visualforce-charts-with-javascript-remoting--google-charts-api). 