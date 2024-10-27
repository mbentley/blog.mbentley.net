---
title: upgrading to adobe flash player 10.2.161.22 (64 bit) on debian
author: mbentley
layout: post
date: 2010-09-17
url: /2010/09/upgrading-to-adobe-flash-player-10-2-161-22-64-bit-on-debian/
categories:
  - computers
  - internet
  - linux
  - technology
tags:
  - 10.2
  - 10.2.161.22
  - 64 bit
  - adobe
  - beta
  - debian
  - flash
  - linux
  - preview 1
  - testing
  - update-alternatives
  - x64
  - x86_64

---
as i mentioned in my previous blog article, adobe temporarily pulled 64 bit support for the 64 bit plugin. a few days ago (september 15) they released [preview 1 of flash player 10.2][1]. if you have followed the instructions in my [previous article][2], upgrading is quite simple. if not, don't worry, there are only a few extra steps! please remember that this is a beta version so it may not be 100% stable. the method i am using will add a new option to update-alternatives which will allow you to switch between a stable and testing plugin of flash player. this makes it quite simple to change between versions.

  1. if you haven't yet, i would suggest removing the official adobe flash package which is likely to be out of date:

    sudo aptitude remove --purge flashplugin-nonfree


  2. download the latest 64 bit plugin from <a href="http://labs.adobe.com/downloads/flashplayer10.html" target="_blank">here</a>, make sure to select **Download plug-in for 64-bit Linux** ([backup mirror][3]). i would suggest saving the file to **/tmp**.

  3. open a command line window and navigate to /tmp:

    cd /tmp


  4. untar the archive:

    tar zxvf flashplayer_square_p1_64bit_linux_091510.tar.gz


  5. if you haven't followed my previous article, you will need to create the destination directory first:

    sudo mkdir /usr/lib/adobe-flash

  6. next, copy the newly extracted `libflashplayer.so` to the plugin installation location:

    sudo cp libflashplayer.so /usr/lib/adobe-flash/libflashplayer_testing.so

it might be a good idea to verify that you have moved the file properly:

    mbentley@athena:/tmp$ ls -l /usr/lib/adobe-flash/
    total 19736
    -rwxr-xr-x 1 root root  9570824 2010-09-17 09:18 libflashplayer.so
    -rw-r--r-- 1 root root 10601968 2010-09-17 10:01 libflashplayer_testing.so

  7. next we are going to need to add a new entry to update-alternatives for the testing version:

    sudo update-alternatives --install /usr/lib/mozilla/plugins/flash-mozilla.so \
    flash-mozilla.so /usr/lib/adobe-flash/libflashplayer_testing.so 15

`--install` indicates that we are adding an entry, `/usr/lib/mozilla/plugins/flash-mozilla.so` indicates the symlink we want to add an option to, `flash-mozilla.so` indicates the update-alternatives name, `/usr/lib/adobe-flash/libflashplayer_testing.so` indicates the file which you are adding, `15` indicates the priority (higher the number, the higher the priority).

  8. now we need to set the new testing version of flash player to be current active version:

    sudo update-alternatives --config flash-mozilla.so

make sure to choose the option for the newly created `/usr/lib/adobe-flash/libflashplayer_testing.so`:

        There are 2 alternatives which provide 'flash-mozilla.so'.

          Selection    Alternative
        -----------------------------------------------
        *+        1    /usr/lib/adobe-flash/libflashplayer.so
                  2    /usr/lib/adobe-flash/libflashplayer_testing.so

        Press enter to keep the default[*], or type selection number: 2
        Using '/usr/lib/adobe-flash/libflashplayer_testing.so' to provide 'flash-mozilla.so'.

  8. we should now clean up our temporary files as we do not need them anymore:

    rm /tmp/flashplayer_square_p1_64bit_linux_091510.tar.gz /tmp/libflashplayer.so


  9. after you have done that, you will need to restart your web browser and then you should have version 10.2.161.22 installed. you can verify this by going to adobe's [flash test page][4] and looking in the 'version information' section.

in the future, you will simply need to execute steps 2-5 to upgrade to newer versions. if you want to install a new 'stable' plugin, you will just need to change step 5 to copy to '/usr/lib/adobe-flash/libflashplayer.so'. if you do so, you will also want to verify that update-alternatives is pointing to the correct version that you would like to use.

if you have any questions or problems, feel free to post in the comments and i will try to reply to them as soon as possible.

 [1]: http://labs.adobe.com/downloads/flashplayer10.html
 [2]: /2010/07/installing-adobe-flash-64-bit-on-debian/
 [3]: /wp-content/uploads/2010/09/flashplayer_square_p1_64bit_linux_091510.tar.gz
 [4]: http://www.adobe.com/software/flash/about/
