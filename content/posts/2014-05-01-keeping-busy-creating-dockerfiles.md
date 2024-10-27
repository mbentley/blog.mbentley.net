---
title: Keeping busy; creating dockerfiles
author: mbentley
layout: post
date: 2014-05-01
url: /2014/05/keeping-busy-creating-dockerfiles/
categories:
  - computers
  - docker
  - internet
  - linux
  - technology

---
So I had originally hoped to blog more about new things that I have been working on but I haven't had a ton of free time in the past few months. A big reason for that is that I've been working with so many different and new technologies that I find myself spending a great deal more time just learning new things. One of those things has been [Docker][1]. If you are not familiar with Docker, I'd suggest at least looking into it and understanding how it works. At a high level, it basically takes your typical Linux processes and runs them inside of a container.

While that may not sound impressive, it's the numerous applications of these containers that I've found to be so useful. The great part is that creating your own dockerfiles is a simple process. If you can install software on a regular machine or VM, you can create dockerfiles. Not only are dockerfiles simple to understand, the way that the community has been structured, it provides a great opportunity for sharing. I, personally, have all of my dockerfiles [shared in a github repo][2] and all of my docker images are built as [trusted builds][3].

Trusted builds are linked to a github repo and built by Docker. A great feature of the trusted builds is that you are able to see the source of the trusted build on github as they link you right to the repo from which the docker image was created from. I've used that countless times to find helpful tidbits of information that have helped by develop my own dockerfiles.

Being able to harness the power of Docker has been great, especially when it comes to using Docker in development and testing phases of application development. While I am currently not doing much in the way of development, supporting the development process has been simplified from an operations perspective. While some of the developers I have worked with have resisted to using a development environment, as the applications become more complex, they have started to see how useful Docker has become, especially when coupled with [Vagrant][4] to spin up a consistent development and test environment.

We'll see if I can write more than once a quarter about what I have been working on but I suppose I can't really complain as being busy is certainly good for business!

 [1]: https://www.docker.io/
 [2]: https://github.com/mbentley/dockerfiles
 [3]: https://index.docker.io/u/mbentley/
 [4]: http://www.vagrantup.com/
