minikube start –vm-driver none \
--docker-env HTTP_PROXY=http://127.0.0.1:8118 \
--docker-env HTTPS_PROXY=http://127.0.0.1:8118 \
--docker-env NO_PROXY=localhost,\
127.0.0.1,\
192.168.99.1/24,\
192.168.49.0/24,\  
192.168.39.0/24,\  
172.17.0.0/24,\  
