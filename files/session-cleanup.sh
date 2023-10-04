#!/bin/sh

# Session cleanup for user student on logout

if [ "${USERNAME}" = "student" ]; then
	rm -rf /home/student/.cache/mozilla
	rm -rf /home/student/.mozilla
fi

exit 0
