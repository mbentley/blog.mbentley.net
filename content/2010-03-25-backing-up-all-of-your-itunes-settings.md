---
title: backing up all of your itunes settings
author: mbentley
layout: post
date: 2010-03-25
url: /2010/03/backing-up-all-of-your-itunes-settings/
shorturl:
  - http://tinyurl.com/49bfgsp
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
<a href="/wp-content/uploads/2010/03/itunes-06-2.gif" class="smoothbox" rel="lightbox[267]"><img src="/wp-content/uploads/2010/03/itunes-06-2-300x213.gif" alt="" title="itunes" width="300" height="213" class="alignright size-medium wp-image-299" srcset="/wp-content/uploads/2010/03/itunes-06-2-300x213.gif 300w, /wp-content/uploads/2010/03/itunes-06-2.gif 600w" sizes="(max-width: 300px) 100vw, 300px" /></a>

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

note: %HOMEPATH% is equivilant to `c:\Documents and Settings\<username>` (WinXP) or `c:\Users\<username>` (Vista/7)

<table width="100%" border="0">
  <tr>
    <td align="center">
      <a href="/wp-content/uploads/2010/03/itunes_backup_1.jpg" class="smoothbox" rel="lightbox[267]"><img src="/wp-content/uploads/2010/03/itunes_backup_1-300x225.jpg" alt="" title="itunes_backup_1" width="300" height="225" class="alignnone size-medium wp-image-286" srcset="/wp-content/uploads/2010/03/itunes_backup_1-300x225.jpg 300w, /wp-content/uploads/2010/03/itunes_backup_1.jpg 800w" sizes="(max-width: 300px) 100vw, 300px" /></a><br />first folder (winxp)
    </td>

    <td align="center">
      <a href="/wp-content/uploads/2010/03/itunes_backup_2.jpg" class="smoothbox" rel="lightbox[267]"><img src="/wp-content/uploads/2010/03/itunes_backup_2-300x225.jpg" alt="" title="itunes_backup_2" width="300" height="225" class="alignnone size-medium wp-image-287" srcset="/wp-content/uploads/2010/03/itunes_backup_2-300x225.jpg 300w, /wp-content/uploads/2010/03/itunes_backup_2.jpg 800w" sizes="(max-width: 300px) 100vw, 300px" /></a><br />second folder (winxp)
    </td>
  </tr>
  <tr>
    <td align="center" colspan="2">
      <a href="/wp-content/uploads/2010/03/itunes_backup_3.jpg" class="smoothbox" rel="lightbox[267]"><img src="/wp-content/uploads/2010/03/itunes_backup_3-300x225.jpg" alt="" title="itunes_backup_3" width="300" height="225" class="alignnone size-medium wp-image-288" srcset="/wp-content/uploads/2010/03/itunes_backup_3-300x225.jpg 300w, /wp-content/uploads/2010/03/itunes_backup_3.jpg 800w" sizes="(max-width: 300px) 100vw, 300px" /></a><br />third folder (winxp)
    </td>
  </tr>
</table>

simply store those folders somewhere safe such as an external hard drive or usb thumb drive. when you install itunes, make sure to start it up for a first time then close it. this will create the directories which you will want to restore the files to. simply copy the folders back to their proper locations, overwriting the existing contents that were created when you started itunes for the first time. next, open itunes and it should appear just as it was before. reauthorize your computer and you are ready to go.

<!-- Social Bookmarks BEGIN -->

<p class="postcats">
  Share this post:<br /><a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://del.icio.us/post?url=http://tinyurl.com/49bfgsp&title=backing+up+all+of+your+itunes+settings" rel="nofollow" title="Share on Del.icio.us"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/delicious.png" title="Share on Del.icio.us" alt="Share on Del.icio.us" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.facebook.com/sharer.php?u=http://tinyurl.com/49bfgsp" rel="nofollow" title="Share on Facebook"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/facebook.png" title="Share on Facebook" alt="Share on Facebook" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.linkedin.com/shareArticle?mini=true&url=http://tinyurl.com/49bfgsp&title=backing+up+all+of+your+itunes+settings" rel="nofollow" title="Share on LinkedIn"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/linkedin.png" title="Share on LinkedIn" alt="Share on LinkedIn" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://reddit.com/submit?url=http://tinyurl.com/49bfgsp&title=backing+up+all+of+your+itunes+settings" rel="nofollow" title="Share on reddit"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/reddit.png" title="Share on reddit" alt="Share on reddit" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.stumbleupon.com/submit?url=http://tinyurl.com/49bfgsp&title=backing+up+all+of+your+itunes+settings" rel="nofollow" title="Share on Stumble Upon"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/stumbleupon.png" title="Share on Stumble Upon" alt="Share on Stumble Upon" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.technorati.com/faves?add=http://tinyurl.com/49bfgsp" rel="nofollow" title="Share on Technorati"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/technorati.png" title="Share on Technorati" alt="Share on Technorati" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://twitter.com/home/?status=backing+up+all+of+your+itunes+settings+@+http://tinyurl.com/49bfgsp" rel="nofollow" title="Share on Twitter"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/twitter.png" title="Share on Twitter" alt="Share on Twitter" /></a> <br />
</p>

<!-- Social Bookmarks END -->

 [1]: http://support.apple.com/kb/ht1420
