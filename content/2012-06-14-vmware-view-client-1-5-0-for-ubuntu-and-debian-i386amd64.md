---
title: vmware-view-client 1.5.0 for ubuntu and debian (i386/amd64)
author: mbentley
layout: post
date: 2012-06-14
url: /2012/06/vmware-view-client-1-5-0-for-ubuntu-and-debian-i386amd64/
categories:
  - computers
  - internet
  - linux
  - technology
  - virtualization
tags:
  - 1.5.0
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
  - virtualization
  - vmware
  - vmware-view-client

---
a coworker informed me of a new version of the vmware-view-client that was released (version 1.5.0). i went ahead and created a new amd64 deb file and it looks like this time, there are not any dependency issues! download away and let me know if you run into any issues. i have tested on debian 6 (squeeze; amd64) and ubuntu 11.10 (oneiric ocelot; amd64).

## vmware-view-client 1.5.0
[i386][1] | [amd64][2]

as always, i will try to answer any comments as soon as i can.

\*update 7/21 - i found something that i forgot to update when repackaging the 1.5.0 version which caused PCoIP to not work as expected for amd64. i've updated it and it's now fixed so just re-download and re-install and all will be well.

\*update 7/25 - in case you are interested in how this is done, i have setup a github repository:

[https://github.com/mbentley/vmware-view-client][3]

i will be trying to stay up to date with the latest builds as they come along and include some more detailed instructions.

 [1]: https://launchpad.net/ubuntu/+source/vmware-view-client/1.5.0-0ubuntu0.10.04/+build/3495762/+files/vmware-view-client_1.5.0-0ubuntu0.10.04_i386.deb
 [2]: https://github.com/downloads/mbentley/vmware-view-client/vmware-view-client_1.5.0-0_amd64.deb
 [3]: https://github.com/mbentley/vmware-view-client
