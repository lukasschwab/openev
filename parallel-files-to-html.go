package main

import (
	"fmt"
	"os"
	"os/exec"
	"path/filepath"

	"github.com/fatih/color"
	"github.com/lukasschwab/poolmap"
)

var b = color.BlueString
var r = color.RedString

func main() {
	targets := os.Args[1:]
	from := make([]interface{}, len(targets))
	for i := range targets {
		from[i] = targets[i]
	}
	poolmap.Map(from, pandocConvertToHTML, 4)
}

func pandocConvertToHTML(path interface{}) (interface{}, error) {
	s := fmt.Sprintf("%v", path)
	o := fmt.Sprintf("html_files/%s.html", filepath.Base(s))
	out, err := exec.Command("pandoc", "-s", s, "-o", o, "--quiet").Output()
	if err != nil {
		println(r("Error: %s", err))
	}
	return out, err
}
