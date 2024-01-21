# 0x19. Postmortem
## This site's outage incident report

The following is the incident report for the this site's infrastructure outage that occurred on January 21, 2024.
We understand this service issue has impacted our valued developers and users, and we apologize to everyone
who was affected.

### Issue Summary
From 9:30 AM to 10:37 AM WAT, requests to all the site's APIs resulted in 500 error messages.
The site's applications that rely on these APIs also returned errors.
At it's peak, the issue affected 100% of traffic to this API infrastructure.
The root cause of this outage was an invalid configuration change that prevents the server from serving.

### Timeline (all times West African Time)
- 9:03 AM: Configuration push begins
- 9:05 AM: Outage begins
- 9:07 AM: PagerDuty alerted teams
- 9:19 AM: Failed configuration change rollback
- 9:31 AM: Successful configuration change rollback

### Root Cause
At 9:03 AM WAT, a configuration change was inadvertently released to our production environment without
first being released to the testing enviroment. The change specified an invalid reference to a
php file.


### Resolution and recovery
At 9:05 AM WAT, the monitoring systems alerted our engineers who investigated and quickly escalated the issue.

At 9:19 AM WAT, we attempted to rollback the problematic configuration change. This rollback failed due to
complexity in the configuration system which caused our security checks to reject the rollback.
These problems were addressed and we successfully rolled back at 9:31 AM WAT.


### Corrective and preventive measures
In the last few days, we’ve conducted an internal review and analysis of the outage.
The following are actions we are taking to address the underlying causes of the issue and to help prevent
recurrence and improve response times:
- Enable faster monitoring.
- Change rollback process to be quicker and more robust.
- Disable the current configuration release mechanism until safer measures are implemented.
