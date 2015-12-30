---
title: installing smoothwall 3.0 on a soekris engineering net4801 (part 1)
author: mbentley
layout: post
date: 2010-02-07
url: /2010/02/installing-smoothwall-3-0-on-a-soekris-engineering-net4801-part-1/
shorturl:
  - http://tinyurl.com/464whzr
categories:
  - computers
  - new gadgets
  - technology
tags:
  - computer
  - conservation
  - efficient
  - energy
  - green
  - linux
  - net4801
  - new
  - smoothwall
  - soekris
  - techology

---
even though all of my parts have not arrived for my new smoothwall project, i can begin to do some initial setup. first of all, here are all of the items of which i needed to find for the project:

  * [soekris engineering net4801-60][1]
  * [soekris engineering 2.5" hdd mounting kit][2]
  * [soekris engineering power supply][3]
  * 2.5" ide hard drive
  * [10 foot serial null modem cable][4]

since i already have the hard drive, i can do some of the prep work by installing smoothwall. i am using an old laptop to install the os to the hard drive. luckily linux is much less picky than windows about changing hardware after installing. i downloaded and burnt a copy of the latest smoothwall 3.0 sp1. installing smoothwall is about as straight forward as things come. just follow the steps on the screen until you get to the "Network configuration menu". since we currently do not have the correct network cards in the computer, this part is going to be overwritten later.

just leave the current config as "GREEN (RED is modem/ISDN)". choose "Drivers and card assignments". allocate the nic to the green interface. then go to "Address settings" and give the green interface a valid IP address on your subnet. once that is completed, choose done. on the "Section menu" screen, just choose finished as we do not want to set up a modem that we actually won't be using. then just complete the setup by entering your passwords and reboot.

when your smoothwall boots, go ahead a login using "root" and the password that you provided. we need to make a few configuration changes since the net4801 only uses serial console for video output. first, we need to edit '/etc/inittab'. once finished, your inittab should look like this:
```
id:3:initdefault:

l0:0:wait:/etc/rc.d/rc.halt halt
l6:6:wait:/etc/rc.d/rc.halt reboot

si::sysinit:/etc/rc.d/rc.sysinit

# Trap CTRL-ALT-DELETE
ca::ctrlaltdel:/sbin/shutdown -h now

# Run gettys in standard runlevels
1:2345:respawn:/sbin/agetty 38400 tty1
#2:2345:respawn:/sbin/agetty 38400 tty2
#3:2345:respawn:/sbin/agetty 38400 tty3
#4:2345:respawn:/sbin/agetty 38400 tty4
#5:2345:respawn:/sbin/agetty 38400 tty5
#6:2345:respawn:/sbin/agetty 38400 tty6
s0:2345:respawn:/sbin/agetty -L -f /etc/issueserial 19200 ttyS0 vt100
~:S:wait:/bin/bash
```

the line `_s0:2345:respawn:/sbin/agetty -L -f /etc/issueserial 19200 ttyS0 vt100_` is what we are adding. this enables the serial console at the baud rate of 19200 (the default for the net4801). the commented out gettys lines in are ones that we've commented out. there is no point in running multiple virtual terminals if we aren't going to use them. they will just use resources since this box is headless but we are leaving one just in case it is needed in a recovery scenario.

next we need to create an '/etc/issueserial' file:

```
smoothwall
Connected on \l at \b bps
```

next, we will want to create an '/etc/securetty' file to allow root to login from the serial console:

```
tyS0
tty1
tty2
tty3
```


in my next article, i am going to continue by talking about how to reconfigure the smoothwall setup to accept the new hardware of the net4801 but i will do so when i actually have the hardware on hand later this week.

_continued in [part 2][5]_

<!-- Social Bookmarks BEGIN -->

<p class="postcats">
  Share this post:<br /><a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://del.icio.us/post?url=http://tinyurl.com/464whzr&title=installing+smoothwall+3.0+on+a+soekris+engineering+net4801+%28part+1%29" rel="nofollow" title="Share on Del.icio.us"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/delicious.png" title="Share on Del.icio.us" alt="Share on Del.icio.us" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.facebook.com/sharer.php?u=http://tinyurl.com/464whzr" rel="nofollow" title="Share on Facebook"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/facebook.png" title="Share on Facebook" alt="Share on Facebook" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.linkedin.com/shareArticle?mini=true&url=http://tinyurl.com/464whzr&title=installing+smoothwall+3.0+on+a+soekris+engineering+net4801+%28part+1%29" rel="nofollow" title="Share on LinkedIn"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/linkedin.png" title="Share on LinkedIn" alt="Share on LinkedIn" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://reddit.com/submit?url=http://tinyurl.com/464whzr&title=installing+smoothwall+3.0+on+a+soekris+engineering+net4801+%28part+1%29" rel="nofollow" title="Share on reddit"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/reddit.png" title="Share on reddit" alt="Share on reddit" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.stumbleupon.com/submit?url=http://tinyurl.com/464whzr&title=installing+smoothwall+3.0+on+a+soekris+engineering+net4801+%28part+1%29" rel="nofollow" title="Share on Stumble Upon"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/stumbleupon.png" title="Share on Stumble Upon" alt="Share on Stumble Upon" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.technorati.com/faves?add=http://tinyurl.com/464whzr" rel="nofollow" title="Share on Technorati"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/technorati.png" title="Share on Technorati" alt="Share on Technorati" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://twitter.com/home/?status=installing+smoothwall+3.0+on+a+soekris+engineering+net4801+%28part+1%29+@+http://tinyurl.com/464whzr" rel="nofollow" title="Share on Twitter"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/twitter.png" title="Share on Twitter" alt="Share on Twitter" /></a> <br />
</p>

<!-- Social Bookmarks END -->

 [1]: http://www.soekris.com/net4801.htm
 [2]: https://www.soekris.com/shop/product_info.php?products_id=97
 [3]: https://www.soekris.com/shop/product_info.php?products_id=132
 [4]: http://www.monoprice.com/products/product.asp?c_id=102&cp_id=10212&cs_id=1021205&p_id=478&seq=1&format=2
 [5]: /2010/02/installing-smoothwall-3-0-on-a-soekris-engineering-net4801-part-2/
