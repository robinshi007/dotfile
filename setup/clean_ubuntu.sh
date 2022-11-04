function handle_apt(){
  # ===== APT
  sudo du -sh /var/cache/apt

  if [[ $1 == '-f' ]];then
    # clean download .deb already installed
    sudo apt-get clean
    # clean stored outdated archives in the cache
    sudo apt-get autoclean

  fi
}

function handle_logs(){
  # ===== JOURNAL LOGS
  # Remove the oldest archived journal files until the disk space they use falls below the specified size
  sudo journalctl --disk-usage
  if [[ $1 == '-f' ]];then
    sudo journalctl --vacuum-time 2d
    #sudo journalctl --vacuum-size 500M
  fi
}


function handle_kernel(){
  # ===== KERNEL
  # list kernel version
  dpkg --get-selections | grep linux-image

  if [[ $1 == '-f' ]];then
    # remove old kernel
    #sudo apt-get remvoe --purge linux-image-XXX-generic

    # remove unnecessary pkgs and linux kernels
    sudo apt-get autoremove --purge
  fi
}

function handle_snap(){
# ===== SNAPS
sudo du -h /var/lib/snapd/snaps

  if [[ $1 == '-f' ]];then
    snap list --all | awk '/disabled/{print $1, $3}' |
      while read snapname revision; do
        sudo snap remove "$snapname" --revision="$revision"
      done
  fi
}

handle_apt $1
handle_logs $1
handle_kernel $1
handle_snap $1
