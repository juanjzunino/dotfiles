#!/bin/sh

mcd () {
    mkdir -p "$1"
    cd "$1"
}

marco () {
    pwd > /tmp/cwd.txt
}

polo () {
    cd $(cat /tmp/cwd.txt)
}

