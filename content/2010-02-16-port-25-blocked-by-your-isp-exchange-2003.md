---
title: 'port 25 blocked by your ISP & exchange 2003'
author: mbentley
layout: post
date: 2010-02-16
url: /2010/02/port-25-blocked-by-your-isp-exchange-2003/
shorturl:
  - http://tinyurl.com/498z6kb
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

<table border="0">
  <tr>
    <td valign="top">
      the easiest way to get around this problem is by changing the port in which your exchange server sends and receives email. in my case, i decided to change mine to port 587 which is what comcast is using as the chances of them blocking that port is a bit slimmer than before. in order to change this, i had to modify the port setting in two places (for each smtp server i had running). start by opening <b>Exchange System Manager</b>. from there, go to <b>Administrative Groups</b> > <b>First Administrative Group</b> > <b>Servers</b> > <b>[servername]</b> > <b>Protocols</b> > <b>SMTP</b> > then right click on <b>Default SMTP Virtual Server</b> and choose <b>Properties</b>.
    </td>

    <td>
      <a href="/wp-content/uploads/2010/02/exchange_1.png" class="smoothbox" rel="lightbox[183]"><img src="/wp-content/uploads/2010/02/exchange_1-300x195.png" alt="" title="exchange_1" width="300" height="195" class="alignnone size-medium wp-image-189" srcset="/wp-content/uploads/2010/02/exchange_1-300x195.png 300w, /wp-content/uploads/2010/02/exchange_1.png 810w" sizes="(max-width: 300px) 100vw, 300px" /></a>
    </td>
  </tr>
</table>

then go to **Advanced** > **Edit** > then change the **TCP port** to the new port (in this case, **587**). click **OK** twice and then click on the **Delivery** tab > **Outbound connections**. change **TCP port** from 25 to the new value. then choose **OK** twice which will return you to the **Exchange System Manager**. if you have another exchange server in your organization, you will need to perform the same steps for the other servers. once you have done this, you will need to restart the **Default SMTP Virtual Server(s)** for the changes to take effect (or a restart would work as well).

<table border="0" width="100%">
  <tr>
    <td align="center">
      <a href="/wp-content/uploads/2010/02/exchange_2.png" class="smoothbox" rel="lightbox[183]"><img src="/wp-content/uploads/2010/02/exchange_2-300x195.png" alt="" title="exchange_2" width="300" height="195" class="alignnone size-medium wp-image-190" srcset="/wp-content/uploads/2010/02/exchange_2-300x195.png 300w, /wp-content/uploads/2010/02/exchange_2.png 810w" sizes="(max-width: 300px) 100vw, 300px" /></a>
    </td>

    <td align="center">
      <a href="/wp-content/uploads/2010/02/exchange_3.png" class="smoothbox" rel="lightbox[183]"><img src="/wp-content/uploads/2010/02/exchange_3-300x195.png" alt="" title="exchange_3" width="300" height="195" class="alignnone size-medium wp-image-188" srcset="/wp-content/uploads/2010/02/exchange_3-300x195.png 300w, /wp-content/uploads/2010/02/exchange_3.png 810w" sizes="(max-width: 300px) 100vw, 300px" /></a></tr> </table>

i use port forwarding on my router which i have setup to route incoming port 25 traffic to port 587. even though port 25 is blocked, it enables me to connect using the default server port of 25 from inside my network. i also use a no-ip service for incoming smtp redirection which will redirects all of my mail traffic to a high port so it will not be blocked by my ISP. i had to configure the port forwarding on my router to point to port 587 internally instead of port 25 while still listening on the high port number as before. this allows my email to continue to send and receive properly despite having port 25 blocked by my ISP.

<!-- Social Bookmarks BEGIN -->

<p class="postcats">
Share this post:<br /><a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://del.icio.us/post?url=http://tinyurl.com/498z6kb&title=port+25+blocked+by+your+ISP+%26%23038%3B+exchange+2003" rel="nofollow" title="Share on Del.icio.us"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/delicious.png" title="Share on Del.icio.us" alt="Share on Del.icio.us" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.facebook.com/sharer.php?u=http://tinyurl.com/498z6kb" rel="nofollow" title="Share on Facebook"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/facebook.png" title="Share on Facebook" alt="Share on Facebook" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.linkedin.com/shareArticle?mini=true&url=http://tinyurl.com/498z6kb&title=port+25+blocked+by+your+ISP+%26%23038%3B+exchange+2003" rel="nofollow" title="Share on LinkedIn"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/linkedin.png" title="Share on LinkedIn" alt="Share on LinkedIn" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://reddit.com/submit?url=http://tinyurl.com/498z6kb&title=port+25+blocked+by+your+ISP+%26%23038%3B+exchange+2003" rel="nofollow" title="Share on reddit"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/reddit.png" title="Share on reddit" alt="Share on reddit" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.stumbleupon.com/submit?url=http://tinyurl.com/498z6kb&title=port+25+blocked+by+your+ISP+%26%23038%3B+exchange+2003" rel="nofollow" title="Share on Stumble Upon"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/stumbleupon.png" title="Share on Stumble Upon" alt="Share on Stumble Upon" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.technorati.com/faves?add=http://tinyurl.com/498z6kb" rel="nofollow" title="Share on Technorati"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/technorati.png" title="Share on Technorati" alt="Share on Technorati" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://twitter.com/home/?status=port+25+blocked+by+your+ISP+%26%23038%3B+exchange+2003+@+http://tinyurl.com/498z6kb" rel="nofollow" title="Share on Twitter"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/twitter.png" title="Share on Twitter" alt="Share on Twitter" /></a> <br />
 </p>

<!-- Social Bookmarks END -->
