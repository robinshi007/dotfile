#!/usr/local/bin/python3
import os
from datetime import datetime

def td_format(td_object):
    seconds = int(td_object.total_seconds())
    periods = [
            ('year',        60*60*24*365),
            ('month',       60*60*24*30),
            ('day',         60*60*24),
            ('hour',        60*60),
            ('minute',      60),
            ('second',      1)
            ]

    strings=[]
    for period_name, period_seconds in periods:
        if seconds > period_seconds:
            period_value , seconds = divmod(seconds, period_seconds)
            has_s = 's' if period_value > 1 else ''
            strings.append("%s %s%s" % (period_value, period_name, has_s))

    return ", ".join(strings)

if __name__ == "__main__":
    t1 = datetime.now()
    print("scanning in progress:")

    for ping in range(1, 255):
        live = False
        address = "192.168.2." + str(ping)

        res = os.popen("timeout 0.5 ping -c 1 {}".format(address))
        for line in res.readlines():
            # for debug use
            # print("~=> {}".format(line))
            if line.count("ttl="):
                live = True
                break
            elif line.count("No route"):
                timeout = True
                break
        if live:
            print("ping to {}: OK".format(address))
        # else:
            # print("ping to {}: Failed".format(address))

    t2 = datetime.now()
    total = t2 - t1
    print("scanning completed in: {}".format(td_format(total)))
