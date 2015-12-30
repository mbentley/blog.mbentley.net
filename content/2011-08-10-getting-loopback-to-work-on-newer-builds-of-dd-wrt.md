---
title: getting loopback to work on newer builds of dd-wrt
author: mbentley
layout: post
date: 2011-08-10
url: /2011/08/getting-loopback-to-work-on-newer-builds-of-dd-wrt/
shorturl:
  - http://tinyurl.com/44epuu2
categories:
  - computers
  - internet
  - technology
tags:
  - asus
  - bug
  - dd-wrt
  - ddwrt
  - fix
  - iptables
  - linux
  - loopback
  - phuzi0n
  - rt-n16

---
i've come across this problem a number of times when looking at newer firmware for my router running dd-wrt. the upgrade works flawlessly but loopback doesn't work. i finally decided to see if there was a solution out there and lucky for me, there is. a google search brought me to this [bug report][1]. there is also a [dd-wrt forum topic][2] on this as well but the solution is pretty simple. just in case the bug report and forum post both disappear, here is the solution:

Save the following commands to the Firewall Script on the _Administration_ -> _Commands_ page to fix loopback.
```
insmod ipt_mark
insmod xt_mark

iptables -t mangle -A PREROUTING -i ! `get_wanface` -d `nvram get wan_ipaddr` -j MARK --set-mark 0xd001
iptables -t nat -A POSTROUTING -m mark --mark 0xd001 -j MASQUERADE
```

once you have added these commands to the 'Firewall' command list, you will need to perform a reboot and that should make the fix active.

a huge thanks to phuzi0n for providing this workaround! from the number of people who have commented, i can definitely see that i am not alone in wanting loopback to work properly but at least this workaround does the job.

<!-- Social Bookmarks BEGIN -->

<p class="postcats">
  Share this post:<br /><a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://del.icio.us/post?url=http://tinyurl.com/44epuu2&title=getting+loopback+to+work+on+newer+builds+of+dd-wrt" rel="nofollow" title="Share on Del.icio.us"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/delicious.png" title="Share on Del.icio.us" alt="Share on Del.icio.us" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.facebook.com/sharer.php?u=http://tinyurl.com/44epuu2" rel="nofollow" title="Share on Facebook"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/facebook.png" title="Share on Facebook" alt="Share on Facebook" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.linkedin.com/shareArticle?mini=true&url=http://tinyurl.com/44epuu2&title=getting+loopback+to+work+on+newer+builds+of+dd-wrt" rel="nofollow" title="Share on LinkedIn"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/linkedin.png" title="Share on LinkedIn" alt="Share on LinkedIn" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://reddit.com/submit?url=http://tinyurl.com/44epuu2&title=getting+loopback+to+work+on+newer+builds+of+dd-wrt" rel="nofollow" title="Share on reddit"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/reddit.png" title="Share on reddit" alt="Share on reddit" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.stumbleupon.com/submit?url=http://tinyurl.com/44epuu2&title=getting+loopback+to+work+on+newer+builds+of+dd-wrt" rel="nofollow" title="Share on Stumble Upon"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/stumbleupon.png" title="Share on Stumble Upon" alt="Share on Stumble Upon" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.technorati.com/faves?add=http://tinyurl.com/44epuu2" rel="nofollow" title="Share on Technorati"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/technorati.png" title="Share on Technorati" alt="Share on Technorati" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://twitter.com/home/?status=getting+loopback+to+work+on+newer+builds+of+dd-wrt+@+http://tinyurl.com/44epuu2" rel="nofollow" title="Share on Twitter"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/twitter.png" title="Share on Twitter" alt="Share on Twitter" /></a> <br />
</p>

<!-- Social Bookmarks END -->

 [1]: http://svn.dd-wrt.com:8000/ticket/1868
 [2]: http://www.dd-wrt.com/phpBB2/viewtopic.php?t=89353
