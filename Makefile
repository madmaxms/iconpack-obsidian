all: remove_redundant_png dedup svgclean 
dedup_dryrun:
	rdfind -makesymlinks true -n true . 
dedup:
	rdfind -makesymlinks true release .
remove_redundant_png:
	echo "W.I.P."
svgclean: 
	mkdir -p release
	cp -r Obsidian* release/
	fd -t f -g '*.svg' | parallel 'svgcleaner {} release/{}'
clean:
	rm -r release
