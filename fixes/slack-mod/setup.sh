#!/bin/bash

SLACKFILESPATH="/usr/lib/slack/resources/app.asar.unpacked/src/static"

RUNNINGDIR="$(dirname $(readlink -f $0))"

CAT="$(which cat)"
ECHO="$(which echo)"
SLACK="$(which slack)"
PKILL="$(which pkill)"
NOHUP="$(which nohup)"

# TEST on backup files
# SLACKFILESPATH="$RUNNINGDIR"

declare -a EDITFILES=("ssb-interop.js" "index.js")

## now loop through the above array
for i in "${EDITFILES[@]}"
do
    $ECHO "Creating $i.."
#    $CAT $RUNNINGDIR/$i.template >> $SLACKFILESPATH/$i

done

$ECHO "Restarting $SLACK ..."
$PKILL -9 -f slack
$NOHUP "$SLACK" & >/dev/null 2>&1 

