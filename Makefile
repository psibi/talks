beamer:
	cd beamer && latex presentaion.tex
calender:
	cd calender && latex calendar.tex
report:
	cd report && latex report.tex

.PHONY: beamer calender report
