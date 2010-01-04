#!/usr/bin/env bash

# Allows one to capture the std{out,err} from an X program if not launched
# from a shell directly, and then prints them out with xmessage if the
# original X program errors out.

CMD="$@"

TEMP=/tmp/$$
bash -c "$CMD" >$TEMP.1 2>$TEMP.2
RET=$?

if [ $RET -ne 0 ]; then
    echo -e "'$CMD' failed with error $RET\n\nSTDERR:\n\n$(cat $TEMP.2)\n\nSTDOUT:\n\n$(cat $TEMP.1)" | xmessage -file -
fi

rm -f $TEMP.1 $TEMP.2
