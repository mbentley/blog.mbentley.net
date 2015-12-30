---
title: creating a raid 5 array in linux with mdadm
author: mbentley
layout: post
date: 2010-11-04
url: /2010/11/creating-a-raid-5-array-in-linux-with-mdadm/
shorturl:
  - http://tinyurl.com/5ua7bjq
categories:
  - computers
  - linux
  - technology
tags:
  - 1 tb
  - add drive
  - debian
  - ext3
  - ext4
  - file system
  - hitachi
  - linux
  - mdadm
  - raid 5
  - xfs

---
i recently had a hard drive fail in my server. luckily i was running it in a raid 1 array so all of my data was kept safe. i decided that while i had a hard drive out of service that i might as well take some time to do some upgrading of my storage space. i had been just running two basic raid 1 arrays (each with two 1 TB drives) using mdadm with ext3 for my virtual machines and other assorted storage. while ext3 is a very stable file system, it isn't know for its speed. while i certainly wasn't running out of storage space by any means, i thought it to be smarter to upgrade while i had enough space to rearrange things.

while i already owned four 1 TB hard drives, two of them are western digital green drives which means they have variable RPMs; not exactly the best choice for a raid array. my main goals are speed, redundancy, and increasing my total storage space. with that being said, it seemed to me that the best choice was to buy more drives identical to my two 7200 rpm drives ([hitachi deskstar 7K1000B HDT721010SLA360][1] to be exact). i was able to find some for a decent price ($50) from an online retailer so i picked up three. when i received my other drive back from RMA to hitachi, that would give me a total of five 1 TB drives to make a nice raid 5 array.

next, i just had to choose what file system i was going to include. different file systems provide different features and abilities. some are able to perform online resizing, some are optimized for read performance, others write, etc. overall, i was looking for something fairly reliable, as close to 'ext3 reliable' as possible while getting that extra boost of speed but i also wanting to pick something mainstream that i knew would be supported for years to come. to begin with, i started looking at ext4 and xfs. after doing some quick research, i realized that my server, which is running debian lenny (stable) does not include a stable ext4 driver. it only comes with ext4dev. while i could upgrade my kernel and use packages from backports, i really didn't want to have to make that many changes to my stable, working server. so after speaking with a few colleagues and people online, i decided that xfs would be my best bet for my specific situation.

while digging further into xfs, i stumbled upon a [useful mythtv wiki article regarding xfs][2] (thanks to MRD for the link). this provided some very useful information as to how to create an optimized xfs file system for your devices. now that i had all of my information together, it was time to do a little bit of testing in a virtual environment just to familiarize myself with the process. when doing what i consider major operations, i like to test things out first. i just created a basic debian VM with multiple virtual disks, practiced creating, assembling, expanding, etc to see how well it worked.

earlier this week, my three new drives arrived. since raid 5 can run in a degraded 5 drive array with only four drives, i figured that i would go ahead and get started while still waiting for my last drive from RMA. i arranged my drives so that my raid 5 array would consist of the drives on /dev/sda to /dev/sde. many of the commands that i am using for this were found on [Useful Mdadm Commands @ excaliburtech.net][3] which is a great resource for example usage of mdadm commands. first, i created a single partition layout using fdisk on /dev/sda, set the type to 'fd' which is 'Linux raid autodetect'. the layout should look like this:
```
root@athena:~# fdisk -l /dev/sda

Disk /dev/sda: 1000.2 GB, 1000204886016 bytes
255 heads, 63 sectors/track, 121601 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk identifier: 0x68714c34

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1               1      121601   976760001   fd  Linux raid autodetect
```

i could use fdisk to create the same partition layout on the other three drives but there is an easy way to copy the layout. '/dev/sda' is the source disk, and the last parameter is the destination disk. this just copies the partition table layout to ensure they are identical:
```
sfdisk -d /dev/sda | sfdisk /dev/sdb
sfdisk -d /dev/sda | sfdisk /dev/sdc
sfdisk -d /dev/sda | sfdisk /dev/sdd
```

next, i opted to clean the superblocks to ensure that any existing superblock data (where mdadm stores array information for each drive) would be cleared.
```
mdadm --zero-superblock /dev/sd[abcd]
mdadm --zero-superblock /dev/sd[abcd]1
```

now we are ready to create the raid array. i already have a md0 and md1 so my next available is md2. this will create a raid 5 array using 5 devices but with one drive missing.
```
mdadm --create /dev/md2 --level=5 --raid-devices=5 /dev/sd[abcd]1 missing
```

be default, arrays are shows as read only. you can now mark the array as read-write:
```
mdadm --readwrite /dev/md2
```

you can now see the degraded array using 'cat /proc/mdstat':
```
root@athena:~# cat /proc/mdstat
Personalities : [raid1] [raid6] [raid5] [raid4]
md2 : active raid5 sda1[0] sdd1[3] sdc1[2] sdb1[1]
      3907039744 blocks level 5, 64k chunk, algorithm 2 [5/4] [UUUU_]
```

next, i am ready to prepare the new array with new xfs file system. using the myth wiki link above, i calculated the optimal values for my array and inserted them into the mkfs.xfs command:
```
mkfs.xfs -b size=4096 -d sunit=128,swidth=512 /dev/md2
```

