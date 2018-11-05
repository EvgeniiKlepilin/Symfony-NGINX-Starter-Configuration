# Symfony+NGINX Starter Configuration
Basic Configuration to get your NGINX Server with Symfony up and running. Files presented are the bare minimum necessary in order to roll out basic Symfony or Core PHP Application.

# *Disclosure*
Some of the code shown in here is taken from [Official Symfony Website](https://symfony.com/doc/3.4/setup/web_server_configuration.html). Code in this repository conatins extra comments on some of those lines in order to clarify or guide a developer better when it comes to proper working set up.

# Prerequisites
In order to start we have to make sure we have following installed:
* [NGINX](https://www.nginx.com/resources/wiki/start/topics/tutorials/install/)
* [PHP](http://www.php.net/)
* [PHP-FPM](https://php-fpm.org/)
* [Composer](https://getcomposer.org/)
* [Symfony Framework](https://symfony.com/)

# Installation
Here is the description of a set up:
* Make sure you set up your [hosts](hosts) file. It is responsible for mapping domain names onto IP addresses.
* Configure your NGINX by modifying or ensuring a proper modification of /etc/nginx/nginx.conf
* Modify a Default file or create a new server in /etc/nginx/sites-available/

# Issues
If you face some kind of problem, make sure to check /var/logs/nginx/error.log and /var/logs/nginx/access.log for reports. For Symfony, look into /var/logs/nginx/project_error.log and /var/logs/nginx/project_access.log.

You can also check some quick feedback using following command:
```
systemctl status nginx
```
