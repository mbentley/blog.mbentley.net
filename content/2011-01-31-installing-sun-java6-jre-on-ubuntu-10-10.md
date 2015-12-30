---
title: installing sun-java6-jre on ubuntu 10.10
author: mbentley
layout: post
date: 2011-01-31
url: /2011/01/installing-sun-java6-jre-on-ubuntu-10-10/
shorturl:
  - http://tinyurl.com/65m2v28
categories:
  - computers
  - linux
  - minecraft
  - technology
tags:
  - 10.10
  - apt
  - aptitude
  - command line
  - java
  - jre
  - minecraft
  - openjdk
  - oracle
  - partner
  - repository
  - server
  - sources.list
  - sun
  - ubuntu

---
there have been a number of people who are trying to get minecraft working on ubuntu 10.10 and running into java related issues because they install openjdk or another open source java replacement. by default, the repository required to install the 'sun-java6-jre' package is disabled. this will walk you through how to enable it and install the latest JRE.
```
sudo nano /etc/apt/sources.list
```

search for 'partner' (ctrl + w, type in 'partner', hit enter)

this should get you close to the correct lines you need to uncomment. uncomment the following two lines:
```
# deb http://archive.canonical.com/ubuntu maverick partner
# deb-src http://archive.canonical.com/ubuntu maverick partner
```

should look like this:
```
deb http://archive.canonical.com/ubuntu maverick partner
deb-src http://archive.canonical.com/ubuntu maverick partner
```

exit and save changes (ctrl + x, Y, enter to confirm filename)

run the following commands to make the changes you just made to your repositories active and to install the sun JRE:
```
sudo aptitude update
sudo aptitude install sun-java6-jre
sudo update-alternatives --config java
```

choose the version that has '/usr/lib/jvm/java-6-sun/jre/bin/java' (it may auto-select it if you do not have another version of java installed)

verify it is installed correctly using 'java -version' (should look like the following:)
```
java version "1.6.0_22"
Java(TM) SE Runtime Environment (build 1.6.0_22-b04)
Java HotSpot(TM) 64-Bit Server VM (build 17.1-b03, mixed mode)
```

<!-- Social Bookmarks BEGIN -->

<p class="postcats">
  Share this post:<br /><a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://del.icio.us/post?url=http://tinyurl.com/65m2v28&title=installing+sun-java6-jre+on+ubuntu+10.10" rel="nofollow" title="Share on Del.icio.us"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/delicious.png" title="Share on Del.icio.us" alt="Share on Del.icio.us" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.facebook.com/sharer.php?u=http://tinyurl.com/65m2v28" rel="nofollow" title="Share on Facebook"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/facebook.png" title="Share on Facebook" alt="Share on Facebook" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.linkedin.com/shareArticle?mini=true&url=http://tinyurl.com/65m2v28&title=installing+sun-java6-jre+on+ubuntu+10.10" rel="nofollow" title="Share on LinkedIn"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/linkedin.png" title="Share on LinkedIn" alt="Share on LinkedIn" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://reddit.com/submit?url=http://tinyurl.com/65m2v28&title=installing+sun-java6-jre+on+ubuntu+10.10" rel="nofollow" title="Share on reddit"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/reddit.png" title="Share on reddit" alt="Share on reddit" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.stumbleupon.com/submit?url=http://tinyurl.com/65m2v28&title=installing+sun-java6-jre+on+ubuntu+10.10" rel="nofollow" title="Share on Stumble Upon"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/stumbleupon.png" title="Share on Stumble Upon" alt="Share on Stumble Upon" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.technorati.com/faves?add=http://tinyurl.com/65m2v28" rel="nofollow" title="Share on Technorati"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/technorati.png" title="Share on Technorati" alt="Share on Technorati" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://twitter.com/home/?status=installing+sun-java6-jre+on+ubuntu+10.10+@+http://tinyurl.com/65m2v28" rel="nofollow" title="Share on Twitter"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/twitter.png" title="Share on Twitter" alt="Share on Twitter" /></a> <br />
</p>

<!-- Social Bookmarks END -->
