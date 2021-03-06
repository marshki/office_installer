# Office Installer 

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/df70db0382cd4d47a0fee95e385ad305)](https://www.codacy.com/app/marshki/office_installer?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=marshki/office_installer&amp;utm_campaign=Badge_Grade)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/Naereen/StrapDown.js/graphs/commit-activity)
[![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/hyperium/hyper/master/LICENSE)
[![Open Source Love svg3](https://badges.frapsoft.com/os/v3/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)

Bash script to retrieve, unzip, install, and cleanup a subset of [Microsoft's Office 2016](https://products.office.com/en-us/mac/microsoft-office-for-mac) software.

Open to members of New York University's: [Center for Brain Imaging](http://cbi.nyu.edu), [Center for Neural Science](http://www.cns.nyu.edu), 
and [Department of Psychology](http://www.psych.nyu.edu/psychology.html) on the Meyer network.

Written and tested to run on currently-supported versions of macOS.

**NYU moved to an Office 365 subscription-based model in November of 2017.**

## E-Z Install
**OS X:** `curl https://raw.githubusercontent.com/marshki/office_installer/master/src/office_installer.sh | caffeinate sudo bash` 

## Getting Started 

**For sysadmins who want to replicate this process**, we assume that you:

- [ ] are affiliated with an institution that has a valid license agreement with Microsoft;  

- [ ] can access a networked file server; and

- [ ] deployed Office 2016 locally on a Mac OS X client.

On your local client, tar up the Office install with, e.g.:

`tar czf word.tgz Microsoft\ Word.app/`

and place the file on your web server for distribution.

**For sysadmins AND end users:**

__Pre-flight checklist__ (the script will check for the following conditions):
 
  * root privileges  

  * adeqaute free disk space (8 GBs)

  * [curl](https://curl.haxx.se/docs/manpage.html)

  * access to the Meyer network.  

__Liftoff:__

Grab the script from `/src` in this repository, then call the script (*[caffeinate](https://ss64.com/osx/caffeinate.html) will keep the computer awake during installation*):  

* `caffeinate -i sudo bash office_installer.sh`.  

## History 

Initial commit 2018.09.08 

## LICENSE 

[LICENSE](https://github.com/marshki/office_installer/blob/master/LICENSE)