now that the xfs file system has been created, i can do a test mount:
```
mkdir /media/md2
mount -o sunit=128,swidth=512 /dev/md2 /media/md2
```

my test mount was successful so i wanted to automatically mount my new array at boot so i just needed to add the following to /etc/fstab:
```
/dev/md2        /media/md2      xfs             sunit=128,swidth=512,noatime,nodiratime 0       0
```

now i also want to add the new raid 5 array's information to /etc/mdadm/mdadm.conf
```
mdadm --examine --scan
ARRAY /dev/md2 level=raid5 num-devices=5 UUID=512145fc:e9a0cb9e:affa4567:83059fad
```

so i add it to the last line and the contents of the entire file look like:
```
# mdadm.conf
#
# Please refer to mdadm.conf(5) for information about this file.
#

# by default, scan all partitions (/proc/partitions) for MD superblocks.
# alternatively, specify devices to scan, using wildcards if desired.
DEVICE partitions

# auto-create devices with Debian standard permissions
CREATE owner=root group=disk mode=0660 auto=yes

# automatically tag new arrays as belonging to the local system
HOMEHOST <system>

# instruct the monitoring daemon where to send mail alerts
MAILADDR root

# definitions of existing MD arrays
ARRAY /dev/md0 level=raid1 num-devices=2 metadata=0.90 UUID=ad56dba9:a587a6ce:63b74a7d:37f4f41d
ARRAY /dev/md1 level=raid1 num-devices=2 metadata=0.90 UUID=9ee58430:486e6421:6e7df9ee:51ed0ff2
ARRAY /dev/md2 level=raid5 num-devices=5 metadata=0.90 UUID=512145fc:e9a0cb9e:affa4567:83059fad
```

i then went ahead and copied my data to the new array and two days later, my new drive arrived. after installing it in my system, i needed to create the partition information from an existing drive, clean the superblock, and add the drive to the array using the following commands:

copy partition information from an existing disk:
```
sfdisk -d /dev/sda | sfdisk /dev/sde
```

clean the superblock:
```
mdadm --zero-superblock /dev/sd[e]
mdadm --zero-superblock /dev/sd[e]1
```

add the new drive to the existing raid 5 array:
```
mdadm --add /dev/md2 /dev/sd[e]1
```

check drive synchronization status:
```
root@athena:~# cat /proc/mdstat
Personalities : [raid1] [raid6] [raid5] [raid4]
md2 : active raid5 sde1[5] sda1[0] sdd1[3] sdc1[2] sdb1[1]
      3907039744 blocks level 5, 64k chunk, algorithm 2 [5/4] [UUUU_]
      [============>........]  recovery = 60.4% (590546092/976759936) finish=100.7min speed=63877K/sec
```

now my raid 5 array is completely synchronized and is fully redundant:
```
root@athena:~# cat /proc/mdstat
Personalities : [raid1] [raid6] [raid5] [raid4]
md2 : active raid5 sde1[4] sda1[0] sdd1[3] sdc1[2] sdb1[1]
      3907039744 blocks level 5, 64k chunk, algorithm 2 [5/5] [UUUUU]
```

<!-- Social Bookmarks BEGIN -->

<p class="postcats">
  Share this post:<br /><a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://del.icio.us/post?url=http://tinyurl.com/5ua7bjq&title=creating+a+raid+5+array+in+linux+with+mdadm" rel="nofollow" title="Share on Del.icio.us"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/delicious.png" title="Share on Del.icio.us" alt="Share on Del.icio.us" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.facebook.com/sharer.php?u=http://tinyurl.com/5ua7bjq" rel="nofollow" title="Share on Facebook"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/facebook.png" title="Share on Facebook" alt="Share on Facebook" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.linkedin.com/shareArticle?mini=true&url=http://tinyurl.com/5ua7bjq&title=creating+a+raid+5+array+in+linux+with+mdadm" rel="nofollow" title="Share on LinkedIn"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/linkedin.png" title="Share on LinkedIn" alt="Share on LinkedIn" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://reddit.com/submit?url=http://tinyurl.com/5ua7bjq&title=creating+a+raid+5+array+in+linux+with+mdadm" rel="nofollow" title="Share on reddit"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/reddit.png" title="Share on reddit" alt="Share on reddit" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.stumbleupon.com/submit?url=http://tinyurl.com/5ua7bjq&title=creating+a+raid+5+array+in+linux+with+mdadm" rel="nofollow" title="Share on Stumble Upon"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/stumbleupon.png" title="Share on Stumble Upon" alt="Share on Stumble Upon" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.technorati.com/faves?add=http://tinyurl.com/5ua7bjq" rel="nofollow" title="Share on Technorati"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/technorati.png" title="Share on Technorati" alt="Share on Technorati" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://twitter.com/home/?status=creating+a+raid+5+array+in+linux+with+mdadm+@+http://tinyurl.com/5ua7bjq" rel="nofollow" title="Share on Twitter"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/twitter.png" title="Share on Twitter" alt="Share on Twitter" /></a> <br />
</p>

<!-- Social Bookmarks END -->

 [1]: http://www.tomshardware.com/reviews/hitachi-western-digital-terabyte,2017-2.html
 [2]: http://www.mythtv.org/wiki/Optimizing_Performance#Optimizing_XFS_on_RAID_Arrays
 [3]: http://www.excaliburtech.net/archives/19
