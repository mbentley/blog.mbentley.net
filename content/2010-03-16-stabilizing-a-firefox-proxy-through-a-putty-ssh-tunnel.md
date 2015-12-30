---
title: stabilizing a firefox proxy through a putty ssh tunnel
author: mbentley
layout: post
date: 2010-03-16
url: /2010/03/stabilizing-a-firefox-proxy-through-a-putty-ssh-tunnel/
shorturl:
  - http://tinyurl.com/4v3e66c
categories:
  - computers
  - internet
  - technology
tags:
  - connection abort
  - crash
  - firefox
  - network error
  - proxy
  - putty
  - ssh
  - tunnel
  - unstable

---
<table border="0">
  <tr>
    <td valign="top">
      when i am at work, i use a ssh tunnel when i need to bypass the proxy server. this works great except for when i visit certain sites with a large number of big images. one site would be <a href="http://www.boston.com/bigpicture/">boston.com - the big picture</a>. it has a large number of high quality images and the ssh tunnel just doesn't seem to be able to handle the traffic. when the number of http requests overloads the ssh tunnel and then i get the message 'network error: software caused connection abort' as seen to the right.
    </td>

    <td>
      <a href="/wp-content/uploads/2010/03/ssh_tunnel_1.png" class="smoothbox" rel="lightbox[225]"><img src="/wp-content/uploads/2010/03/ssh_tunnel_1.png" alt="network error: software caused connection abort" title="network error: software caused connection abort" width="314" height="119" class="alignnone size-full wp-image-226" /></a>
    </td>
  </tr>
</table>

in order to prevent this from happening, i found a setting in firefox that can control the number of http connections being made at once. actually, there are two settings that i have tweaked in order to find a limit which seems to work well. in firefox, navigate to 'about:config'. from there, just type in 'max-connections'. you will now see two entries. they are 'network.http.max-connections' and 'network.http.max-connections-per-server'. in my case, i changed them to 10 and 4 respectively, after doing some testing. see below for examples. while this probably slows web browsing, it keeps the number of http connections low enough for the ssh tunnel to keep up with the requests. i'd much rather have a slightly slower connection than to have to reconnect my ssh tunnel constantly.

<table border="0" width="100%">
  <tr>
    <td align="center">
      <a href="/wp-content/uploads/2010/03/ssh_tunnel_2.png" class="smoothbox" rel="lightbox[225]"><img src="/wp-content/uploads/2010/03/ssh_tunnel_2-300x153.png" alt="" title="ssh_tunnel_2" width="300" height="153" class="alignnone size-medium wp-image-227" srcset="/wp-content/uploads/2010/03/ssh_tunnel_2-300x153.png 300w, /wp-content/uploads/2010/03/ssh_tunnel_2.png 555w" sizes="(max-width: 300px) 100vw, 300px" /></a>
    </td>

    <td align="center">
      <a href="/wp-content/uploads/2010/03/ssh_tunnel_3.png" class="smoothbox" rel="lightbox[225]"><img src="/wp-content/uploads/2010/03/ssh_tunnel_3-300x153.png" alt="" title="ssh_tunnel_3" width="300" height="153" class="alignnone size-medium wp-image-228" srcset="/wp-content/uploads/2010/03/ssh_tunnel_3-300x153.png 300w, /wp-content/uploads/2010/03/ssh_tunnel_3.png 555w" sizes="(max-width: 300px) 100vw, 300px" /></a>
    </td>
  </tr>
</table>

feel free to comment if you have any questions or problems.

<!-- Social Bookmarks BEGIN -->

<p class="postcats">
  Share this post:<br /><a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://del.icio.us/post?url=http://tinyurl.com/4v3e66c&title=stabilizing+a+firefox+proxy+through+a+putty+ssh+tunnel" rel="nofollow" title="Share on Del.icio.us"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/delicious.png" title="Share on Del.icio.us" alt="Share on Del.icio.us" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.facebook.com/sharer.php?u=http://tinyurl.com/4v3e66c" rel="nofollow" title="Share on Facebook"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/facebook.png" title="Share on Facebook" alt="Share on Facebook" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.linkedin.com/shareArticle?mini=true&url=http://tinyurl.com/4v3e66c&title=stabilizing+a+firefox+proxy+through+a+putty+ssh+tunnel" rel="nofollow" title="Share on LinkedIn"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/linkedin.png" title="Share on LinkedIn" alt="Share on LinkedIn" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://reddit.com/submit?url=http://tinyurl.com/4v3e66c&title=stabilizing+a+firefox+proxy+through+a+putty+ssh+tunnel" rel="nofollow" title="Share on reddit"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/reddit.png" title="Share on reddit" alt="Share on reddit" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.stumbleupon.com/submit?url=http://tinyurl.com/4v3e66c&title=stabilizing+a+firefox+proxy+through+a+putty+ssh+tunnel" rel="nofollow" title="Share on Stumble Upon"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/stumbleupon.png" title="Share on Stumble Upon" alt="Share on Stumble Upon" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.technorati.com/faves?add=http://tinyurl.com/4v3e66c" rel="nofollow" title="Share on Technorati"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/technorati.png" title="Share on Technorati" alt="Share on Technorati" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://twitter.com/home/?status=stabilizing+a+firefox+proxy+through+a+putty+ssh+tunnel+@+http://tinyurl.com/4v3e66c" rel="nofollow" title="Share on Twitter"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/twitter.png" title="Share on Twitter" alt="Share on Twitter" /></a> <br />
</p>

<!-- Social Bookmarks END -->
