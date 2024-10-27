---
title: sync your pidgin logs on multiple computers using dropbox
author: mbentley
layout: post
date: 2013-09-10
url: /2013/09/sync-your-pidgin-logs-on-multiple-computers-using-dropbox/
categories:
  - computers
  - internet
  - technology
  - windows
tags:
  - cloud
  - dropbox
  - logs
  - mklink
  - pidgin
  - shared
  - storage
  - symlink
  - sync
  - synchronize
  - windows
  - windows 7
  - windows 8
  - windows vista
  - windows xp

---
Between work and home, I had four different computers on which I used Pidgin for my instant messaging. When I really enjoy about Pidgin is the ability to log my conversations so I can search back through for information that I was discussion previously, mostly with coworkers. I hated that my logs did not sync between my computers so I figured I would create a basic workaround to allow me to synchronize my logs using Dropbox on all of my Windows machines:

**Note**: This assumes that you already have Pidgin and Dropbox installed and configured.

  1. First of all, shut down Pidgin
  2. Just to be safe, **take a backup of your Pidgin logs**. The directory you want to backup is `C:\Users\<username>\AppData\Roaming\.purple\logs`. Better to be safe than sorry!
  3. Using Windows Explorer, move the folder `C:\Users\<username>\AppData\Roaming\.purple\logs` to the location of your choice on Dropbox (e.g. - `C:\Users\<username>\Dropbox\pidgin_logs`).

   ![Pidgin Logs](/wp-content/uploads/2013/09/pidgin_logs.png)

You should now have a directory called `C:\Users\<username>\Dropbox\pidgin_logs\logs` as seen above.

  4. Open a Command Prompt as an Administrator (right click, run as Administrator)
  5. From the command prompt, change directory to `C:\Users\<username>\AppData\Roaming\.purple\`

    cd C:\Users\Matt\AppData\Roaming\.purple\

  6. Create a symlink from your Dropbox logs to the Pidgin logs folder

    mklink /d logs C:\Users\<username>\Dropbox\pidgin_logs\logs

  7. You should now see the symbolic link in `C:\Users\<username>\AppData\Roaming\.purple`. Here is a screen shot for comparison:

![Pidgin Logs Symlink](/wp-content/uploads/2013/09/pidgin_logs_symlink.png)

You can see the special icon the `logs` folder has now that it is a symbolic link.

  8. For your other computers, repeat the same steps above, making sure to place your logs in the same Dropbox folder and maintain the same directory structure. The way that Pidgin writes logs, you should be able to combine logs from multiple machines without them overwriting each other.

Now that you have all of your computer synchronizing your logs over Dropbox, you can search through them from any machine and they will be identical without any manual synchronization process. Dropbox takes care of all of the work. You should be able to do the same using any other cloud storage provider as well.
