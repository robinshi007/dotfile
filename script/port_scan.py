#!/usr/local/bin/python3
# check udp port is open: nc -v -u -z -w 3 192.168.2.2 1193-1195
from socket import *
import threading
import time

def tcp_connect(ip, port, delay, output):
    tcp_sock = socket(AF_INET, SOCK_STREAM)
    tcp_sock.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
    tcp_sock.settimeout(delay)

    try:
        code = tcp_sock.connect_ex((ip, port))
        if code == 0:
            output[port] = 'Listening'
        else:
            output[port] = ''
        tcp_sock.close()
    except Exception as e:
        pass

def udp_connect(ip, port, delay, output):
    tcp_sock = socket(AF_INET, SOCK_DGRAM)
    tcp_sock.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
    tcp_sock.settimeout(delay)

    try:
        tcp_sock.sendto('hello'.encode('utf-8'), (ip, port))
        message, remote = tcp_sock.recvfrom(1024)
        if message:
            output[port] = 'Listening'
        tcp_sock.close()
    except Exception as e:
        output[port] = ''
        tcp_sock.close()


def scan_port(host_ip, max_port, p_type, delay):
    startTime = time.time()
    print("starting {} scan on host: {} (0-{})".format(p_type, host_ip, max_port))
    # p_type: tcp or udp

    output = {}
    batch_num = 2000
    cishu = max_port // batch_num
    yushu = max_port % batch_num

    connect_handler = None

    for i in range(int(cishu+1)):
        # print process
        print("...{0:.0%}".format((i+1)/(cishu+1)), end='')
        threads = []
        if p_type == 'tcp':
            connect_handler = tcp_connect
        elif p_type == 'udp':
            connect_handler = udp_connect
        if i != cishu:
            for j in range(batch_num):
                t = threading.Thread(target=connect_handler, args=(host_ip, i*batch_num + j, delay,
                    output))
                #print("[debug] {}".format(i*batch_num + j))
                threads.append(t)
            for i in range(batch_num):
                threads[i].start()
            for i in range(batch_num):
                threads[i].join()
        else:
            for j in range(yushu+1):
                t = threading.Thread(target=connect_handler, args=(host_ip, i*batch_num + j, delay,
                    output))
                #print("[debug] {}".format(i*batch_num + j))
                threads.append(t)
            for i in range(yushu):
                threads[i].start()
            for i in range(yushu):
                threads[i].join()
    # done
    print("...done")

    for i in range(max_port):
        if i in output and output[i] == 'Listening':
            print("=> {}/{}: {}".format(i, p_type, output[i]))

    print('time token: {}'.format(time.time() - startTime))

if __name__ == '__main__':

   ip = "192.168.2.2"
   #ip = "149.28.31.103"
   delay = 0.8  # 0.8 second

   scan_port(ip, 65535, 'tcp', delay)
   scan_port(ip, 65535, 'udp', delay)

