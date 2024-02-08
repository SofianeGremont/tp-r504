set -x
# lancement serveur sql
docker run --rm -d \
	-p 3307:3306 \
	-v vol-sql-demo:/var/lib/mysql \
	--name sae61-sql \
	--env MYSQL\_ROOT\_PASSWORD=foo \
	--network net-sae61 \
	mysql
