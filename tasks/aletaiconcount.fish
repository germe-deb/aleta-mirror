#!/usr/bin/fish

# SPDX-FileCopyrightText: 2022 debgerme <fossgerme@tuta.io>
#
# SPDX-License-Identifier: GPL-3.0-or-later


# show total
set_color -o brgreen; printf "Total:      "
set_color normal; find icons -depth -iname \*.svg | wc -l

printf "───────────────\\n"

set_color -o brblue; printf "Actions:    "
set_color normal; find icons/apps* -depth -iname \*.svg | wc -l

set_color -o brblue; printf "Animations: "
set_color normal; find icons/animations* -depth -iname \*.svg | wc -l

set_color -o brblue; printf "Apps:       "
set_color normal; find icons/apps* -depth -iname \*.svg | wc -l

set_color -o brblue; printf "Categories: "
set_color normal; find icons/categories* -depth -iname \*.svg | wc -l

set_color -o brblue; printf "Devices:    "
set_color normal; find icons/devices* -depth -iname \*.svg | wc -l

set_color -o brblue; printf "Emblems:    "
set_color normal; find icons/emblems* -depth -iname \*.svg | wc -l

set_color -o brblue; printf "Mimetypes:  "
set_color normal; find icons/mimetypes* -depth -iname \*.svg | wc -l

set_color -o brblue; printf "Places:     "
set_color normal; find icons/places* -depth -iname \*.svg | wc -l

set_color -o brblue; printf "Status:     "
set_color normal; find icons/status* -depth -iname \*.svg | wc -l

set_color -o brblue; printf "Ui:         "
set_color normal; find icons/ui* -depth -iname \*.svg | wc -l
