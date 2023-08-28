#!/bin/zsh

MBSYNC=$(pgrep mbsync)
NOTMUCH=$(pgrep notmuch)
AFEW=$(pgrep afew)

if [ -n "$MBSYNC" -o -n "$NOTMUCH" -o -n "$AFEW" ]; then
    echo "Already running one instance of mbsync, notmuch or afew. Exiting..."
    exit 0
fi

echo "Syncing mailboxes"
mbsync --all

echo "##################################################"
echo "Move mails"
echo "##################################################"
# move mails tagged with *trash* / *restore* from inbox to trash or vice-versa
# as configured in ~/.config/afew/config
afew --move-mails --all

echo "##################################################"
echo "Scans/Index new mails and tag them"
echo "##################################################"
# tag new messages with 'new'
# refer to ~/.notmuch-config manual (man notmuch-new)
notmuch new --quiet
# lists and other filters
notmuch tag +list +dsp -new -- "to:MUSIC-DSP@LISTS.COLUMBIA.EDU and tag:new"
notmuch tag +list +dsp -new -- "to:music-dsp@music.columbia.edu and tag:new"
notmuch tag +list +sdiy -new -- "subject:.'[sdiy]' and tag:new"
notmuch tag +list +nettime -new -- "subject:.'<nettime>' and tag:new"
notmuch tag +list +bandcamp -new -- "from:noreply@bandcamp.com and tag:new"
notmuch tag +list +pycoders -new -- "from:admin@pycoders.com and tag:new"
notmuch tag +list +periodical -new -- "from:newsletter@bogenf.ch and tag:new"
notmuch tag +list +periodical -new -- "from:nouvelles@helsinkiklub.ch and tag:new"
notmuch tag +list +periodical -new -- "from:news@walcheturm.ch and tag:new"
notmuch tag +list +periodical -new -- "from:clubqueen@umbo.wtf and tag:new"
notmuch tag +list +periodical -new -- "from:mail@schoenegg-variete.ch and tag:new"
notmuch tag +list +periodical -new -- "from:info.icst@zhdk.ch and tag:new"
notmuch tag +list +periodical -new -- "from:office@hek.ch and tag:new"
notmuch tag +list +periodical -new -- "from:info@ignm-zuerich.ch and tag:new"
notmuch tag +list +periodical -new -- "from:material@materialismus.ch and tag:new"
# handle inbox/sent/archive
notmuch tag +inbox -new -- "folder:stahlnow/inbox and tag:new"
notmuch tag +sent -new -- "folder:stahlnow/sent and tag:new"
notmuch tag +archive -inbox -new -- "folder:stahlnow/archive and tag:new"

# clean up
echo "##################################################"
echo "Remove *restore* tag from mails in inbox"
echo "##################################################"
notmuch tag -restore -- "folder:stahlnow/inbox and tag:restore"

echo "##################################################"
echo "Permanently deleting messages tagged as *killed*"
echo "##################################################"
notmuch search --format=text0 --output=files tag:killed | xargs -0 --no-run-if-empty rm -v
