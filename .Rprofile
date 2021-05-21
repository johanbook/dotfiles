# Function called after init
.First <- function() {
  cat(
    paste0(R.Version()$version.string, "\n")
  )
}

# Set mirrors
local({
  old <- getOption("defaultPackages")
  r <- getOption("repos")
  r["CRAN"] <- "https://cloud.r-project.org"
  options(defaultPackages = c(old, "MASS"), repos = r)
})

options(browser = "brave")
options(usethis.description = list(
  `Authors@R` = utils::person(
    "Johan", "Book", , "johanbook@desupervised.io",
    role = c("aut", "cre", "cph")
  )
))


wideScreen <- function(howWide = Sys.getenv("COLUMNS")) {
  options(width = as.integer(howWide))
}
