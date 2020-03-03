#!/usr/bin/python3
from socketserver import BaseRequestHandler, UDPServer
import time

host = ('0.0.0.0', 1194)

class TimeHandler(BaseRequestHandler):
    def handle(self):
        print('Got connection from', self.client_address)
        # Get message and client socket
        msg, sock = self.request
        resp = time.ctime()
        sock.sendto(resp.encode('ascii'), self.client_address)

if __name__ == '__main__':
    server = UDPServer(host, TimeHandler)
    print("Starting server, listen at {}:{}".format(host[0], host[1]))
    server.serve_forever()
