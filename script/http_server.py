#!/usr/bin/python3
from http.server import HTTPServer, BaseHTTPRequestHandler
import json

data = {'result': 'this is a test'}
host = ('0.0.0.0', 80)

class Resquest(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'application/json')
        self.end_headers()
        self.wfile.write(json.dumps(data).encode())
        self.wfile.write(b'\n')

if __name__ == '__main__':
    server = HTTPServer(host, Resquest)
    print("Starting server, listen at {}:{}".format(host[0], host[1]))
    server.serve_forever()
