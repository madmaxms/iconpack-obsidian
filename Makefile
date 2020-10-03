all:
	mkdir -p release 
	fd -t f -g '*.svg' | parallel 'mkdir -p release/{//} && svgcleaner {} release/{}'
clean:
	rm -r release
