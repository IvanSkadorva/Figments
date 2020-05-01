docker run --rm --link=fg-hero -v $(pwd):/data skandyla/wrk -s stress.lua -t5 -c30 -d10 http://fg-hero:10011/api/v1/stream/channels
