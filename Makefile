all: dedup svgclean 
xz:
	XZ_DEFAULTS="-T0" tar -cvJf release.tar.xz Obsidian* LICENSE README.md logo.jpg
zst:
	tar --zstd -cvf release.tar.zst Obsidian* LICENSE README.md logo.jpg
dedup_dryrun:
	rdfind . 
dedup:
	rdfind -makesymlinks true .
	symlinks -crv .
svgclean: 
	mkdir -p release
	cp -r Obsidian* release/
	fd -t f -g '*.svg' | parallel 'svgcleaner {} release/{}'
	rm -r Obsidian*
	mv release/Obsidian* ./
	rmdir release
clean:
	rm -r release
