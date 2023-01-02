---
title: 'linux vmware view 5 client debs for i386 & amd64 (ubuntu and debian)'
author: mbentley
layout: post
date: 2012-02-09
url: /2012/02/linux-vmware-view-5-client-debs-for-i386-amd64-ubuntu-and-debian/
categories:
  - computers
  - internet
  - linux
  - technology
  - virtualization
tags:
  - 1.3.0
  - 1.4.0
  - 5
  - client
  - deb
  - debian
  - desktop
  - linux
  - packages
  - pc over ip
  - pcoip
  - ubuntu
  - vdi
  - view
  - virtualzation
  - vmware
  - vmware-view-client

---
if you have been following recent news in the world of vdi and vmware, they recently annouced the release of a linux vmware view 5 client that supports pcoip and that it was available for ubuntu. i was able to find the i386 deb package and it installed without a problem on debian squeeze i386 but i couldn't find an amd64 package anywhere. not wanting to wait until they eventually released one, i went ahead and repackaged the i386 deb for amd64. it works for both ubuntu and debian from my testing.

you can download both the i386 and amd64 deb files here:

## vmware-view-client 1.3.0
[i386][1] | [amd64][2]

## vmware-view-client 1.4.0
[i386][3] | [amd64][4] (ubuntu and debian wheezy/sid) | [amd64][5] (debian squeeze)

if you have any problems, leave me a note in the comments and i'll get back to you as quickly as i can.

\*edit: it has been pointed out that the amd64 version wasn't working properly on ubuntu. give [this version][2] a try (link has been updated above).

 [1]: /wp-content/uploads/2012/02/vmware-view-client_1.3.0-0ubuntu1+lucid2_i386.deb
 [2]: /wp-content/uploads/2012/02/vmware-view-client_1.3.0-1_amd64.deb
 [3]: /wp-content/uploads/2012/02/vmware-view-client_1.4.0-0ubuntu2.0.11.10_i386.deb
 [4]: /wp-content/uploads/2012/02/vmware-view-client_1.4.0-0_amd64.deb
 [5]: /wp-content/uploads/2012/02/vmware-view-client_1.4.0-0_test_amd64.deb
