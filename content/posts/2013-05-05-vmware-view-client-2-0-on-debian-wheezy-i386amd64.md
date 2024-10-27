---
title: vmware-view-client 2.0 on debian wheezy (i386/amd64)
author: mbentley
layout: post
date: 2013-05-05
url: /2013/05/vmware-view-client-2-0-on-debian-wheezy-i386amd64/
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
So since wheezy has finally been released as the new 'stable' version of Debian, I went ahead and revisited vmware-view-client on wheezy. I ran into a number of problems Basically, the solution is to use multi-arch and libssl0.9.8 from Ubuntu (i386). You will want the i386 packages even if you are using the amd64 build of Debian wheezy. Please note that if you have anything that relies on the Debian squeeze version of libssl0.9.8, installing the Ubuntu version of libssl0.9.8 as seen below **will break those packages and apt will want to remove them!** If you get an error in apt asking to remove a number of packages or needing to run `apt-get install -f` to fix broken dependencies, this is the case. Removing the Ubuntu version of libssl0.9.8 and reinstalling libssl0.9.8 [from squeeze][1] will resolve that.

The packages that we will be using from Ubuntu are from 12.04 (precise) which is based on Debian wheezy and is currently under long term support (LTS).

With that being said, here is what I did to make it work:

  1. (amd64 only) Enable multi-arch:

    dpkg --add-architecture i386
    apt-get update

  2. (Optional) Install GDebi Package Installer (gui package installer that handles dependency installation for you)

    apt-get install gdebi

  3. Download `vmware-view-client_2.0.0-0ubuntu0.12.04_i386.deb` from [here][2] ([alternate][3])
  4. Download `libssl0.9.8_0.9.8o-7ubuntu3.1_i386.deb` from [here][4] ([alternate][5])
  5. Install the Ubuntu 12.04 i386 version of `libssl0.9.8`. Just right click on the downloaded file and choose **Open With GDebi Package Installer** and click **Install** when it loads.
  6. Install the Ubuntu 12.04 i386 version of vmware-view-client Just right click on the downloaded file and choose **Open With GDebi Package Installer** and click **Install** when it loads.
  7. Now, vmware-view-client should be installed and available from **Applications** > **Internet** > **VMware View Client**.

This should work for both i386 and amd64, just make sure to follow the instructions above following your architecture's instructions. If you have any issues, feel free to leave a comment and I'll take a look.

 [1]: http://packages.debian.org/squeeze/amd64/libssl0.9.8/download
 [2]: http://archive.canonical.com/ubuntu/pool/partner/v/vmware-view-client/
 [3]: /wp-content/uploads/2013/05/vmware-view-client_2.0.0-0ubuntu0.12.04_i386.deb
 [4]: http://packages.ubuntu.com/precise-updates/i386/libssl0.9.8/download
 [5]: /wp-content/uploads/2013/05/libssl0.9.8_0.9.8o-7ubuntu3.1_i386.deb
