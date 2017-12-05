#!/bin/bash
#Testing script

$FREESPCE="$(df -h | tail -1 | awk '{print $4}')"
echo $FREESPCE
