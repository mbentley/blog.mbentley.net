---
title: installing oracle java 7 jre/jdk on debian wheezy
author: mbentley
layout: post
date: 2013-08-30
url: /2013/08/installing-oracle-java-7-jre-jdk-on-debian-wheezy/
shorturl:
  - http://tinyurl.com/mbyrkk3
categories:
  - computers
  - internet
  - linux
  - technology
tags:
  - .tar.gz
  - 7
  - amd64
  - archive
  - debian
  - iceweasel
  - java
  - jdk
  - jre
  - manual
  - oracle
  - plugin
  - sun
  - wheezy

---
_Note_: You can follow the same instructions for the Oracle Java 7 JRE. If you do, ignore the steps for javac.

Previously, I have relied on following instructions from [Alexander Holbreich's blog][1] on how to install the latest Oracle Java JDK on Debian Wheezy (amd64). There are a few steps that are a little outdated but overall, it works well. Since I find myself updating Java fairly often as newer versions are released, I figured that it would be worthwhile to write down the updated steps:

  1. Download the latest Oracle JDK from [here][2].

    Scroll down and click the JDK download button.
      <a href="/wp-content/uploads/2013/08/JDK_button.png" rel="lightbox[682]"><img alt="JDK_button" src="/wp-content/uploads/2013/08/JDK_button-273x300.png" width="273" height="300" /></a> <a href="/wp-content/uploads/2013/08/JDK_download.png" rel="lightbox[682]"><img alt="JDK_download" src="/wp-content/uploads/2013/08/JDK_download-300x241.png" width="300" height="241" /></a>

    Accept the license agreement and then select the proper Linux x64 .tar.gz file.

      * Once downloaded, transfer the .tar.gz file to your box to install.

        _Note_: There are other ways to directly download the latest JDK but this is probably the most straight forward.
      * Extract the latest JDK to /usr/lib/jvm/. Example:
```
tar zxvf jdk-7u25-linux-x64.tar.gz -C /usr/lib/jvm/
```

      * Check to see what update-alternatives priority the current 'java' is at:
```
root@athena:~# update-alternatives --display java
java - auto mode
  link currently points to /usr/lib/jvm/jdk1.7.0_21/bin/java
/usr/lib/jvm/java-6-openjdk-amd64/jre/bin/java - priority 1061
  slave java.1.gz: /usr/lib/jvm/java-6-openjdk-amd64/jre/man/man1/java.1.gz
/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java - priority 1051
  slave java.1.gz: /usr/lib/jvm/java-7-openjdk-amd64/jre/man/man1/java.1.gz
/usr/lib/jvm/jdk1.7.0_21/bin/java - <span style="color: #ff0000;">priority 1066</span>
Current 'best' version is '/usr/lib/jvm/jdk1.7.0_21/bin/java'.
```

        Look for the highest priority and in the next step, increment the priority by one so that it automatically gets selected by update-alternatives. In this case, we will use 1067.

      * Add the latest version of java, javac, javaws, & libnpjp2.so using update-alternatives:
```
update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.7.0_25/bin/java 1067
update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.7.0_25/bin/javac 1067
update-alternatives --install /usr/bin/javaws javaws /usr/lib/jvm/jdk1.7.0_25/bin/javaws 1067
update-alternatives --install /usr/lib/mozilla/plugins/libnpjp2.so libnpjp2.so /usr/lib/jvm/jdk1.7.0_25/jre/lib/amd64/libnpjp2.so 1067
```

      * If you want to remove previous versions of the Oracle JDK, you can do so by simply removing the directory of the previous version of the JDK from /usr/lib/jvm/ and having update-alternatives do an auto selection. Example:
```
rm -rf /usr/lib/jvm/jdk1.7.0_21
update-alternatives --auto java
update-alternatives --auto javac
update-alternatives --auto javaws
update-alternatives --auto libnpjp2.so
```

 Now you should have the latest Oracle Java JDK:
```
root@athena:~# java -version
java version "1.7.0_25"
Java(TM) SE Runtime Environment (build 1.7.0_25-b15)
Java HotSpot(TM) 64-Bit Server VM (build 23.25-b01, mixed mode)
```

You can verify the installation of the Iceweasel plugin by navigating to 'about:plugins'.

As always, feel free to leave a comment if you have any issues or find any problems with these instructions.

*Edit: I have updated the instructions to include the Java plugin for Iceweasel upon request.

<!-- Social Bookmarks BEGIN -->

<p class="postcats">
Share this post:<br /><a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://del.icio.us/post?url=http://tinyurl.com/mbyrkk3&title=installing+oracle+java+7+jre%2Fjdk+on+debian+wheezy" rel="nofollow" title="Share on Del.icio.us"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/delicious.png" title="Share on Del.icio.us" alt="Share on Del.icio.us" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.facebook.com/sharer.php?u=http://tinyurl.com/mbyrkk3" rel="nofollow" title="Share on Facebook"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/facebook.png" title="Share on Facebook" alt="Share on Facebook" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.linkedin.com/shareArticle?mini=true&url=http://tinyurl.com/mbyrkk3&title=installing+oracle+java+7+jre%2Fjdk+on+debian+wheezy" rel="nofollow" title="Share on LinkedIn"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/linkedin.png" title="Share on LinkedIn" alt="Share on LinkedIn" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://reddit.com/submit?url=http://tinyurl.com/mbyrkk3&title=installing+oracle+java+7+jre%2Fjdk+on+debian+wheezy" rel="nofollow" title="Share on reddit"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/reddit.png" title="Share on reddit" alt="Share on reddit" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.stumbleupon.com/submit?url=http://tinyurl.com/mbyrkk3&title=installing+oracle+java+7+jre%2Fjdk+on+debian+wheezy" rel="nofollow" title="Share on Stumble Upon"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/stumbleupon.png" title="Share on Stumble Upon" alt="Share on Stumble Upon" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.technorati.com/faves?add=http://tinyurl.com/mbyrkk3" rel="nofollow" title="Share on Technorati"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/technorati.png" title="Share on Technorati" alt="Share on Technorati" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://twitter.com/home/?status=installing+oracle+java+7+jre%2Fjdk+on+debian+wheezy+@+http://tinyurl.com/mbyrkk3" rel="nofollow" title="Share on Twitter"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/twitter.png" title="Share on Twitter" alt="Share on Twitter" /></a> <br />
</p>

<!-- Social Bookmarks END -->

 [1]: http://alexander.holbreich.org/2011/11/java-7-on-debian/
 [2]: http://www.oracle.com/technetwork/java/javase/downloads/index.html
