#!/usr/bin/python3
# test in debian 10 buster
import os
import io
import subprocess
import re

def print_section(title):
    border = ("="*10)
    border_left = border.rjust(10)
    border_right = border.ljust(10)
    print("{} {} {}".format(border_left, title.upper(), border_right))

def capture_stdout_lines(cmd):
    try:
        res = subprocess.run(cmd.split(), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        #print("[debug][raw output] {}".format(res.stdout))
        return [res.stdout.decode('utf-8').strip().split('\n'), res.stderr.decode('utf-8').strip().split('\n')]
    except FileNotFoundError as error:
        return ['', "Command not found: {}".format(cmd.split()[0])]
    except:
        pass

def capture_stdout_item(name, cmd, regex):
    [lines, error]  = capture_stdout_lines(cmd)
    res = {'data': {} }
    if error != '':
        res['error'] = error
    for line in lines:
        #print("[debug] {}".format(line))
        m = re.search(regex, line)
        if m:
            res['data'][name] = m.group(0)
            break
    return res

def capture_stdout_items(cmd, regex):
    [lines, error]  = capture_stdout_lines(cmd)
    res = {'data': [] }
    if error != '':
        res['error'] = error
    for line in lines:
        #print("[debug] {}".format(line))
        m = re.search(regex, line)
        if m:
            res['data'].append(m.group(0))
    return res

def format_output(res):
    data = res['data']
    if res['title']:
        print_section(res['title'])
    if data != '':
        if isinstance(data, list):
            print_section("count: {} ".format(len(data)))
            for item in data:
                print(" {}".format(item))
        if isinstance(data, dict):
            for k in data:
                print("{}: {}".format(k, data[k]))

def os_name():
    res = capture_stdout_item('name', 'lsb_release -a', '(?<=Description:\s)[\w\/\(\)\s]+')
    res['title'] = 'os name'
    return res

def service_running():
    res = capture_stdout_items('sudo systemctl list-units --state=running', '[\w+\.]+(?=\s+loaded\sactive\srunning)')
    res['title'] = 'service running'
    return res

def package_installed():
    res = capture_stdout_items('sudo apt list --installed', '[\w\W]+(?=\s+\[installed)')
    res['title'] = 'package installed'
    return res

if __name__ == "__main__":
    format_output(os_name())
    format_output(service_running())
    format_output(package_installed())
