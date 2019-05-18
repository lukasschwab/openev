all: html

subdirectories:
	@mkdir files ||:
	@mkdir html_files ||:

# TODO: make this generic for multiple years.
download: subdirectories
	wget -P files/ https://s3.amazonaws.com/openev/2014OpenEv.zip
	unzip -d files files/2014OpenEv.zip
	rm files/*.zip

html:
	bash files-to-html.sh

html_parallel: build_go
	./parallel-files-to-html $(find files/*.docx)

zip:
	zip html_files.zip -r html_files

build_go:
	go build parallel-files-to-html.go

clean:
	rm -f html_*.zip
	rm -f parallel-files-to-html

very-clean: clean
	rm html_files/*.html
