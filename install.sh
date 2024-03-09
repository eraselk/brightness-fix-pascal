#!/bin/sh
SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=true
REPLACE=""
sleep 2
unzip -o "$ZIPFILE" 'brightness' -d "$MODPATH" >&2
unzip -o "$ZIPFILE" 'auto_adj' -d "$MODPATH" >&2
unzip -o "$ZIPFILE" 'led' -d "$MODPATH" >&2
unzip -o "$ZIPFILE" 'service.sh' -d "$MODPATH" >&2

if [ -f "/data/local/tmp/brightness" ]; then
rm -f /data/local/tmp/brightness
fi

mv -f $MODPATH/brightness /data/local/tmp/brightness
touch $MODPATH/.tmp
mkdir -p $MODPATH/system/bin
mv -f $MODPATH/led $MODPATH/system/bin/led
mv -f $MODPATH/auto_adj $MODPATH/system/bin/auto_adj

set_perm_recursive $MODPATH 0 0 0755 0755
set_perm $MODPATH/system/bin/led 0 2000 0755
set_perm $MODPATH/system/bin/auto_adj 0 2000 0755