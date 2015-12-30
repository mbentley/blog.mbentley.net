---
title: optimizing vmware server 2.0 on a linux host
author: mbentley
layout: post
date: 2010-02-05
url: /2010/02/optimizing-vmware-server-2-0-on-a-linux-host-2/
shorturl:
  - http://tinyurl.com/4gxc39w
categories:
  - computers
  - technology
  - virtualization
tags:
  - /dev/shm
  - host
  - linux
  - memory
  - optimization
  - ram
  - ramdisk
  - server 2003
  - server 2008
  - tmpfs
  - vmware server
  - windows

---
like many people, i like to tinker with all sorts of different technology including multiple operating systems as well as the different roles they can play. one of the best ways that i can do that is by using a virtualization product. i just happen to use vmware server 2.0 on my [debian lenny server][1]. [vmware][2] is one of the leaders in virtualization (if not **the** leader).

at home, i have five virtual machines that i rely on heavily for my day-to-day operations. i have two windows server 2008 domain controllers, two windows server 2003 servers running exchange 2003 and one windows server 2008 computer i use for remote desktop and management of services. some of these services can provide a fair load on my server and i was starting to see the impact, especially from my win2k8 vms. it seems that there are a number of optimizations that are not enabled by default in vmware server. i searched far and wide through vmware kb docs as well as blogs and web forums and came up with the following optimizations:

force virtual machines to run in shared memory (in ram)
 
inside '/etc/vmware/config' lies the default config for vmware. add the following lines at the end:

```
MemTrimRate = "0"
mainMem.useNamedFile = "FALSE"
sched.mem.pshare.enable = "FALSE"
tmpDirectory="/dev/shm"
```

this will ensure that virtual machines actually store their virtual memory on /dev/shm. /dev/shm is a location that most linux distributions use for shared memory that is located directly on ram (think of a ramdisk). you will want to make sure that your host makes uses of /dev/shm as seen below:

```
root@athena:~# df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/md0               67G  7.3G   56G  12% /
tmpfs                 4.0G     0  4.0G   0% /lib/init/rw
udev                   10M  972K  9.1M  10% /dev
tmpfs                 8.0G  5.1G  3.0G  64% /dev/shm
/dev/md2              917G  665G  207G  77% /media/md2
/dev/md3              917G  556G  315G  64% /media/md3
```

the text in italics above is what you are looking for. by default, most distros will not allocate that much space for shared memory. however, you can specify the size in the file '/etc/default/tmpfs':

```
# SHM_SIZE sets the maximum size (in bytes) that the /dev/shm tmpfs can use.
# If this is not set then the size defaults to the value of TMPFS_SIZE
# if that is set; otherwise to the kernel's default.
#
# The size will be rounded down to a multiple of the page size, 4096 bytes.
SHM_SIZE=8G
```

by default the variable seen above will be blank (ie - 'SHM_SIZE='). i set mine to 8GB because i have 8GB of ram in my server. the great thing about using shared memory is that if you happen to actually fill up your system's ram, it will start using swap space instead of just running out of room.

next, i added a few lines to the file '/etc/sysctl.conf':

```
vm.swappiness = 0
vm.overcommit_memory = 1
vm.dirty_background_ratio = 5
vm.dirty_ratio = 10
vm.dirty_expire_centisecs = 1000
```

it is my understanding that these are meant to help prevent vmware from using the swap file unnecessarily.

last but not least, i needed to do a little bit of optimization of my file system. my server uses software raid 1 with an ext3 file system so write performance isn't amazing but to speed things up, i changed a few of the mount options in my '/etc/fstab':

```
/etc/fstab: static file system information.
#
# <file system> <mount point>   <type>          <options>                       <dump>  <pass>
proc            /proc           proc            defaults                        0       0
/dev/md0        /               ext3            errors=remount-ro,relatime      0       1
/dev/md1        none            swap            sw                              0       0
/dev/scd0       /media/cdrom0   udf,iso9660     user,noauto                     0       0
/dev/md2        /media/md2      ext3            defaults,noatime,nodiratime     0       2
/dev/md3        /media/md3      ext3            defaults,noatime,nodiratime     0       2
```

i added the 'noatime,nodiratime' options so that write times are not constantly being recorded causing excessive delays.

these settings seem to make my virtual machines run smoother and boot much faster.

<!-- Social Bookmarks BEGIN -->

<p class="postcats">
  Share this post:<br /><a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://del.icio.us/post?url=http://tinyurl.com/4gxc39w&title=optimizing+vmware+server+2.0+on+a+linux+host" rel="nofollow" title="Share on Del.icio.us"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/delicious.png" title="Share on Del.icio.us" alt="Share on Del.icio.us" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.facebook.com/sharer.php?u=http://tinyurl.com/4gxc39w" rel="nofollow" title="Share on Facebook"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/facebook.png" title="Share on Facebook" alt="Share on Facebook" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.linkedin.com/shareArticle?mini=true&url=http://tinyurl.com/4gxc39w&title=optimizing+vmware+server+2.0+on+a+linux+host" rel="nofollow" title="Share on LinkedIn"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/linkedin.png" title="Share on LinkedIn" alt="Share on LinkedIn" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://reddit.com/submit?url=http://tinyurl.com/4gxc39w&title=optimizing+vmware+server+2.0+on+a+linux+host" rel="nofollow" title="Share on reddit"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/reddit.png" title="Share on reddit" alt="Share on reddit" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.stumbleupon.com/submit?url=http://tinyurl.com/4gxc39w&title=optimizing+vmware+server+2.0+on+a+linux+host" rel="nofollow" title="Share on Stumble Upon"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/stumbleupon.png" title="Share on Stumble Upon" alt="Share on Stumble Upon" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.technorati.com/faves?add=http://tinyurl.com/4gxc39w" rel="nofollow" title="Share on Technorati"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/technorati.png" title="Share on Technorati" alt="Share on Technorati" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://twitter.com/home/?status=optimizing+vmware+server+2.0+on+a+linux+host+@+http://tinyurl.com/4gxc39w" rel="nofollow" title="Share on Twitter"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/twitter.png" title="Share on Twitter" alt="Share on Twitter" /></a> <br />
</p>

<!-- Social Bookmarks END -->

 [1]: http://www.mbentley.net/myserver.shtml
 [2]: http://www.vmware.com/
