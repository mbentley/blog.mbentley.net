---
title: vmware-view-client 1.7/2.0/2.1 on ubuntu 13.04/13.10 (i386/amd64)
author: mbentley
layout: post
date: 2013-05-25
url: /2013/05/vmware-view-client-1-7-2-0-on-ubuntu-13-04-i386amd64/
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

    sudo dpkg --add-architecture i386
    sudo apt-get update

  2. Add the Canonical **Partners** repository from **System Settings** > **Software & Updates** > **Other Software**. Check the box next to **Canonical Partners**. I am not that familiar with Ubuntu but you may need to run `sudo apt-get update` to pull in the new package lists unless Ubuntu magically does this in the background.

  3. (Optional) Install GDebi Package Installer (gui package installer that handles dependency installation for you)

    sudo apt-get install gdebi

  4. Download `libudev0_175-0ubuntu13_i386.deb` from [here][1] ([alternate][2])

  5. Install `libudev0_175-0ubuntu13_i386.deb`. Right click on the downloaded file and choose **Open With GDebi Package Installer** and click **Install** when it loads.

  6. Install vmware-view-client. You can either install 1.7 or 2.0. It is going to be mostly personal preference but I don't see too many differences between the two.

     * **For vmware-view-client 1.7** - 1.7 is currently available from the repositories and can just be installed using the command:

    sudo apt-get install vmware-view-client


Please note that you must have libudev0 installed for this to work otherwise it will not install.

* **For vmware-view-client 2.0** - 2.0 needs to be downloaded and installed. Download `vmware-view-client_2.0.0-0ubuntu0.12.04_i386.deb` from [here][3] ([alternate][4])

Right click on the downloaded file and choose **Open With GDebi Package Installer** and click **Install** when it loads.

* **For vmware-view-client 2.1** - 2.1 needs to be downloaded and installed. Download `vmware-view-client_2.1.0-0ubuntu0.12.10_i386.deb` from [here][5] ([alternate][6])

Right click on the downloaded file and choose **Open With GDebi Package Installer** and click **Install** when it loads.

  7. Now, vmware-view-client should be installed and available from Applications.

This should work for both i386 and amd64, just make sure to follow the instructions above following your architecture's instructions. If you have any issues, feel free to leave a comment and I'll take a look.

\*Edit 02-Nov-2013: I just checked and this still works for Ubuntu 13.10. At the time of this edit, they also have vmware-view-client 2.1 available. The information about has been updated to reflect that but there isn't anything procedurally different with 2.0 vs 2.1.

 [1]: http://launchpadlibrarian.net/119461148/libudev0_175-0ubuntu13_i386.deb
 [2]: /wp-content/uploads/2013/05/libudev0_175-0ubuntu13_i386.deb
 [3]: http://archive.canonical.com/ubuntu/pool/partner/v/vmware-view-client/
 [4]: /wp-content/uploads/2013/05/vmware-view-client_2.0.0-0ubuntu0.12.04_i386.deb
 [5]: http://archive.canonical.com/ubuntu/pool/partner/v/vmware-view-client/
 [6]: /wp-content/uploads/2013/05/vmware-view-client_2.1.0-0ubuntu0.12.10_i386.deb
