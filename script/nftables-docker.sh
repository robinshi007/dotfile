# setup nftables and docker
#https://mitchriedstra.com/2019/03/docker-nftables
# 1. edit docker.service
#    > ExecStart=/usr/bin/dockerd --iptables=false -H fd://
# 2. edit nftables.conf
# 3. create a docker brige 'user0'
# 4. run docker with that network 'user0'
# 5. check the running docker app service with curl

#sudo docker run --network user \
  #-d \
  #--ip 172.20.1.80 \
  #-v ~/bin/dkron.data:/dkron.data \
  #--name dkron dkron/dkron agent \
  #--server --bootstrap-expect=1
