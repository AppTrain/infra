all:
	mkdir keys
	cp ~/.annalect/ssh/* keys
	docker build -t annalect/tunnel .
	rm -rf keys