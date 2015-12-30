---
title: df reports root fs as by-uuid symlink instead of actual device
author: mbentley
layout: post
date: 2013-09-01
url: /2013/09/df-reports-root-fs-as-by-uuid-symlink-instead-of-actual-device/
shorturl:
  - http://tinyurl.com/kknozn8
categories:
  - computers
  - linux
  - technology
tags:
  - by-uuid
  - crunchbang
  - debian
  - df
  - filesystem
  - fs
  - output
  - sda
  - sdb
  - sdc
  - table
  - upgrade
  - uuid
  - wheezy
  - wide

---
_Note_: I did not create the solution to this issue. I originally found it over at the [crunchbang forums][1] so credit goes to them for finding/creating this work around.

One thing that I noticed when I upgraded my Debian servers from squeeze to wheezy was that a number of them were reporting the root filesystem in the output of df as the by-uuid symlink (found in /dev/disk/by-uuid) instead of the actual device name. While there isn't a problem with this in terms of functionality, it was certainly not ideal as it makes the table formatting quite odd when there is a single line much longer than the rest:
```
root@hera:~# df -h
Filesystem                                              Size  Used Avail Use% Mounted on
rootfs                                                   20G   15G  4.6G  77% /
udev                                                     10M     0   10M   0% /dev
tmpfs                                                   101M  204K  100M   1% /run
/dev/disk/by-uuid/833450b5-9b9b-49e4-bb04-9c6a2a3648ce   20G   15G  4.6G  77% /
tmpfs                                                   5.0M     0  5.0M   0% /run/lock
tmpfs                                                   250M     0  250M   0% /run/shm
```

I noticed this right after I upgraded a few systems to Wheezy but I had completely forgotten about it until this morning when I was looking at the current disk usage of one of my systems. I remembered that I never really spent any time looking for a solution. I figured that I couldn't be the only person out there who didn't like the way that the information was being outputted and I was right. A quick Google search and clicking on the first result took me to the answer. The fix is detailed quite well in the [crunchbang forums][1], including the actual long terms result that has been put in place by the maintainers to resolve the issue in the future. Just in case the answer disappears from the internet, here is the workaround:

  1. Create an initramfs script named rootdevice:
```
nano /etc/initramfs-tools/scripts/local-premount/rootdevice
```

  2. Paste the following into the file and save it:

        #!/bin/sh
        #  Mimic a "normal" mount of root device by translating the device link
        #  (UUID or LABEL) to the actual device.

        set -e

        [ "$1" = prereqs ] && exit 0

        REALROOT=`readlink -f ${ROOT}`
        [ "${REALROOT}" ] && echo "ROOT=${REALROOT}" >> /conf/param.conf

        exit 0

  3. Change the permissions on the script so that it is executable:
```
chmod +x /etc/initramfs-tools/scripts/local-premount/rootdevice
```

  4. Update initramfs:
```
update-initramfs -u
```

  5. Reboot your system for the changes to take effect.

You will now see a standard output in df now:
```
root@hera:~# df -h
Filesystem      Size  Used Avail Use% Mounted on
rootfs           20G   15G  4.6G  77% /
udev             10M     0   10M   0% /dev
tmpfs           101M  204K  100M   1% /run
/dev/sda1        20G   15G  4.6G  77% /
tmpfs           5.0M     0  5.0M   0% /run/lock
tmpfs           250M     0  250M   0% /run/shm
```

<!-- Social Bookmarks BEGIN -->

<p class="postcats">
  Share this post:<br /><a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://del.icio.us/post?url=http://tinyurl.com/kknozn8&title=df+reports+root+fs+as+by-uuid+symlink+instead+of+actual+device" rel="nofollow" title="Share on Del.icio.us"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/delicious.png" title="Share on Del.icio.us" alt="Share on Del.icio.us" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.facebook.com/sharer.php?u=http://tinyurl.com/kknozn8" rel="nofollow" title="Share on Facebook"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/facebook.png" title="Share on Facebook" alt="Share on Facebook" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.linkedin.com/shareArticle?mini=true&url=http://tinyurl.com/kknozn8&title=df+reports+root+fs+as+by-uuid+symlink+instead+of+actual+device" rel="nofollow" title="Share on LinkedIn"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/linkedin.png" title="Share on LinkedIn" alt="Share on LinkedIn" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://reddit.com/submit?url=http://tinyurl.com/kknozn8&title=df+reports+root+fs+as+by-uuid+symlink+instead+of+actual+device" rel="nofollow" title="Share on reddit"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/reddit.png" title="Share on reddit" alt="Share on reddit" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.stumbleupon.com/submit?url=http://tinyurl.com/kknozn8&title=df+reports+root+fs+as+by-uuid+symlink+instead+of+actual+device" rel="nofollow" title="Share on Stumble Upon"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/stumbleupon.png" title="Share on Stumble Upon" alt="Share on Stumble Upon" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.technorati.com/faves?add=http://tinyurl.com/kknozn8" rel="nofollow" title="Share on Technorati"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/technorati.png" title="Share on Technorati" alt="Share on Technorati" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://twitter.com/home/?status=df+reports+root+fs+as+by-uuid+symlink+instead+of+actual+device+@+http://tinyurl.com/kknozn8" rel="nofollow" title="Share on Twitter"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/twitter.png" title="Share on Twitter" alt="Share on Twitter" /></a> <br />
</p>

<!-- Social Bookmarks END -->

 [1]: http://crunchbang.org/forums/viewtopic.php?id=25901
