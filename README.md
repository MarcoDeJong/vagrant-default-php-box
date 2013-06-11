PHP Development box
=======================
*This virtualbox will run Symfony2, Joomla, Wordpress and Drupal.*

Prologue
I really got fed up with tools like MAMP and WAMP. They never installed -exactly- the same way on my Windows and Mac development machines. As alternative I could go into the commandline and use tools like Homebrew or MacPorts to configure PHP, Apache and MySQL locally myself. However these solutions were not optimal as well, because my harddrives ran over with programs I seldomly used. Above all, as soon as I changed machines (or reinstalled OS), I had to all start over. Grumble.

What is this box?
For me this is a replacement for MAMP and WAMP that I can use as starting point on any project I am currently working. Editing code can be done on your local machine in your editor of choice. It is not a perfect duplicate of my production environment as is, but it does the job. By using Vagrant, Virtualbox and Puppet it is -very- relatively easy to add or delete packages within the box. In a perfect world your virtualbox is a 'clone' of your production environment. So, have fun adjusting ;)

Current configuration
This box installs:
- Ubuntu 12.04 LTS precise 64
- Apache 2.2.22
- PHP 5.3.10
- MySQL 5.5.31
- PHPMyAdmin 
- Sass and Compass.

Requirements
- Virtualbox https://www.virtualbox.org/
- Vagrant http://www.vagrantup.com/
- Git https://help.github.com/articles/set-up-git

Installation
- Make sure you meet the requirements
- git clone this repository (or fork and clone)
- 

First steps
- Go to http://10.11.12.13/box to see if your virtualbox is running properly
- Insert your own conten to /www/ (for example Git checkout)

Sidenotes:
Once using ```vagrant up``` or ```vagrant provision``` you might see output, telling ```stdin: is not a tty```. 
There is no need to worry about this notice. This is telling you that the current tty is not interactive.

