#' Find and list the names of available .bib files in \pkg{journals}
#'
#' Search the GitHub repository in the inst/bib directory for .bib files and
#' return a list of all the available files. This list can then be used within
#' a markdown file to specify the available .bib files.
#'
#' @author Kelli F. Johnson
#' @export
#'
find_bibs <- function() {
  org <- "nmfs-fish-tools"
  repo <- "journals"
  url <- paste0(
    "https://api.github.com/repos/",
    org, "/", repo,
    "/git/trees/main:inst/bib"
  )
  info <- system(paste("curl", url), intern = TRUE)
  files <- gsub(
    pattern = "^.+: |,|\\\"",
    replacement = "",
    grep("bib", info, value = TRUE)
  )
  return(files)
}
