#!/bin/bash

for FILE in _build/aleta/*/*/*.png
do
	optipng -o7 "$FILE" >/dev/null 2>&1
    echo optimized: "$FILE"
done
