---
title: 'port 25 blocked by your ISP & exchange 2003'
author: mbentley
layout: post
date: 2010-02-16
url: /2010/02/port-25-blocked-by-your-isp-exchange-2003/
categories:
  - computers
  - technology
tags:
  - blocked ports
  - computer
  - email
  - exchange 2003
  - ISP
  - microsoft
  - port 25
  - port 587
  - port forwarding
  - windows
  - windows server 2003

---
as many people are aware, many ISPs block traffic on port 25 in order to attempt to prevent spammers from using bot infected hosts on their networks. this can be a problem for people who want to run a mail server from their home connection. yes, i realize that running an email server violates the TOS of most providers but that is a discussion for another day. i personally use my email server as a learning experience but i also use it for my primary personal email.

users of comcast have recently reported that they are no longer able to relay their mail using 'smtp.comcast.net' over port 25. comcast had previously allowed port 25 traffic to be relayed inside their network when going to 'smtp.comcast.net'. unfortunately they are no longer allowing this which is a major problem for me any anyone who is using comcast's smtp server as a smtp connector in exchange.

the easiest way to get around this problem is by changing the port in which your exchange server sends and receives email. in my case, i decided to change mine to port 587 which is what comcast is using as the chances of them blocking that port is a bit slimmer than before. in order to change this, i had to modify the port setting in two places (for each smtp server i had running). start by opening **Exchange System Manager**. from there, go to **Administrative Groups** > **First Administrative Group** > **Servers** > **[servername]** > **Protocols** > **SMTP** > then right click on **Default SMTP Virtual Server** and choose **Properties**.

![Exchange1](/wp-content/uploads/2010/02/exchange_1.png)

then go to **Advanced** > **Edit** > then change the **TCP port** to the new port (in this case, **587**). click **OK** twice and then click on the **Delivery** tab > **Outbound connections**. change **TCP port** from 25 to the new value. then choose **OK** twice which will return you to the **Exchange System Manager**. if you have another exchange server in your organization, you will need to perform the same steps for the other servers. once you have done this, you will need to restart the **Default SMTP Virtual Server(s)** for the changes to take effect (or a restart would work as well).

![Exchange 2](/wp-content/uploads/2010/02/exchange_2.png)

![Exchange 3](/wp-content/uploads/2010/02/exchange_3.png)

i use port forwarding on my router which i have setup to route incoming port 25 traffic to port 587. even though port 25 is blocked, it enables me to connect using the default server port of 25 from inside my network. i also use a no-ip service for incoming smtp redirection which will redirects all of my mail traffic to a high port so it will not be blocked by my ISP. i had to configure the port forwarding on my router to point to port 587 internally instead of port 25 while still listening on the high port number as before. this allows my email to continue to send and receive properly despite having port 25 blocked by my ISP.
