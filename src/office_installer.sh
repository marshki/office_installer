#!/bin/bash
# mjk235 [at] nyu [dot] edu --2018.09.08

#===============================================================================
# Auto-magically install a subset of MSFT. Office 2016 on OS X. 		   
# Open to members of NYU's: Center for Brain Imaging, Center for Neural Science,  
# and Department of Psychology.                                                   
# Requires: root privileges; access to Meyer network; adequate free disk space.   
#===============================================================================

LOCAL_WEB="localweb.cns.nyu.edu/mac/.local/office2016.tgz"

OFFICE=(
Office2016
"localweb.cns.nyu.edu/mac/.local/office2016.tgz"
)

#==============
# Sanity Checks
#==============

# Is current UID 0? If not, exit.

root_check () {
  if [ "$EUID" -ne "0" ] ; then
    printf "%s\\n" "ERROR: ROOT PRIVILEGES ARE REQUIRED TO CONTINUE. EXITING." >&2
    exit 1
fi
}

# Is there adequate disk space in "/Applications"? If not, exit.

check_disk_space () {
  if [ "$(df -lk /Applications |awk 'FNR == 2 {print $4}')" -le "7717519" ]; then
    printf "%s\\n" "ERROR: NOT ENOUGH FREE DISK SPACE. EXITING." >&2
    exit 1
fi
}

# Is curl installed? If not, exit. (Curl ships with OS X, but let's check).

curl_check () {
  if ! [ -x "$(command -v curl 2>/dev/null)" ]; then
    printf "%s\\n" "ERROR: CURL IS NOT INSTALLED. EXITING."  >&2
    exit 1
fi
}

# Is CNS local web available? If not, exit.  

local_web_check(){
  local status_code
  status_code=$(curl --output /dev/null --silent --head --write-out '%{http_code}\n' "$LOCAL_WEB")

  if [ "$status_code" -ne "200" ] ; then
    printf "%s\\n" "ERROR: CNS LOCAL WEB IS NOT REACHABLE. EXITING." >&2
    exit 1 

  else
    printf "%s\\n" "CNS LOCAL WEB IS REACHABLE. CONTINUING..."
fi
}

sanity_checks() {
  root_check
  check_disk_space
  curl_check
  local_web_check
}

#=================
# Office Install-r 
#=================

# Download tarball to /Applications.

get_office () {
  printf "%s\\n" "RETRIEVING ${OFFICE[0]} INSTALLER..."

  curl --progress-bar --retry 3 --retry-delay 5 --keepalive-time 60 --continue-at - "${OFFICE[1]}" --output /Applications/office.app.tgz
}

# Unpack tarball to /Applications, which installs Office.

untar_office () {
  printf "%s\\n" "UNTARRING ${OFFICE[0]} PACKAGE TO /Applications..."

  tar --extract --gzip -v --file=/Applications/office.app.tgz --directory=/
}

# Remove tarball from /Applications.

remove_office_tar () {
  printf "%s\\n" "REMOVING ${OFFICE[0]} TARBALL..."

  rm -rv /Applications/office.app.tgz
}

office_installer () {
  get_office
  untar_office
  remove_office_tar
}

#======
# Main
#======

main () {
  sanity_checks
  office_installer
}

main "$@"
