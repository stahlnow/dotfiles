au BufRead,BufNewFile /etc/nginx/*,/etc/nginx/conf.d/*,/usr/local/nginx/conf/*,*nginx.conf* if &ft == '' | set filetype=nginx | endif

au BufRead,BufNewFile *.vue set filetype=vue

au BufRead,BufNewFile *.fst,*.dsp set filetype=faust
