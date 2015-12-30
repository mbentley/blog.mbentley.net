---
title: vmware-view-client 2.0 on debian wheezy (i386/amd64)
author: mbentley
layout: post
date: 2013-05-05
url: /2013/05/vmware-view-client-2-0-on-debian-wheezy-i386amd64/
shorturl:
  - http://tinyurl.com/d22c8su
categories:
  - computers
  - internet
  - linux
  - virtualization
tags:
  - 12.04
  - 7
  - amd64
  - client
  - deb
  - debian
  - desktop
  - i386
  - linux
  - packages
  - pc over ip
  - pcoip
  - sid
  - squeeze
  - testing
  - ubuntu
  - vdi
  - view
  - virtualization
  - vmware-view-client
  - wheezy

---
So since wheezy has finally been released as the new 'stable' version of Debian, I went ahead and revisited vmware-view-client on wheezy. I ran into a number of problems Basically, the solution is to use multi-arch and libssl0.9.8 from Ubuntu (i386). You will want the i386 packages even if you are using the amd64 build of Debian wheezy. Please note that if you have anything that relies on the Debian squeeze version of libssl0.9.8, installing the Ubuntu version of libssl0.9.8 as seen below **will break those packages and apt will want to remove them!** If you get an error in apt asking to remove a number of packages or needing to run _apt-get install -f_ to fix broken dependencies, this is the case. Removing the Ubuntu version of libssl0.9.8 and reinstalling libssl0.9.8 [from squeeze][1] will resolve that.

The packages that we will be using from Ubuntu are from 12.04 (precise) which is based on Debian wheezy and is currently under long term support (LTS).

With that being said, here is what I did to make it work:

  1. (amd64 only) Enable multi-arch:
```
dpkg --add-architecture i386
apt-get update
```

  2. (Optional) Install GDebi Package Installer (gui package installer that handles dependency installation for you)
```
apt-get install gdebi
```

  3. Download vmware-view-client\_2.0.0-0ubuntu0.12.04\_i386.deb from <a href="http://archive.canonical.com/ubuntu/pool/partner/v/vmware-view-client/" title="here" target="_blank">here</a> ([alternate][2])
  4. Download libssl0.9.8\_0.9.8o-7ubuntu3.1\_i386.deb from <a href="http://packages.ubuntu.com/precise-updates/i386/libssl0.9.8/download" title="here" target="_blank">here</a> ([alternate][3])
  5. Install the Ubuntu 12.04 i386 version of libssl0.9.8. Just right click on the downloaded file and choose _Open With GDebi Package Installer_ and click _Install_ when it loads.
  6. Install the Ubuntu 12.04 i386 version of vmware-view-client Just right click on the downloaded file and choose _Open With GDebi Package Installer_ and click _Install_ when it loads.
  7. Now, vmware-view-client should be installed and available from Applications > Internet > VMware View Client.

This should work for both i386 and amd64, just make sure to follow the instructions above following your architecture's instructions. If you have any issues, feel free to leave a comment and I'll take a look.

<!-- Social Bookmarks BEGIN -->

<p class="postcats">
  Share this post:<br /><a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://del.icio.us/post?url=http://tinyurl.com/d22c8su&title=vmware-view-client+2.0+on+debian+wheezy+%28i386%2Famd64%29" rel="nofollow" title="Share on Del.icio.us"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/delicious.png" title="Share on Del.icio.us" alt="Share on Del.icio.us" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.facebook.com/sharer.php?u=http://tinyurl.com/d22c8su" rel="nofollow" title="Share on Facebook"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/facebook.png" title="Share on Facebook" alt="Share on Facebook" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.linkedin.com/shareArticle?mini=true&url=http://tinyurl.com/d22c8su&title=vmware-view-client+2.0+on+debian+wheezy+%28i386%2Famd64%29" rel="nofollow" title="Share on LinkedIn"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/linkedin.png" title="Share on LinkedIn" alt="Share on LinkedIn" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://reddit.com/submit?url=http://tinyurl.com/d22c8su&title=vmware-view-client+2.0+on+debian+wheezy+%28i386%2Famd64%29" rel="nofollow" title="Share on reddit"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/reddit.png" title="Share on reddit" alt="Share on reddit" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.stumbleupon.com/submit?url=http://tinyurl.com/d22c8su&title=vmware-view-client+2.0+on+debian+wheezy+%28i386%2Famd64%29" rel="nofollow" title="Share on Stumble Upon"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/stumbleupon.png" title="Share on Stumble Upon" alt="Share on Stumble Upon" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.technorati.com/faves?add=http://tinyurl.com/d22c8su" rel="nofollow" title="Share on Technorati"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/technorati.png" title="Share on Technorati" alt="Share on Technorati" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://twitter.com/home/?status=vmware-view-client+2.0+on+debian+wheezy+%28i386%2Famd64%29+@+http://tinyurl.com/d22c8su" rel="nofollow" title="Share on Twitter"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/twitter.png" title="Share on Twitter" alt="Share on Twitter" /></a> <br />
</p>

<!-- Social Bookmarks END -->

 [1]: http://packages.debian.org/squeeze/amd64/libssl0.9.8/download
 [2]: /wp-content/uploads/2013/05/vmware-view-client_2.0.0-0ubuntu0.12.04_i386.deb
 [3]: /wp-content/uploads/2013/05/libssl0.9.8_0.9.8o-7ubuntu3.1_i386.deb
