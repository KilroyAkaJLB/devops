
docker run \
	--detach \
        --name=bind9 \
        --restart=always \
        --publish 53:53/udp \
        --publish 53:53/tcp \
        --publish 127.0.0.1:953:953/tcp \
        --volume bind9:/etc/bind \
        --volume bind9cache:/var/cache/bind \
        internetsystemsconsortium/bind9:9.18

