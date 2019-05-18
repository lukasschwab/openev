all: html-parallel

subdirectories:
	@mkdir files ||:
	@mkdir html_files ||:

%.zip: subdirectories
	wget https://s3.amazonaws.com/openev/$@
	unzip -d files $@
	bash remove-spaces.sh

html:
	bash files-to-html.sh

FILES = $(shell find files/*.docx)
html-parallel: build-go
	@./parallel-files-to-html $(FILES)

zip:
	zip html_files.zip -r html_files

build-go:
	go build parallel-files-to-html.go

clean:
	rm -f html_*.zip
	rm -f parallel-files-to-html

very-clean: clean
	rm html_files/*.html
