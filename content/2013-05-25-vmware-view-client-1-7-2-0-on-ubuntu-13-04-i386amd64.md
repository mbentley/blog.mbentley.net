---
title: vmware-view-client 1.7/2.0/2.1 on ubuntu 13.04/13.10 (i386/amd64)
author: mbentley
layout: post
date: 2013-05-25
url: /2013/05/vmware-view-client-1-7-2-0-on-ubuntu-13-04-i386amd64/
shorturl:
  - http://tinyurl.com/nbcv8ml
fsb_social_twitter:
  - 1
categories:
  - computers
  - internet
  - linux
  - virtualization
tags:
  - 1.7
  - 13.04
  - 13.10
  - 2.0
  - 2.1
  - amd64
  - canoncial
  - client
  - deb
  - debian
  - desktop
  - i386
  - linux
  - packages
  - partner
  - pc over ip
  - pcoip
  - raring
  - saucy salamander
  - ubuntu
  - vdi
  - view
  - virtualization
  - vmware-view-client

---
Recently, Remi commented about how to get vmware-view-client working on Ubuntu 13.04, asking if I had a repackaged version for amd64. Ubuntu can take advantage of multiarch which makes the install very similar to how it is done on Debian wheezy amd64. Of course when I went to install it, I immediately ran into a few problems. Luckily there is a solution. Here are all of the steps that I took to get it installed and working:

  1. (amd64 only) Enable multi-arch:
```
sudo dpkg --add-architecture i386
sudo apt-get update
```

  2. Add the Canonical 'Partners' repository from System Settings > Software & Updates > Other Software. Check the box next to 'Canonical Partners'. I am not that familiar with Ubuntu but you may need to run
```
sudo apt-get update
```

    to pull in the new package lists unless Ubuntu magically does this in the background.

      * (Optional) Install GDebi Package Installer (gui package installer that handles dependency installation for you)
```
sudo apt-get install gdebi
```

      * Download libudev0\_175-0ubuntu13\_i386.deb from <a href="http://launchpadlibrarian.net/119461148/libudev0_175-0ubuntu13_i386.deb" title="here" target="_blank">here</a> ([alternate][1])
      * Install libudev0\_175-0ubuntu13\_i386.deb. Just right click on the downloaded file and choose _Open With GDebi Package Installer_ and click _Install_ when it loads.
      * Install vmware-view-client. You can either install 1.7 or 2.0. It is going to be mostly personal preference but I don't see too many differences between the two.
          * **vmware-view-client 1.7** - 1.7 is currently available from the repositories and can just be installed using the command:
```
sudo apt-get install vmware-view-client
```

        Please note that you must have libudev0 installed for this to work otherwise it will not install.

          * **vmware-view-client 2.0** - 2.0 needs to be downloaded and installed. Download vmware-view-client\_2.0.0-0ubuntu0.12.04\_i386.deb from <a href="http://archive.canonical.com/ubuntu/pool/partner/v/vmware-view-client/" title="here" target="_blank">here</a> ([alternate][2])

            Just right click on the downloaded file and choose _Open With GDebi Package Installer_ and click _Install_ when it loads.

          * **vmware-view-client 2.1** - 2.1 needs to be downloaded and installed. Download vmware-view-client\_2.1.0-0ubuntu0.12.10\_i386.deb from <a href="http://archive.canonical.com/ubuntu/pool/partner/v/vmware-view-client/" title="here" target="_blank">here</a> ([alternate][3])

            Just right click on the downloaded file and choose _Open With GDebi Package Installer_ and click _Install_ when it loads.
          * Now, vmware-view-client should be installed and available from Applications.
        This should work for both i386 and amd64, just make sure to follow the instructions above following your architecture's instructions. If you have any issues, feel free to leave a comment and I'll take a look.

        *Edit 02-Nov-2013: I just checked and this still works for Ubuntu 13.10. At the time of this edit, they also have vmware-view-client 2.1 available. The information about has been updated to reflect that but there isn't anything procedurally different with 2.0 vs 2.1.

<!-- Social Bookmarks BEGIN -->

<p class="postcats">
Share this post:<br /><a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://del.icio.us/post?url=http://tinyurl.com/nbcv8ml&title=vmware-view-client+1.7%2F2.0%2F2.1+on+ubuntu+13.04%2F13.10+%28i386%2Famd64%29" rel="nofollow" title="Share on Del.icio.us"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/delicious.png" title="Share on Del.icio.us" alt="Share on Del.icio.us" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.facebook.com/sharer.php?u=http://tinyurl.com/nbcv8ml" rel="nofollow" title="Share on Facebook"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/facebook.png" title="Share on Facebook" alt="Share on Facebook" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.linkedin.com/shareArticle?mini=true&url=http://tinyurl.com/nbcv8ml&title=vmware-view-client+1.7%2F2.0%2F2.1+on+ubuntu+13.04%2F13.10+%28i386%2Famd64%29" rel="nofollow" title="Share on LinkedIn"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/linkedin.png" title="Share on LinkedIn" alt="Share on LinkedIn" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://reddit.com/submit?url=http://tinyurl.com/nbcv8ml&title=vmware-view-client+1.7%2F2.0%2F2.1+on+ubuntu+13.04%2F13.10+%28i386%2Famd64%29" rel="nofollow" title="Share on reddit"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/reddit.png" title="Share on reddit" alt="Share on reddit" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.stumbleupon.com/submit?url=http://tinyurl.com/nbcv8ml&title=vmware-view-client+1.7%2F2.0%2F2.1+on+ubuntu+13.04%2F13.10+%28i386%2Famd64%29" rel="nofollow" title="Share on Stumble Upon"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/stumbleupon.png" title="Share on Stumble Upon" alt="Share on Stumble Upon" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.technorati.com/faves?add=http://tinyurl.com/nbcv8ml" rel="nofollow" title="Share on Technorati"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/technorati.png" title="Share on Technorati" alt="Share on Technorati" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://twitter.com/home/?status=vmware-view-client+1.7%2F2.0%2F2.1+on+ubuntu+13.04%2F13.10+%28i386%2Famd64%29+@+http://tinyurl.com/nbcv8ml" rel="nofollow" title="Share on Twitter"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/twitter.png" title="Share on Twitter" alt="Share on Twitter" /></a> <br />
</p>

<!-- Social Bookmarks END -->

 [1]: http://launchpadlibrarian.net/119461148/libudev0_175-0ubuntu13_i386.deb
 [2]: /wp-content/uploads/2013/05/vmware-view-client_2.0.0-0ubuntu0.12.04_i386.deb
 [3]: /wp-content/uploads/2013/05/vmware-view-client_2.1.0-0ubuntu0.12.10_i386.deb
