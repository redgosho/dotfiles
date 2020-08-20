#!/bin/sh

echo "#[bg=colour82,fg=colour232][$(uptime | awk '{print $(NF-2)}')#[bg=colour82,fg=colour232]]#[default]"