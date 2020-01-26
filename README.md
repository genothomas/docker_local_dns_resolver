# Local DNS Resolver in Docker using compiled Bind9

Also available on docker hub (https://hub.docker.com/r/genothomas/local_dns_resolver/)

Run locally using:

docker run --name local_dns_resolver --restart=always -d -p 53:53/udp -p 53:53/tcp genothomas/local_dns_resolver
