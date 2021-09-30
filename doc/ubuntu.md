Q: How to add a user
A: 1. `useradd bob -s /bin/bash -m`
   2. `usermod -aG sudo`
   3. `passwd bob `

Q: How to know the linux and ubuntu version
A: `uname -a`
A: `lsb_release -a`

Q: How to upgrade python3 to python3.9
A: 1. `sudo apt install software-properties-common`
   2. `sudo add-apt-repository ppa:deadsnakes/ppa`
   3. `sudo apt install python3.9`
   4. `sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1`
   5. `sudo update-alternatives --config python3`
   6. `python3 -V`

Q: How to upgrade pip3
A: `sudo pip3 install --upgrade pip`

Q: No module named 'apt_pkg' error after upgrade to python 3.9
A: edit `/usr/bin/add-apt-repository` to use python3.8: `#!/usr/bin/python3.8`

