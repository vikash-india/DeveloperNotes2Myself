# Description: Apache Cheatsheet

### Note
* Also check [Apache mod_access cheatsheet](P003_apache_cheatsheet_mod_access.md)
* Also check [Apache .htaccess cheatsheet](P004_apache_cheatsheet_htaccess.md)

### Install, Upgrade or Uninstall Apache
```
sudo apt update
sudo apt install apache2                # Install Apache

sudo apt update                         # Upgrade Apache
sudo apt upgrade apache2

sudo apt remove apache2                 # Uninstall Apache
```

### Get Help
```
apachectl                               # Show usage (short help)
apachectl -h                            # Show help
```

### Important Configuration Files
```
ls -lh /usr/lib/apache2/modules/        # List Available Modules
ls -lh /etc/apache2/mods-available/     # List Available Modules
ls -lh /etc/apache2/mods-enabled/       # List Enabled Modules
ls -lh /var/www/html                    # Apache2 Default Web root
ls -lh /var/www/                        # Other Website Web root
less /etc/apache2/apache2.conf          # Apache2 Main Configuration File
less /etc/apache2/ports.conf            # Apache2 Ports Configuration File
less /var/log/apache2/error.log         # Apache2 Error Log File
less /var/log/apache2/access.log        # Apache2 Access Log File
```

### Manage Apache Service
* Apache is configured on Ubuntu to automatically restart itself each time the server reboots.
```
# Using service command
sudo service apache2 start              # Start the Apache2 Service
sudo service apache2 stop               # Stop the Apache2 Service
sudo service apache2 restart            # Stop the Apache2 Service

# Using Systemctl
systemctl start apache2                 # Start the Apache2 Service
systemctl stop apache2                  # Stop the Apache2 Service
systemctl restart apache2               # Restart the Apache2 Service
systemctl reload apache2                # Reload the Apache2 Service
systemctl status apache2                # Check status of the Apache2 Service
systemctl enable apache2                # Enable the Apache2 Service
```

### Enable Virtual Host Files
* The example.com.conf should exist in /etc/apache2/site-available.
* The commands a2ensite and a2dissite creates symbolic link from sites-available to site-enabled
* The reload command instructs the application to reload its configuration files.
```
# Enable site
sudo a2ensite example.com.conf          # Enable a New Website
sudo a2ensite example.com               # Same as above but without the .conf part

# Disable site
sudo a2dissite example.com.conf         # Disable a Website
sudo a2dissite example.com              # Same as above but without the .conf part

sudo service apache2 reload             # Reload its configuration files
```

### Check Apache Version Details or Compilations Details
```
apache2 -v                              # Check apache version
apache2 -V                              # Check Apache Compile Settings
```

### Find Syntax Errors in Apache Configuration File
```
apachectl configtest                    # Find Syntax Errors in Apache Configuration File
apachectl -t                            # Short alternative to above commands
apache2ctl configtest                   # Same as above. apachectl is a symlink to apache2ctl
apache2ctl -t                           # Corresponding short alternative to above commands

# All above commands should output the following
Syntax OK
```

### Find Errors in Apache Virtual Host Definitions
```
apachectl -S                            # Find Errors in Apache Virtual Host Definitions
apache2ctl -S                           # Same as above. apachectl is a symlink to apache2ctl
```

### Enable/Disable Apache2 Modules
```
sudo a2enmod [Module]                   # Enable a New Module
sudo a2dismod [Module]                  # Disable a Module

sudo systemctl reload apache2           # Reload the Apache service to make the transition effect.
```

### Verify the Loaded Modules
```
apachectl -M                            # Verify the loaded modules
apache2ctl -M                           # Same as above

a2query -m                              # Gives slightly different output
```

### Check Apache Concurrent Connections
```
ss -ant | grep :80 | wc -l              # Check Apache Concurrent Connections
netstat -ant | grep :80 | wc -l         # Same as above
```
