build:
	pandoc -t revealjs -s -o azure_haskell.html slides.md -V revealjs-url=./reveal.js --variable theme="simple"

run:
	warp -d $(PWD) -i ./azure_haskell.html
