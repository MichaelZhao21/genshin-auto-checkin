#!/bin/bash
names=()
cookies=()

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

a=0
while read line; do
    if [ -n "$line" ]; then
        if [ $a -eq 0 ]; then
            names+=("$line")
            a=1
        else
            cookies+=("$line")
            a=0
        fi
    fi
done <"$SCRIPT_DIR/config"

max="$((${#names[@]} - 1))"
for i in $(seq 0 $max); do
    data=$(curl 'https://hk4e-api-os.mihoyo.com/event/sol/sign?lang=en-us' \
        -H 'Connection: keep-alive' \
        -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="90", "Google Chrome";v="90"' \
        -H 'Accept: application/json, text/plain, */*' \
        -H 'sec-ch-ua-mobile: ?0' \
        -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36' \
        -H 'Content-Type: application/json;charset=UTF-8' \
        -H 'Origin: https://webstatic-sea.mihoyo.com' \
        -H 'Sec-Fetch-Site: same-site' \
        -H 'Sec-Fetch-Mode: cors' \
        -H 'Sec-Fetch-Dest: empty' \
        -H 'Referer: https://webstatic-sea.mihoyo.com/' \
        -H 'Accept-Language: en-US,en;q=0.9' \
        -H "Cookie: ${cookies[$i]}" \
        --data-raw '{"act_id":"e202102251931481"}' \
        --compressed --silent)
    echo "$(date) | ${names[$i]}: ${data}" >> "$SCRIPT_DIR/out.log"
done
