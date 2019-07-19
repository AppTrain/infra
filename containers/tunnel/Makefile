all:
	mkdir keys
	cp ~/.annalect/ssh/* keys
	docker build -t 348194362585.dkr.ecr.us-west-2.amazonaws.com/ops/tunnel .
	docker push 348194362585.dkr.ecr.us-west-2.amazonaws.com/ops/tunnel
	rm -rf keys