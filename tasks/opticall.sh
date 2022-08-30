#!/bin/bash

# SPDX-FileCopyrightText: 2022 debgerme <fossgerme@tuta.io>
#
# SPDX-License-Identifier: GPL-3.0-or-later

for FILE in _build/aleta/*/*/*.png
do
	optipng -o7 "$FILE" >/dev/null 2>&1
    echo optimized: "$FILE"
done
