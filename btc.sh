#!/bin/bash

# Modify this:
BTC_AMOUNT=0.2982
BUY_PRICE=705

################################################

usage() 
{ 
    echo -e "Usage: $0 [-s] [-b]\n    -s: silent mode, just shows the result of how much you'll earn.\n    -b: get the last btc price." 1>&2; exit 1;
}

get_values()
{
    name=`curl -s https://data.mtgox.com/api/2/BTCEUR/money/ticker`
    current_price=$(echo $name | grep -o -E "last\":{\"value\":\"[0-9]*" | cut -d\" -f5)
    bought=`echo "$BTC_AMOUNT * $BUY_PRICE" | bc`
    resell=`echo "$BTC_AMOUNT * $current_price" | bc`
    gain=`echo "$resell - $bought" | bc`
}

show_all()
{
    echo "[+] You bought $BTC_AMOUNT btc at $BUY_PRICE€/btc for $bought€"
    echo "[+] Current price $current_price€, you can get $resell€"
    echo "[+] So you'll earn $gain€"
}

while getopts ":sb" o; do
    case "${o}" in
        s)
	    get_values
	    echo $gain
	    exit 0
            ;;
        b)
	    get_values
	    echo $current_price
	    exit 0
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

get_values
show_all
