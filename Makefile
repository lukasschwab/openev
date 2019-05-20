all: html-parallel

subdirectories:
	@mkdir -p files
	@mkdir -p html_files

%.zip: subdirectories
	wget https://s3.amazonaws.com/openev/$@
	unzip -d files $@
	detox files
	# Remove nondetoxed (duplicate name) files.
	rm -f files/*\ *.docx

html:
	bash files-to-html.sh

FILES = $(shell find files/*.docx)
html-parallel: parallel-files-to-html
	@./parallel-files-to-html $(FILES)

zip:
	zip html_files.zip -r html_files

parallel-files-to-html: parallel-files-to-html.go
	go build parallel-files-to-html.go

clean:
	rm -f html_*.zip
	rm -f parallel-files-to-html

very-clean: clean
	rm html_files/*.html
