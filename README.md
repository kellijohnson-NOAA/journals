# journals

`journals` provides easy access to a selection of .bib files stored in the
[TeX User Group bibliography archive](http://ftp.math.utah.edu/pub/tex/bib/).

First and foremost, the authors of `journals` would like to thank
Nelson H. F. Beebe for his tireless dedication to
archiving robust bibliographic information and
for being willing to extend his tools to journals outside of his domain.
Second, we encourage readers to peruse the
[full](http://ftp.math.utah.edu/pub/tex/bib/#download) and
[fisheries research](http://ftp.math.utah.edu/pub/tex/bib/index-fish.html)
archives kindly hosted by the
[University of Utah's Department of Mathematics](https://www.math.utah.edu/).
Where, `journals` is currently focused on information stored in the latter.

## Installation

Clone the GitHub repository using
```
git clone https://github.com/kellijohnson-NOAA/journals.git
```
and use your favorite text editor to view the [bib files](inst/bib).
You can also view a complete list of the fishery journals that are covered in
[fishery-journals.txt](inst/bib/fishery-journals.txt).

## Use

Roll the :game_die: and give `journals` a try :shrug:.
:no_entry_sign: writing your own .bib files or relying on a
reference management software to manage your bibliographic data.
`journals` lets you take the easy :motorway: where you just have to learn the
syntax surrounding bibliography keys that is used within the archive.

### Bibliography keys

:key:s or :label:s are created using strict rules using the
[biblabel software](https://www.math.utah.edu/~beebe/software/biblabel)
such that all keys are unique.
For details see the
[documentation for biblabel](https://www.math.utah.edu/~beebe/software/biblabel/biblabel.html).

In short,
keys are created by pasting the following three strings together with colons.
1. The first authors last name without apostrophes, etc.
1. The four-digit year the reference was published.
1. Captial letters representing the first letter of the first three important
   words in the title.

For example, the bib :key: for Scheffel *et al.* (2020) with a title of
"Coupling acoustic tracking with conventional tag returns to estimate mortality
for a coastal flatfish with high rates of emigration"
is `Scheffel:2020:CAT`.

### {RefManageR}

{RefManageR} is a great package within R that can help search .bib files and
generate citations and bibliographies.
For example, a given .bib file can be read in and searched using
```
cjfas <- RefManageR::ReadBib(
  file = file.path("inst", "bib", "canjfishaquatsci2020.bib")
)
scheffel2020 <- RefManageR::SearchBib(
  x = cjfas,
  doi = "cjfas-2018-0174"
)

# print the bib key
names(scheffel2020)
# [1] "Scheffel:2020:CAT"

# print a citation
RefManageR::AutoCite(scheffel2020, .opts = list(max.names = 3))
# [1] "(Scheffel, Hightower, Buckel, et al., 2020)"

# print a bibliography
RefManageR::PrintBibliography(scheffel2020)
```

More work needs to be done to make the formatting of the printed bibliography
more in line with user needs but it is a start.

## <img src="https://media.giphy.com/media/VgCDAzcKvsR6OM0uWg/giphy.gif" width="50"> Future

This repository is under active development with the following goals:

* Create an R package with tools for helping manage/search .bib files.
* Create vignettes that clearly outline how to use these .bib files.
* Document a pathway for using bib keys with roxygen2.
