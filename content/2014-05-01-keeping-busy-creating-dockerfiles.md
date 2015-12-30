---
title: Keeping busy; creating dockerfiles
author: mbentley
layout: post
date: 2014-05-01
url: /2014/05/keeping-busy-creating-dockerfiles/
shorturl:
  - http://tinyurl.com/lfjax4t
categories:
  - computers
  - docker
  - internet
  - linux
  - technology

---
So I had originally hoped to blog more about new things that I have been working on but I haven't had a ton of free time in the past few months. A big reason for that is that I've been working with so many different and new technologies that I find myself spending a great deal more time just learning new things. One of those things has been <a href="https://www.docker.io/" title="Docker" target="_blank">Docker</a>. If you are not familiar with Docker, I'd suggest at least looking into it and understanding how it works. At a high level, it basically takes your typical Linux processes and runs them inside of a container.

While that may not sound impressive, it's the numerous applications of these containers that I've found to be so useful. The great part is that creating your own dockerfiles is a simple process. If you can install software on a regular machine or VM, you can create dockerfiles. Not only are dockerfiles simple to understand, the way that the community has been structured, it provides a great opportunity for sharing. I, personally, have all of my dockerfiles <a href="https://github.com/mbentley/dockerfiles" target="_blank">shared in a github repo</a> and all of my docker images are built as <a href="https://index.docker.io/u/mbentley/" target="_blank">trusted builds</a>.

Trusted builds are linked to a github repo and built by Docker. A great feature of the trusted builds is that you are able to see the source of the trusted build on github as they link you right to the repo from which the docker image was created from. I've used that countless times to find helpful tidbits of information that have helped by develop my own dockerfiles.

Being able to harness the power of Docker has been great, especially when it comes to using Docker in development and testing phases of application development. While I am currently not doing much in the way of development, supporting the development process has been simplified from an operations perspective. While some of the developers I have worked with have resisted to using a development environment, as the applications become more complex, they have started to see how useful Docker has become, especially when coupled with <a href="http://www.vagrantup.com/" target="_blank">Vagrant</a> to spin up a consistent development and test environment.

We'll see if I can write more than once a quarter about what I have been working on but I suppose I can't really complain as being busy is certainly good for business!

<!-- Social Bookmarks BEGIN -->

<p class="postcats">
  Share this post:<br /><a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://del.icio.us/post?url=http://tinyurl.com/lfjax4t&title=Keeping+busy%3B+creating+dockerfiles" rel="nofollow" title="Share on Del.icio.us"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/delicious.png" title="Share on Del.icio.us" alt="Share on Del.icio.us" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.facebook.com/sharer.php?u=http://tinyurl.com/lfjax4t" rel="nofollow" title="Share on Facebook"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/facebook.png" title="Share on Facebook" alt="Share on Facebook" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.linkedin.com/shareArticle?mini=true&url=http://tinyurl.com/lfjax4t&title=Keeping+busy%3B+creating+dockerfiles" rel="nofollow" title="Share on LinkedIn"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/linkedin.png" title="Share on LinkedIn" alt="Share on LinkedIn" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://reddit.com/submit?url=http://tinyurl.com/lfjax4t&title=Keeping+busy%3B+creating+dockerfiles" rel="nofollow" title="Share on reddit"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/reddit.png" title="Share on reddit" alt="Share on reddit" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.stumbleupon.com/submit?url=http://tinyurl.com/lfjax4t&title=Keeping+busy%3B+creating+dockerfiles" rel="nofollow" title="Share on Stumble Upon"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/stumbleupon.png" title="Share on Stumble Upon" alt="Share on Stumble Upon" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://www.technorati.com/faves?add=http://tinyurl.com/lfjax4t" rel="nofollow" title="Share on Technorati"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/technorati.png" title="Share on Technorati" alt="Share on Technorati" /></a> <a onclick="window.open(this.href, '_blank', 'scrollbars=yes,menubar=no,height=600,width=750,resizable=yes,toolbar=no,location=no,status=no'); return false;" href="http://twitter.com/home/?status=Keeping+busy%3B+creating+dockerfiles+@+http://tinyurl.com/lfjax4t" rel="nofollow" title="Share on Twitter"><img class="social_img" src="/wp-content/plugins/social-bookmarks/images/twitter.png" title="Share on Twitter" alt="Share on Twitter" /></a> <br />
</p>

<!-- Social Bookmarks END -->
