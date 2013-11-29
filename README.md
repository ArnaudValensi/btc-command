btc-command
===========

A script to get some informations about bitcoin (last price, how much you'll get if you sell now, ...)

Example
-------
```
$ ./btc.sh
[+] You bought 0.2982 btc at 705€/btc for 210.2310€
[+] Current price 866€, you can get 258.2412€
[+] So you'll earn 48.0102€
```

Usage
-------
```
Usage: ./btc.sh [-s] [-b]
    -s: silent mode, just shows the result of how much you'll earn.
    -b: get the last btc price.
```

Configuration
-------------

You have to change these variables :

* `BTC_AMOUNT` is the amount of BTC you own.
* `BUY_PRICE` is at what price you got it.
