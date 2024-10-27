---
title: 'iPhone iOS 4 & 5 upgrade – restore lost pictures in camera roll'
author: mbentley
layout: post
date: 2010-06-23
url: /2010/06/iphone-ios-4-upgrade-restore-lost-pictures-in-camera-roll/
categories:
  - apple
  - computers
  - iphone
  - technology
tags:
  - 3g
  - 3gs
  - 4
  - 4s
  - apple
  - backup
  - camera empty
  - camera roll
  - failed
  - firmware
  - fix
  - iOS 4
  - iOS4
  - iphone
  - iphone 3g
  - iphone 3gs
  - iphone 4
  - iphone 4s
  - iphone os 4
  - itunes
  - linux
  - lost pictures
  - lost video
  - mac osx
  - missing
  - missing pictures
  - no pictures
  - no pictures or videos
  - osx
  - photos
  - problem
  - restore
  - update
  - upgrade
  - windows

---
**update 10/21/2011** - it appears that this bug has come up again with a number of people who have updated to iOS 5. luckily, the solution is the same as before. i have updated the instructions to help with any changes that iOS 5 added.

**before you start** - this will only work if your photos actually exist on your device but do not show up in in the camera roll. you can verify that photos exist on your device by looking [graph at the bottom of iTunes](/wp-content/uploads/2010/06/iTunes_graph.png) and by [checking your device][1] for the actual picture files. if you post comments about having problems but don't mention that you haven't verified that your photos are still available on your device, i'm sorry but i won't be able to help you.

so i decided to upgrade to the new iOS 4 on my iphone 3gs to see what it is all about. everything went smoothly. i installed itunes 9.2, downloaded the new firmware, asked my phone to do a restore using the new firmware and then had it restore my latest backup of info. everything seemed perfect after syncing with itunes but then i went into my camera roll and noticed i had no pictures! in itunes, it showed over 1 GB worth of pictures so why were they not showing up? i searched online for a little while i didn't really come up with much at first. many different solutions: do a backup, sync, reboot, etc but nothing worked. then i came across [this discussion][2] on the apple forums. i have slightly modified the steps. if you use windows or osx, you can download [iphone explorer][3] and follow these steps:

**these steps are out of date.  see below for updated steps.**
```
1.) connect your iphone using the usb cable
2.) launch iphone explorer
3.) backup and then delete the following files:
     /DCIM/.MISC/Info.plist
     /PhotoData/Photos.sqlite
     /PhotoData/PhotosAux.sqlite
4.) reboot your iphone
```

a recent update to iphone explorer may have changed the folder paths. if you don't see the folders mentioned, try the following:
```
1.) connect your iphone using the usb cable
2.) launch iphone explorer
3.) backup and then delete the following files:
     /Media/DCIM/.MISC/Info.plist
     /Media/PhotoData/MISC/DCIM_APPLE.plist
     /Media/PhotoData/Photos.sqlite (or /PhotoData/Photos.sqlite)
     /Media/PhotoData/PhotosAux.sqlite (or /PhotoData/PhotosAux.sqlite)
4.) reboot your iphone
```

note: if you don't have the file PhotosAux.sqlite, that's not a problem. It is a database of the location of where photos were taken which is extracted from the EXIF data of the pictures. i would guess that it is uses by the Places feature in the camera roll.

if your phone is jailbroken and you are in `root` view in iphone explorer, these instructions & file locations should work:
```
1.) connect your iphone using the usb cable
2.) launch iphone explorer
3.) backup and then delete the following files:
     /private/var/mobile/Media/PhotoData/.MISC/Info.plist
     /private/var/mobile/Media/PhotoData/MISC/DCIM_APPLE.plist
     /private/var/mobile/Media/PhotoData/Photos.sqlite
     /private/var/mobile/Media/PhotoData/PhotosAux.sqlite
4.) reboot your iphone
```

if you have linux, you shouldn't need anything as long as you can mount your iphone as a device and delete the files listed above. i used debian (squeeze) to access the files as it automatically mounts my iphone when i plug it in. i just enabled `view hidden files` and i could access the files to delete.

once you have done that, just open your camera roll and it should re-index all of your photos!

\*edit: as Phil has pointed out in the comments, if the file `/DCIM/.MISC/Info.plist` does not exist or if you can't find the folder `/DCIM/.MISC`, just skip past that file and follow the rest of the directions and it should still restore your photos in the camera roll.

*edit: has anyone had this happen with the latest update to iOS 5? i am curious whether or not it is happening again with the latest iOS. if it is, please let me know in the comments. thanks!

 [1]: /2010/06/iphone-ios-4-upgrade-restore-lost-pictures-in-camera-roll/comment-page-6/#comment-5513
 [2]: http://discussions.info.apple.com/thread.jspa?messageID=11734450
 [3]: http://www.macroplant.com/iphoneexplorer/
