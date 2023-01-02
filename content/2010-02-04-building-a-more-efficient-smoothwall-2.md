---
title: building a more efficient smoothwall
author: mbentley
layout: post
date: 2010-02-04
url: /2010/02/building-a-more-efficient-smoothwall-2/
categories:
  - computers
  - new gadgets
  - technology
tags:
  - computer
  - conservation
  - efficient
  - energy
  - green
  - linux
  - net4801
  - new
  - smoothwall
  - soekris
  - techology

---
i've decided to look more into power efficiency of my computers at home. while my power bill isn't horrible, it could most definitely be lower. there are only a few computers that i leave running 24/7. one of them is my [smoothwall][1]. while i built that computer with power efficiency in mind, i didn't take things to the extreme that i could have. now i want to build a solution that is closer in power consumption to your typical home router appliance. after doing some research, i found a solution that would not only be power efficient but also cost effective. the solution is the [soekris engineering net4801][2].

![soekris engineering net4801](/wp-content/uploads/2010/02/net4801_60_BO_front_big.jpg)

this is basically a 586 class pc that runs headless and uses a serial console for access. i thought about buying one directly from the manufacturer but then i saw the prices and they seemed more expensive (new units start at $213.00) than i wanted for such a small project. luckily i was able to find a used unit that i bought on ebay for $96. not only did this cost less than half of the price of a new unit, but it was a \*-60 model instead of the \*-40 they are selling now (266 mhz proc vs 233 mhz, 256mb of ram vs 128mb).

along with the unit itself, i purchased a 2.5" hdd mounting kit since i didn't want to go with a compactflash solution and i already have an extra 2.5" ide hdd. hopefully i should receive everything sometime next week. i haven't used any devices that use a serial console since i worked with cisco appliances in college but i ran a trial run of how i would install everything in vmware and it seemed to go easy enough. i'll do a more detailed breakdown of how to install an os on a unit that is headless and has no optical drive for installation once i have everything on hand.

 [1]: http://www.smoothwall.org
 [2]: http://www.soekris.com/net4801.htm
