---
title: stabilizing a firefox proxy through a putty ssh tunnel
author: mbentley
layout: post
date: 2010-03-16
url: /2010/03/stabilizing-a-firefox-proxy-through-a-putty-ssh-tunnel/
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
when i am at work, i use a ssh tunnel when i need to bypass the proxy server. this works great except for when i visit certain sites with a large number of big images. one site would be [boston.com - the big picture][1]. it has a large number of high quality images and the ssh tunnel just doesn't seem to be able to handle the traffic. when the number of http requests overloads the ssh tunnel and then i get the message 'network error: software caused connection abort' as seen below.

![network error: software caused connection abort](/wp-content/uploads/2010/03/ssh_tunnel_1.png)

in order to prevent this from happening, i found a setting in firefox that can control the number of http connections being made at once. actually, there are two settings that i have tweaked in order to find a limit which seems to work well. in firefox, navigate to 'about:config'. from there, just type in 'max-connections'. you will now see two entries. they are 'network.http.max-connections' and 'network.http.max-connections-per-server'. in my case, i changed them to 10 and 4 respectively, after doing some testing. see below for examples. while this probably slows web browsing, it keeps the number of http connections low enough for the ssh tunnel to keep up with the requests. i'd much rather have a slightly slower connection than to have to reconnect my ssh tunnel constantly.

![ssh tunnel 2](/wp-content/uploads/2010/03/ssh_tunnel_2.png)

![ssh tunnel 3](/wp-content/uploads/2010/03/ssh_tunnel_3.png)

feel free to comment if you have any questions or problems.

  [1]: http://www.boston.com/bigpicture/
