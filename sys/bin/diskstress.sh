
#!/bin/bash

# This is a bit silly, but it's just to stress disks.
# Now with some more simple metadata lookups

while(true);
do
        fname=${RANDOM}
        if [ -f ${fname}.tmp ]; then echo "exists!"; fi
        dd if=/dev/zero of=./${fname}.tmp bs=1024 count=${RANDOM}
        if [ -x ${fname}.tmp ]; then echo "Executable?!"; fi
        cat ${fname}.tmp > /dev/null
        if [ -f ${fname}.tmp ]; then rm ${fname}.tmp; fi
done
