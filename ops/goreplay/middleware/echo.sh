#!/bin/sh

function printLog {
    >&2 echo "[DEBUG LOG] || $1"
}

while read line; do
    decoded=$(echo -e "$line" | xxd -r -p)
    header=$(echo -e "$decoded" | tail -n +1)

    printLog "<<----------------------------------->>"

    case ${header:0:1} in
    "1")
        printLog "Request"
        ;;
    "2")
        printLog "Production Response"
        ;;
    "3")
        printLog "Response of the request replayed in Development"
        ;;
    *)
    esac

    printLog "<<----------------------------------->>"
    printLog "Decoded request: $decoded"
    echo $line
done;