au BufRead,BufNewFile /etc/nginx/*,/etc/nginx/conf.d/*,/usr/local/nginx/conf/*,*nginx.conf* if &ft == '' | setfiletype nginx | endif
au BufRead,BufNewFile *.vue set filetype=vue

