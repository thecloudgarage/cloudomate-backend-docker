# dockerized backend for cloudomate
* build.sh will create the new docker image (ensure to replace the image name)
* run.sh will run the container with the variables specified for port and container name
* Best to simply docker-compose up -d (image used is mine)

# Accessing the app
* The app is available on 3003
* Ensure a valid script is presented in cloudomate_scripts directory

# Testing
* Sample script (name: apt-install.sh)
* Navigate to the directory and chmod+x apt-install.sh
* Note that the param values should be set matching to the variable name in the POST url
* Also note how the $ variables are all referenced in CAPITAL
```
#!/bin/bash

# -- jojo --
# description: echo text on the command line
# param: packagename - packagename
# -- jojo --

apt-get install $PACKAGENAME -y
echo "$PACKAGENAME INSTALLED"
exit 0
```
* To fire the script remotely (note how apt-install should be referenced as apt_install in the api route)

```
curl -XPOST http://localhost:3003/scripts/apt_install -H "Content-Type: application/json" -d '{"packagename": "jq"}'
```
* Output
```
{"retcode": 0, "return_values": {}, "stderr": ["debconf: delaying package configuration, since apt-utils is not installed"], "stdout": ["Reading package lists...", "Building dependency tree...", "Reading state information...", "The following additional packages will be installed:", "  libjq1 libonig5", "The following NEW packages will be installed:", "  jq libjq1 libonig5", "0 upgraded, 3 newly installed, 0 to remove and 120 not upgraded.", "Need to get 355 kB of archives.", "After this operation, 1072 kB of additional disk space will be used.", "Get:1 http://deb.debian.org/debian buster/main amd64 libonig5 amd64 6.9.1-1 [171 kB]", "Get:2 http://deb.debian.org/debian buster/main amd64 libjq1 amd64 1.5+dfsg-2+b1 [124 kB]", "Get:3 http://deb.debian.org/debian buster/main amd64 jq amd64 1.5+dfsg-2+b1 [59.4 kB]", "Fetched 355 kB in 0s (3747 kB/s)", "Selecting previously unselected package libonig5:amd64.", "(Reading database ... ", "(Reading database ... 5%", "(Reading database ... 10%", "(Reading database ... 15%", "(Reading database ... 20%", "(Reading database ... 25%", "(Reading database ... 30%", "(Reading database ... 35%", "(Reading database ... 40%", "(Reading database ... 45%", "(Reading database ... 50%", "(Reading database ... 55%", "(Reading database ... 60%", "(Reading database ... 65%", "(Reading database ... 70%", "(Reading database ... 75%", "(Reading database ... 80%", "(Reading database ... 85%", "(Reading database ... 90%", "(Reading database ... 95%", "(Reading database ... 100%", "(Reading database ... 24542 files and directories currently installed.)", "Preparing to unpack .../libonig5_6.9.1-1_amd64.deb ...", "Unpacking libonig5:amd64 (6.9.1-1) ...", "Selecting previously unselected package libjq1:amd64.", "Preparing to unpack .../libjq1_1.5+dfsg-2+b1_amd64.deb ...", "Unpacking libjq1:amd64 (1.5+dfsg-2+b1) ...", "Selecting previously unselected package jq.", "Preparing to unpack .../jq_1.5+dfsg-2+b1_amd64.deb ...", "Unpacking jq (1.5+dfsg-2+b1) ...", "Setting up libonig5:amd64 (6.9.1-1) ...", "Setting up libjq1:amd64 (1.5+dfsg-2+b1) ...", "Setting up jq (1.5+dfsg-2+b1) ...", "Processing triggers for libc-bin (2.28-10) ...", "jq INSTALLED"]}
```
