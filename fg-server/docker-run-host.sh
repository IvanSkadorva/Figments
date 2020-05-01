docker run --rm --name=fg-nginx -d  -p 9000:80 -v ${PWD}/html:/usr/local/openresty/nginx/html -v ${PWD}/templates:/usr/local/openresty/nginx/templates -v ${PWD}/conf/conf.d:/etc/nginx/conf.d -v ${PWD}/conf/nginx.conf:/usr/local/openresty/nginx/conf/nginx.conf  fp/nginx

