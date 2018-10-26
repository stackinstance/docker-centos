# docker-centos

When your developing (for example) in Symfony2 and want to use Docker for development, you can use this package to include Docker into your (Symfony2) project. This package will include a Docker instance with Centos 7 installed with php 7.2 + apache2 and the latest MariaDB.
Just follow the installation steps and your done. 

## Installation steps:
Step 1: run command: 
```
composer require stackinstance/docker-centos:dev-master --dev
```

Step 2: run the following command in your project root: 
```
vendor/stackinstance/docker-centos/install.sh
```

Step 3: Open /project.cfg and change myproject to your own projectname. Be aware that the projectname may not contain any special characters underscores or spaces!
```
PROJECTNAME=myproject
```

Step 4: Add additional bash code to run when the docker image is build:
```
Open /extra.sh and add bash code
```

Step 5: Open docker terminal and the following command in your project root: 
```
bash docker/tools/rebuild.sh
```

Your (local) project **root** will be mapped to the **/var/www** directory on the Docker instance. The **web root** folder is mapped to the (local) **web** directory in your project.

## PHP 5.6
If you want to use php 5.6 instead of php 7.2, you need to use version 3.2.0. This version also uses MySQL instead of MariaDB:
```
composer require stackinstance/docker-centos:3.2.0 
```

## Website
- http://www.stackinstance.com
- http://www.raymondkootstra.nl
