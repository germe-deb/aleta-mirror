#!/bin/bash

# SPDX-FileCopyrightText: 2022 debgerme <fossgerme@tuta.io>
#
# SPDX-License-Identifier: GPL-3.0-or-later

printf "${info_color}copying icons...${reset_colors}\\n"
cp icons/apps/*.svg        _build/icons-t/apps/
cp icons/places/*.svg      _build/icons-t/places/
cp icons/categories/*.svg  _build/icons-t/categories/
cp icons/devices/*.svg     _build/icons-t/devices/
cp icons/status/*.svg      _build/icons-t/status/
cp icons/mimetypes/*.svg   _build/icons-t/mimetypes/
cp icons/actions/*.svg     _build/icons-t/actions/
cp icons/animations/*.svg  _build/icons-t/animations/
cp icons/emblems/*.svg     _build/icons-t/emblems/

printf "${info_color}copying symbolic icons...${reset_colors}\\n"
cp icons/apps-symbolic/*.svg        _build/icons-t/apps-symbolic/
cp icons/places-symbolic/*.svg      _build/icons-t/places-symbolic/
cp icons/categories-symbolic/*.svg  _build/icons-t/categories-symbolic/
cp icons/devices-symbolic/*.svg     _build/icons-t/devices-symbolic/
cp icons/status-symbolic/*.svg      _build/icons-t/status-symbolic/
cp icons/mimetypes-symbolic/*.svg   _build/icons-t/mimetypes-symbolic/
cp icons/actions-symbolic/*.svg     _build/icons-t/actions-symbolic/
cp icons/animations-symbolic/*.svg  _build/icons-t/animations-symbolic/
cp icons/emblems-symbolic/*.svg     _build/icons-t/emblems-symbolic/
