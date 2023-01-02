---
title: getting loopback to work on newer builds of dd-wrt
author: mbentley
layout: post
date: 2011-08-10
url: /2011/08/getting-loopback-to-work-on-newer-builds-of-dd-wrt/
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

Save the following commands to the Firewall Script on the **Administration** -> **Commands** page to fix loopback.
```
insmod ipt_mark
insmod xt_mark

iptables -t mangle -A PREROUTING -i ! `get_wanface` -d `nvram get wan_ipaddr` -j MARK --set-mark 0xd001
iptables -t nat -A POSTROUTING -m mark --mark 0xd001 -j MASQUERADE
```

once you have added these commands to the **Firewall** command list, you will need to perform a reboot and that should make the fix active.

a huge thanks to phuzi0n for providing this workaround! from the number of people who have commented, i can definitely see that i am not alone in wanting loopback to work properly but at least this workaround does the job.

 [1]: http://svn.dd-wrt.com:8000/ticket/1868
 [2]: http://www.dd-wrt.com/phpBB2/viewtopic.php?t=89353
