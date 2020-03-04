#!/usr/bin/python3
import json
import requests

def _print_res(r):
    print("status: {}".format(r.status_code))
    res = r.json()
    print("data: {}".format(json.dumps(res, indent=4)))


def get(host, path="/"):
    url = "{}{}".format(host, path)
    print("=> GET {}".format(url))
    headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}

    r = requests.get(url)

    _print_res(r)



def post(host, path,  data):
    url = "{}{}".format(host, path)
    print("=> GET {}".format(url))
    headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}

    r = requests.post(url, data=json.dumps(data), headers=headers)

    _print_res(r)

if __name__ == "__main__":
    get("https://httpbin.org", "/get")
    post("https://httpbin.org", "/post", {"key":"value"})


