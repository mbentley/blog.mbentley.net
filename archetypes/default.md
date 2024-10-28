---
title: '{{ replace .File.ContentBaseName `-` ` ` | title }}'
date: '{{ .Date }}'
author: mbentley
layout: post
url: '/YYYY/MM/{{ .File.ContentBaseName }}/'
categories:
  - foo
tags:
  - bar
---
