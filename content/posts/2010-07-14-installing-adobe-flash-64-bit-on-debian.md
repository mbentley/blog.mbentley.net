---
title: installing adobe flash player 64 bit on debian
author: mbentley
layout: post
date: 2010-07-14
url: /2010/07/installing-adobe-flash-64-bit-on-debian/
categories:
  - computers
  - internet
  - linux
  - technology
tags:
  - 64 bit
  - adobe
  - debian
  - flash
  - linux
  - update-alternatives
  - x64
  - x86_64

---
somewhat recently, adobe has pulled all support for 64 bit flash player on linux. debian has also remove the support from it's non-free archives so the `flashplugin-nonfree` package no longer works properly. i find that gnash and swfdec are pretty lacking and are not compatible with all websites which is a major problem for me. after searching online, i found a 64 bit copy of libflashplayer.so and wanted to install it the debian way using `update-alternatives`. here are the steps to install it properly:

  1. first we want to remove the official `flashplugin-nonfree` package:

    sudo aptitude remove --purge flashplugin-nonfree

  2. download `libflashplayer.so` from [here][1].
  3. extract the file to a temporary location using:

    tar zxvf libflashplayer-10.0.45.2.linux-x86_64.so_.tar.gz

you should now see `libflashplayer.so`

  4. from the same temporary location, execute the following commands to make a common location for the file to be stored and then to copy the file there:

    sudo mkdir /usr/lib/adobe-flash
    sudo cp libflashplayer.so /usr/lib/adobe-flash/

  5. next, you will need to create an update-alternatives entry using the following command (copy and paste **both** lines and insert it on the command line as a single command:

    sudo update-alternatives --install /usr/lib/mozilla/plugins/flash-mozilla.so \
    flash-mozilla.so /usr/lib/adobe-flash/libflashplayer.so 20

`--install` indicates that we are adding an entry, `/usr/lib/mozilla/plugins/flash-mozilla.so` indicates the symlink we want to add an option to, `flash-mozilla.so` indicates the update-alternatives name, `/usr/lib/adobe-flash/libflashplayer.so` indicates the file which you are adding, `20` indicates the priority.

  6. now we just need to set the new flash player to be the default:

    sudo update-alternatives --config flash-mozilla.so

make sure to choose the option for the newly created `/usr/lib/adobe-flash/libflashplayer.so`:

    There are 2 alternatives which provide `flash-mozilla.so`.

      Selection    Alternative
    -----------------------------------------------
              1    /usr/lib/gnash/libgnashplugin.so
    *+        2    /usr/lib/adobe-flash/libflashplayer.so

    Press enter to keep the default[*], or type selection number: 2
    Using '/usr/lib/adobe-flash/libflashplayer.so' to provide 'flash-mozilla.so'.

  7. now open up iceweasel (firefox) and navigate to [http://kb2.adobe.com/cps/155/tn_15507.html][3] and it should show the version of flash as `LNX 10,0,45,2`.

and that should be it! if you want to navigate to any flash based site or [adobe's flash test page][3] you should see the plugin working. this has currently been tested on debian lenny (stable) and debian squeeze (testing).

 [1]: /wp-content/uploads/2010/07/libflashplayer-10.0.45.2.linux-x86_64.so_.tar.gz
 [2]: http://kb2.adobe.com/cps/155/tn_15507.html
 [3]: http://www.adobe.com/software/flash/about/
