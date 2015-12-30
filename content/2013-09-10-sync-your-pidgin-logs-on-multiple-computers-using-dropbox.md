---
title: sync your pidgin logs on multiple computers using dropbox
author: mbentley
layout: post
date: 2013-09-10
url: /2013/09/sync-your-pidgin-logs-on-multiple-computers-using-dropbox/
shorturl:
  - http://tinyurl.com/ortvek7
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

    <a href="/wp-content/uploads/2013/09/pidgin_logs.png" rel="lightbox[744]"><img class="aligncenter size-full wp-image-745" alt="pidgin_logs" src="/wp-content/uploads/2013/09/pidgin_logs.png" width="740" height="329" srcset="/wp-content/uploads/2013/09/pidgin_logs-300x133.png 300w, /wp-content/uploads/2013/09/pidgin_logs.png 740w" sizes="(max-width: 740px) 100vw, 740px" /></a>You should now have a directory called `C:\Users\<username>\Dropbox\pidgin_logs\logs` as seen above.
  4. Open a Command Prompt as an Administrator (right click, run as Administrator)
  5. From the command prompt, change directory to `C:\Users\<username>\AppData\Roaming\.purple\`
```
cd C:\Users\Matt\AppData\Roaming\.purple\
```

  6. Create a symlink from your Dropbox logs to the Pidgin logs folder
```
mklink /d logs C:\Users\<username>\Dropbox\pidgin_logs\logs
```

  7. You should now see the symbolic link in `C:\Users\<username>\AppData\Roaming\.purple`. Here is a screen shot for comparison:

    <a href="/wp-content/uploads/2013/09/pidgin_logs_symlink.png" rel="lightbox[744]"><img src="/wp-content/uploads/2013/09/pidgin_logs_symlink.png" alt="pidgin_logs_symlink" width="781" height="437" class="aligncenter size-full wp-image-746" /></a> You can see the special icon the 'logs' folder has now that it is a symbolic link.
  8. For your other computers, repeat the same steps above, making sure to place your logs in the same Dropbox folder and maintain the same directory structure. The way that Pidgin writes logs, you should be able to combine logs from multiple machines without them overwriting each other.

Now that you have all of your computer synchronizing your logs over Dropbox, you can search through them from any machine and they will be identical without any manual synchronization process. Dropbox takes care of all of the work. You should be able to do the same using any other cloud storage provider as well.

<!-- Social Bookmarks BEGIN -->

<p class="postcats">
  Share this post:<br /><a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://del.icio.us/post?url=http://tinyurl.com/ortvek7&title=sync+your+pidgin+logs+on+multiple+computers+using+dropbox" rel="nofollow" title="Share on Del.icio.us"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/delicious.png" title="Share on Del.icio.us" alt="Share on Del.icio.us" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.facebook.com/sharer.php?u=http://tinyurl.com/ortvek7" rel="nofollow" title="Share on Facebook"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/facebook.png" title="Share on Facebook" alt="Share on Facebook" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.linkedin.com/shareArticle?mini=true&url=http://tinyurl.com/ortvek7&title=sync+your+pidgin+logs+on+multiple+computers+using+dropbox" rel="nofollow" title="Share on LinkedIn"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/linkedin.png" title="Share on LinkedIn" alt="Share on LinkedIn" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://reddit.com/submit?url=http://tinyurl.com/ortvek7&title=sync+your+pidgin+logs+on+multiple+computers+using+dropbox" rel="nofollow" title="Share on reddit"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/reddit.png" title="Share on reddit" alt="Share on reddit" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.stumbleupon.com/submit?url=http://tinyurl.com/ortvek7&title=sync+your+pidgin+logs+on+multiple+computers+using+dropbox" rel="nofollow" title="Share on Stumble Upon"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/stumbleupon.png" title="Share on Stumble Upon" alt="Share on Stumble Upon" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.technorati.com/faves?add=http://tinyurl.com/ortvek7" rel="nofollow" title="Share on Technorati"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/technorati.png" title="Share on Technorati" alt="Share on Technorati" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://twitter.com/home/?status=sync+your+pidgin+logs+on+multiple+computers+using+dropbox+@+http://tinyurl.com/ortvek7" rel="nofollow" title="Share on Twitter"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/twitter.png" title="Share on Twitter" alt="Share on Twitter" /></a> <br />
</p>

<!-- Social Bookmarks END -->
