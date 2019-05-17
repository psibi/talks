build:
	pandoc -t revealjs -s -o asg.html slides.md -V revealjs-url=./reveal.js --variable theme="simple"

download:
	@wget https://github.com/hakimel/reveal.js/archive/3.8.0.zip
	@unzip 3.8.0.zip
	@mv reveal.js-3.8.0 reveal.js

run:
	warp -d $(PWD) -h "127.0.0.1" -p 4000 -i asg.html
