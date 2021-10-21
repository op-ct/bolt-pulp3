#!/bin/sh

sed -i "s@\(http\|file\)://[^:]\+:8080/@http://127.0.0.1:8080/@g" output/*.sh

