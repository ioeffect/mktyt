build:
	jupyter-book build .

deploy:
	make build && ghp-import -n -p -f _build/html

