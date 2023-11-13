cp dbml2sql.sh shared/
cp data.dbml shared/
docker run --rm -it \
	--workdir /srv \
	--name sae51-ub \
	--mount type=bind,source=$(pwd)/shared,target=/srv \
	im_ubuntu ./dbml2sql.sh
