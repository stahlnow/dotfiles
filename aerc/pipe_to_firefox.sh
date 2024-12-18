#!/bin/sh
tmp=$(mktemp /tmp/mail.XXXXXXXXX.html)
cat > $tmp
firefox --new-tab --url $tmp
