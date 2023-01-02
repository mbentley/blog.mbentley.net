---
title: backing up all of your itunes settings
author: mbentley
layout: post
date: 2010-03-25
url: /2010/03/backing-up-all-of-your-itunes-settings/
categories:
  - apple
  - computers
  - iphone
  - technology
tags:
  - apple
  - backup
  - itunes
  - settings
  - windows 7
  - windows vista
  - windows xp

---
![iTunes](/wp-content/uploads/2010/03/itunes-06-2.gif)

i've seen tons of posts around the internet regarding backing up itunes. most of them seem to focus on backing up your itunes library. while this is great, it doesn't cover everything you probably want to back up when doing something like a complete reinstall of windows. if you only back up your library, you will lose your settings as well as your playlists. if you are like me, you have your music stored on a central server somewhere so backing up your music on your local computer is pointless anyway.

with that being said, there are a couple folders that you should back up if you want to keep your itunes settings intact when doing a full reinstall or migration to a new computer. before you do a backup, i would suggest [deauthorizing][1] your computer from the itunes store. this will prevent you from running out of the max of 5 authorizations and having to call apple support to have to clear one for you. once you have deauthorized, make sure you close itunes. next, you will need to find three folders:

Windows XP:
```
%HOMEPATH%\My Documents\My Music\iTunes
%HOMEPATH%\Application Data\Apple Computer
%HOMEPATH%\Local Settings\Application Data\Apple Computer
```

Windows Vista/7:
```
%HOMEPATH%\Music\iTunes
%HOMEPATH%\Application Data\Apple Computer
%HOMEPATH%\Local Settings\Application Data\Apple Computer
```

note: `%HOMEPATH%` is equivilant to `c:\Documents and Settings\<username>` (WinXP) or `c:\Users\<username>` (Vista/7)

![iTunes Backup 1](/wp-content/uploads/2010/03/itunes_backup_1.jpg)

![iTunes Backup 2](/wp-content/uploads/2010/03/itunes_backup_2.jpg)

![iTunes Backup 3](/wp-content/uploads/2010/03/itunes_backup_3.jpg)

simply store those folders somewhere safe such as an external hard drive or usb thumb drive. when you install itunes, make sure to start it up for a first time then close it. this will create the directories which you will want to restore the files to. simply copy the folders back to their proper locations, overwriting the existing contents that were created when you started itunes for the first time. next, open itunes and it should appear just as it was before. reauthorize your computer and you are ready to go.

 [1]: http://support.apple.com/kb/ht1420
