# openev

OpenEvidence file preprocessing tools: convert years of policy debate files to HTML. You may be interested in previously generated archives of this HTML output:

+ [2013/2014](https://drive.google.com/file/d/1rfe8l-p7kmxMLUpQBQe30UvneJ1M9SaD/view)
+ [2014/2015](https://drive.google.com/file/d/1XDI5tTGBkazWg7BsRx82OPfhFwica8m3/view)
+ [2015/2016](https://drive.google.com/file/d/1bfau5bJqNroIaLLldRjgJxkX-oDYOqxf/view)
+ [2016/2017](https://drive.google.com/open?id=1rSqyhrghSrqcad86-yaEwMPjh8QOdBKJ)
+ [2017/2018](https://drive.google.com/open?id=1yORIMAH2QHUqirJuLo-FDAl-0tcYFnlz)

## Requirements

1. [`pandoc`](https://pandoc.org/installing.html)
2. [`detox`](https://formulae.brew.sh/formula/detox). Can use [a workaround](https://serverfault.com/questions/348482/how-to-remove-invalid-characters-from-filenames#comment906110_348485) to sanitize filenames if `detox` is unavailable.
2. Go (optional)

## Getting started

1. Fetch target OpenEvidence file archives:<br/>```make 2015OpenEv.zip```

2. Convert all downloaded file archives to HTML.
    + With Go:<br/>```make html-parallel```
    + Without Go:<br/>```make html```

3. Zip all HTML output files:<br/>```make zip```
