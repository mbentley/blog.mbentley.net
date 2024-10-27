---
title: using nginx to host a keepass database over https (webdav)
author: mbentley
layout: post
date: 2013-09-05
url: /2013/09/using-nginx-to-host-a-keepass-database-over-https-webdav/
categories:
  - computers
  - internet
  - linux
  - technology
tags:
  - cert
  - certificate
  - debian
  - free
  - http
  - https
  - kdbx
  - keepass
  - linux
  - nginx
  - ngx_http_dav_module
  - ssl
  - startssl
  - URL
  - webdav

---
Recently, I came across the need to be able to store a KeePass database where it could be accessed from multiple locations, including one in specific that was locked down quite securely with the exception of HTTP/HTTPS. In a previous method, I simply used a cloud storage solution (in this case, Dropbox) to synchronize the database between systems. I came to the realization that this would potentially leave a copy of the KeePass database anywhere the Dropbox account was synchronized. While I wouldn't be all that worried since KeePass requires a password, it certainly didn't give me any comfort.

I knew that there were quite a number of plugins available for KeePass so I went out to take a look options I had. I found a few that would work but I also came across the native ability to open a database over HTTP, HTTPS or FTP. I had no clue that was an option. So I tossed a test .kdbx file on my nginx web server and I was able to open it just fine. Saving obviously did not work out of the box but I figured I could use the module [`ngx_http_dav_module`][1] to take care of the saving and writing back on the web server. You might want to note that if you compile nginx from source yourself that you will need to include this module as it is not included as a default. Most packages shipped through a distribution should have this included.

Also, you will see that I use SSL to secure the communication between my server and client. I actually get my SSL certificates from [StartSSL][2] for free. They offer free Class 1 SSL certificates for private use with no strings attached. It's a pretty sweet deal if you ask me. You might want to check them out if you are using self-signed certificates and would rather not get certificate errors. I would certainly suggest that if you are just thinking about using HTTP for this setup, at least use a self-signed certificate.

So after playing around for a little bit, I was able to make a basic nginx configuration for a dedicated site that worked great:

    server {
      listen 80;
      server_name [sitename];
      access_log off;

      # redirect to HTTPS
      return 302 https://$http_host$request_uri;
    }

    server {
      listen 443 ssl;
      server_name [sitename];
      access_log /var/log/nginx/[sitename].access.log;
      root /var/www/[sitename];

      ssl_certificate_key /etc/nginx/ssl/[sitename].key;
      ssl_certificate /etc/nginx/ssl/[sitename].cer;
      include /etc/nginx/ssl.conf;

      location / {
        # add authentication to the site
        auth_basic "[sitename]";
        auth_basic_user_file "/etc/nginx/htpasswd";

        # add WebDAV methods & new file access permissions
        dav_methods PUT DELETE MOVE;
        dav_access group:rw all:r;
      }
    }

Drop a KeePass database in the root and as long as www-data (or whatever user your nginx process runs as) has proper access to the files, you can access the database as if it was stored locally. Just add it to KeePass using the **File** > **Open** > **Open URL** menu. If multiple users make changes at the same time, KeePass will even synchronize and merge the changes. So far, it's worked out quite well for me.

\*Edit (09-Sep-2013): I added a section above about where I get my SSL certificates from. Check them out as they give them away for free with no strings attached.

 [1]: http://nginx.org/en/docs/http/ngx_http_dav_module.html
 [2]: https://www.startssl.com/
