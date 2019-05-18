all: html

download:
	echo "TODO"

zip_html:
	zip html_files.zip -r html_files

html:
	bash files-to-html.sh

html_parallel: build_go
	./parallel-files-to-html $(find files/*.docx)

build_go:
	go build parallel-files-to-html.go
