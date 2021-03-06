#!/bin/bash
base=/http/www

read request

while /bin/true; do
  read header
  [ "$header" == $'\r' ] && break;
done

if [ -f "$filename" ]; then
  echo -e "HTTP/1.1 200 OK\r"
  echo -e "Content-Type: `/usr/bin/file -bi \"$filename\"`\r"
  echo -e "\r"
  cat "$filename"
  echo -e "\r"
else
  echo -e "HTTP/1.1 404 Not Found\r"
  echo -e "Content-Type: text/html\r"
  echo -e "\r"
  echo -e "404 Not Found\r"
  echo -e "Not Found
           The requested resource was not found\r"
  echo -e "\r"
fi
