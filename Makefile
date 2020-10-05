all: remove_redundant_png dedup svgclean 
dedup_dryrun:
	rdfind . 
dedup:
	rdfind -makesymlinks true .
	symlinks -crv .
remove_redundant_png:
	fd -t f -g '*.png' | while read -r png; do \
		["$$png"; \
	done
svgclean: 
	mkdir -p release
	cp -r Obsidian* release/
	fd -t f -g '*.svg' | parallel 'svgcleaner {} release/{}'
clean:
	rm -r release
