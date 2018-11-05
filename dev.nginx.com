# FILE LOCATION: /etc/nginx/sites-available/dev.nginx.com
# Make sure to create a symlink of this file 
# in /etc/nginx/sites-enabled/ in order for it to work properly with NGINX

server {
  # Modify if you want it to listen on different port
  # By default it always listens on port 80
  listen   3200;
  listen   [::]:3200 default_server;
  # Declare where the NGINX should look for the root of the website
  root /var/www/dev.nginx.irokez;
  # What kind of files should it look for in the root
  index index.html index.htm index.php;
  server_name dev.nginx.irokez;
  # Look in the root, if nothing found, generate 404
  location / {
    try_files $uri $uri/ =404;
  }
  # Enable PHP
  location ~ \.php$ { 
    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    # Can also be 127.0.0.1:9000
    fastcgi_pass unix:/run/php/php5.6-fpm.sock;
    fastcgi_index index.php;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    include /etc/nginx/fastcgi.conf;
  }

}

# SIDE NOTE:
# This is configuration for a website that uses straightforward PHP, not Symfony
