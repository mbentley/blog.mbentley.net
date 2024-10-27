---
title: installing sun-java6-jre on ubuntu 10.10
author: mbentley
layout: post
date: 2011-01-31
url: /2011/01/installing-sun-java6-jre-on-ubuntu-10-10/
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

search for `partner` (ctrl + w, type in 'partner', hit enter)

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
