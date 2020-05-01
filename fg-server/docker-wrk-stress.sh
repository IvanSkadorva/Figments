docker run --rm --link=fg-nginx -v $(pwd):/data skandyla/wrk -s stress.lua -t5 -c10 -d30 http://fg-nginx:80/plain.html
