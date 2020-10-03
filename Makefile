all:
	mkdir -p release 
	fd -t f -g '*.svg' | parallel 'mkdir -p release/{//} && svgcleaner {} release/{}'
dedup_dryrun:
	rdfind -makesymlinks true -n true .
dedup:
	rdfind -makesymlinks true .
clean:
	rm -r release
