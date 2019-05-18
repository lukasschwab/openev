all: subdirectories download html

subdirectories:
	@mkdir files ||:
	@mkdir html_files ||:

# TODO: make this generic for multiple years.
# Target: *.zip
# Append to the openev url.
download: subdirectories
	wget -P files/ https://s3.amazonaws.com/openev/2014OpenEv.zip
	unzip -d files files/2014OpenEv.zip
	bash remove-spaces.sh

html:
	bash files-to-html.sh

html-parallel: build-go
	./parallel-files-to-html $(find files/*.docx)

zip:
	zip html_files.zip -r html_files

build-go:
	go build parallel-files-to-html.go

clean:
	rm -f html_*.zip
	rm -f parallel-files-to-html

very-clean: clean
	rm html_files/*.html
