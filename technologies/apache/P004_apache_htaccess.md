# Description: Understanding .htaccess

### Introduction
* The .htaccess file in Apache is a tool that allows configurations at the directory and subdirectory level. 
* Using .htaccess one can configure website permissions without altering server configuration files.
* Unlike the main server configuration files like apache2.conf, the .htaccess files are read on every request. Therefore 
  changes in these files take immediate effect. 
* Apache searches all directories and subdirectories that are htaccess-enabled for an .htaccess file which results in 
  performance loss due to file accesses. But performance loss is rarely observed. 
* If one has access to the main server configuration file, one should of course use that instead. 
* Htaccess files follow the same syntax as the main Apache configuration files.
* The .htaccess is also known as per-directory context config.


### Test if `.htaccess` is enabled and working
* Create/Edit the .htaccess file and add the following content and save it in the virtual directory for the host 
  `example.local`.
```
# Set the default handler
DirectoryIndex index.php index.html index.htm
```
* Create/Edit the file `index.php` and add the following content
```
<h1 style="text-align:center">Page index.php</h1>

<?php phpinfo(); ?>
```
* Ensure that a file `index.html` exists with some HTML content. 
```
<h1 style="text-align:center">Page index.html</h1>
```
* Use any browser to visit `http://example.local/` (without adding `index.html` or `index.php`) and check if it opens 
  `index.php` instead of `index.html`. This means .htaccess is enabled.

### Enable .htaccess in Apache
* Requirements for .htaccess to work
    - Place .htaccess file under home directory of a virtual host.
    - Ensure Apache does NOT ignore .htaccess altogether due to configurations like `AllowOverride none` in virtual 
      host configuration file or apache configuration file.
* Ensure `index.php` and `index.html` is created as mentioned above.
* Check virtual host configuration and add/edit `AllowOverride none` to `AllowOverride All`. Example
```
<Directory /var/www/sites/example.com/>
    Options -Indexes +FollowSymLinks
    AllowOverride All
    Require all granted
</Directory>
```
* Restart apache webserver.
* Use any browser to visit `http://example.local/` (without adding `index.html` or `index.php`) and check if it opens 
  `index.php` instead of `index.html`. This means .htaccess is now enabled.

### Enable .htpasswd for .htaccess
* Create a password file
    - Create a password file at some secure location. For simplicity, it can be created under .htpasswd in the same 
      directory as .htaccess.
    - Use `htpasswd` command line tool to generate password file. Example: `htpasswd -c /home/secure/.htpasswd dilbert`
    - Alternatively use htpasswd generator [online](https://hostingcanada.org/htpasswd-generator/) and save it in 
      .htpasswd file.
    ```
    # Create .htpasswd with the below content for user dilbert and password 12345 and save it.
    # The format is user:passwordHash for a user:password 
    gvim .htpasswd
    
    dilbert:{SHA}jLIjfQZ5yojbZGTqxg2pY0VROWQ=
    ```
* Enable authentication in .htaccess
```
# This sets the location for your .htpasswd file.
AuthUserFile /home/secure/.htpasswd

# When not using a group, comment this line
# AuthGroupFile /dev/null

# This is the prompt to the user. This can be  rephrase if needed.
AuthName "Please Enter Password"

# Type of authentication
AuthType Basic

# Allows any one of several authorized people to log on. This can be changed to
# Require user new_user to restrict access only to someone with the username
# new_user.
Require valid-user
# Require user dilbert
```
* Now try accessing any page under this virtual host, it should prompt for the password.

### Examples
* Allow Certain IP Addresses
```
order deny, allow
Deny from all
Allow from 192.168.0.54
Allow from 192.168.0
```

* Block Certain IP Addresses
```
# Change in order
order allow, deny
Allow from all
deny from 192.168.0.54
deny from 192.168.0.55

# Leave off the final digit to block all IP addresses in the 0 – 255 range.
deny from 192.168.0
```

* Let me access without a password, let my client access the page WITH a password and google crawl the page.
```
AuthName "Under Development"
AuthUserFile .htpasswd
AuthType basic

Order deny,allow
Deny from all
Allow from 192.168.1.55 client.com googlebot.com
Satisfy Any
```
