build:
	pandoc -t revealjs -s -o azure_haskell.html slides.md -V revealjs-url=./reveal.js --variable theme="simple"

run:
	warp -d $(PWD) -h "127.0.0.1" -p 4000 -i azure_haskell.html
