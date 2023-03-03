# tested in ubuntu 20.02

# utils
print_section(){
  echo "====== $1 ======"

}
## prepare
PROMETHEUS_VERSION=2.4.2
NODE_EXPORTER_VERSION=1.5.0
NGINX_EXPORTER_VERSION=0.11.0
GRAFANA_VERSION=9.2.4

CONFIG_DIR=~/dotfile/setup/grafana

# mkdir -p ~/downloads && cd ~/downloads

## == node exporter
# print_section "install node exporter $NODE_EXPORTER_VERSION"
# sudo useradd --system --no-create-home --shell /bin/false node_exporter
# curl -LO "https://github.com/prometheus/node_exporter/releases/download/v$NODE_EXPORTER_VERSION/node_exporter-$NODE_EXPORTER_VERSION.linux-amd64.tar.gz"
# tar -xvf "node_exporter-$NODE_EXPORTER_VERSION.linux-amd64.tar.gz"
# sudo mv "node_exporter-$NODE_EXPORTER_VERSION.linux-amd64/node_exporter" /usr/local/bin
# rm -rf node_exporter*
# node_exporter version
# sudo cp "$CONFIG_DIR/node_exporter.service" /etc/systemd/system/node_exporter.service
# sudo systemctl daemon-reload
# sudo systemctl enable node_exporter
# sudo systemctl start node_exporter
# sudo systemctl status node_exporter


## == prometheus
# print_section "install prometheus $PROMETHEUS_VERSION"
# sudo useradd --system --no-create-home --shell /bin/false prometheus
# curl -LO "https://github.com/prometheus/prometheus/releases/download/v$PROMETHEUS_VERSION/prometheus-$PROMETHEUS_VERSION.linux-amd64.tar.gz"
# tar -xvf "prometheus-$PROMETHEUS_VERSION.linux-amd64.tar.gz"
# sudo mkdir -p /data /etc/prometheus
# cd "prometheus-$PROMETHEUS_VERSION.linux-amd64"
# sudo mv prometheus promtool /usr/local/bin
# sudo mv consoles/ console_libraries /etc/prometheus
# sudo mv prometheus.yml /etc/prometheus/prometheus.yml
# sudo chown -R prometheus:prometheus /etc/prometheus /data/
# cd .. && rm -rf prometheus*
# prometheus --version
# sudo cp "$CONFIG_DIR/prometheus.service" /etc/systemd/system/prometheus.service
# sudo systemctl daemon-reload
# sudo systemctl enable prometheus
# sudo systemctl start prometheus
# sudo systemctl status prometheus

# sudo vim /etc/prometheus/prometheus.yml
## add code to prometheus.yml
#```
#- job_name: "node_exporter"
#    #static_configs:
#      #- targets: ["localhost:9100"]
#```

# promtool check config /etc/prometheus/prometheus.yml
# curl -X POST http://localhost:9090/-/reload


## == grafana
#print_section "install grafana $GRAFANA_VERSION"
#sudo apt-get install -y apt-transport-https software-properties-common
#wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
#echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
#sudo apt update
#sudo apt -y install grafana
#sudo systemctl enable grafana-server
#sudo systemctl start  grafana-server
#sudo systemctl status grafana-server

#sudo cp "$CONFIG_DIR/datasources.yaml" /etc/grafana/provisioning/datasources/datasources.yaml
#sudo systemctl restart grafana-server

## incluce grafana.conf
## set root_url of /etc/grafana/grafana.ini to 'http://localhost:3000';

## dashboard
# import dashboard 8919

### compile nginx with vts
# sudo apt-get install build-essential libpcre3 libpcre3-dev zlib1g zlib1g-dev openssl libssl-dev libgd-dev libxml2 libxml2-dev uuid-dev libgeoip-devpp
# ./configure --prefix=/etc/nginx \
# --sbin-path=/usr/sbin/nginx \
# --conf-path=/etc/nginx/nginx.conf \
# --modules-path=/etc/nginx/modules \
# --http-log-path=/var/log/nginx/access.log \
# --error-log-path=/var/log/nginx/error.log \
# --lock-path=/var/lock/nginx.lock \
# --pid-path=/var/run/nginx.pid \
# --http-client-body-temp-path=/var/cache/nginx/client_temp \
# --http-proxy-temp-path=/var/cache/nginx/proxy_temp \
# --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
# --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
# --http-scgi-temp-path=/var/cache/nginx/scgi_temp \
# --with-pcre \
# --with-http_ssl_module \
# --with-http_v2_module \
# --with-http_realip_module \
# --with-http_geoip_module \
# --with-http_addition_module \
# --with-http_sub_module \
# --with-http_dav_module \
# --with-http_flv_module \
# --with-http_mp4_module \
# --with-http_gunzip_module \
# --with-http_gzip_static_module \
# --with-http_random_index_module \
# --with-http_secure_link_module \
# --with-http_stub_status_module \
# --with-http_auth_request_module \
# --with-http_image_filter_module=dynamic \
# --with-http_slice_module \
# --with-mail \
# --with-mail_ssl_module \
# --with-threads \
# --with-file-aio \
# --with-stream=dynamic \
# --with-stream_ssl_module \
# --add-module=/home/robin/downloads/nginx-module-vts
#
# sudo make && sudo make install

# sudo ln -s /usr/lib/nginx/modules /etc/nginx/modules

## == nginx vts exporter
# print_section "install nginx_exporter $NGINX_EXPORTER_VERSION"
sudo useradd --system --no-create-home --shell /bin/false nginx_vts_exporter
# curl -LO "https://github.com/nginxinc/nginx-prometheus-exporter/releases/download/v$NGINX_EXPORTER_VERSION/nginx-prometheus-exporter_${NGINX_EXPORTER_VERSION}_linux_amd64.tar.gz"
# tar -xvf "nginx-prometheus-exporter_${NGINX_EXPORTER_VERSION}_linux_amd64.tar.gz"
sudo mv "nginx-prometheus-exporter" /usr/local/bin
# rm -rf nginx-prometheus-exporter CHANGELOG.md LICENSE README.md
sudo cp "$CONFIG_DIR/nginx_exporter.service" /etc/systemd/system/nginx_exporter.service
# sudo systemctl daemon-reload
# sudo systemctl enable nginx_exporter
# sudo systemctl start nginx_exporter
# sudo systemctl status nginx_exporter

# sudo vim /etc/prometheus/prometheus.yml
## add code to prometheus.yml
#```
#- job_name: "nginx_exporter"
#    scrape_interval: 5s
#    static_configs:
#      - targets: ["localhost:9113"]
#```
