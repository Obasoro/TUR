#!/bin/bash
echo "Hello World!" > index.html
nihup busybox http -f -p 8080 &