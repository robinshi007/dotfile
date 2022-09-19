import requests


if __name__ == "__main__":
    proxies = { 
            'http': "socks5://localhost:1080",
            'https': "socks5://localhost:1080"
            }
    resp = requests.get('https://httpbin.org/anything', proxies=proxies)
    json = resp.json()
    print(json)



