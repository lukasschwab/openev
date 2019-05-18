# openev

OpenEvidence file preprocessing tools: convert years of policy debate files to HTML. You may be interested in previously generated archives of this HTML output:

+ [2014/2015](https://drive.google.com/file/d/1XDI5tTGBkazWg7BsRx82OPfhFwica8m3/view)
+ [2015/2016](https://drive.google.com/file/d/1bfau5bJqNroIaLLldRjgJxkX-oDYOqxf/view)

## Requirements

1. [Pandoc](https://pandoc.org/installing.html)
2. Go (optional)

## Getting started

1. Fetch target OpenEvidence file archives:<br/>```make 2015OpenEv.zip```

2. Convert all downloaded file archives to HTML.
    + With Go:<br/>```make html-parallel```
    + Without Go:<br/>```make html```

3. Zip all HTML output files:<br/>```make zip```
