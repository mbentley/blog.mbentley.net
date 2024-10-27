---
title: vmware-view-client 1.4.0 for ubuntu and debian (i386/amd64)
author: mbentley
layout: post
date: 2012-04-08
url: /2012/04/vmware-view-client-1-4-0-for-ubuntu-and-debian-wheezy-i386-amd64/
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
an added dependency for the vmware-view-client package is preventing installation on debian squeeze (stable) for the latest vmware-view-client 1.4.0 pacakge. trying to install that single dependency results in a majority of the gui being upgraded as well and there isn't a backports package available for it. ~~i'm still working to see if i can get it working but for now~~ (see the edit below), the packages are available for ubuntu and debian wheezy on i386 and amd64. They have been added to the [previous post][1] if you would like to give them a try:

\*edit: i went ahead and removed the added dependency and it still seems to work. i'm not completely sure what the package 'libgdk-pixbuf2.0-0' is used for but it doesn't appear to be an important part of the actual function of the application. i am led to believe it is a part of the gui that has been implemented. i've added a test version to the link above so give it a shot.

as always, feel free to post in the comments if you have any issues.

  [1]: </2012/02/linux-vmware-view-5-client-debs-for-i386-amd64-ubuntu-and-debian/>
