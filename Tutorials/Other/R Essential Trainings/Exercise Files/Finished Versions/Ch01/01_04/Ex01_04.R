# R Statistics Essential Training
# Ex01_04
# Installing and managing packages

# LISTS OF PACKAGES
browseURL("http://cran.r-project.org/web/views/")  # Opens CRAN Task Views in browser
# Opens "Available CRAN Packages By Name" (from UCLA mirror) in browser
browseURL("http://cran.stat.ucla.edu/web/packages/available_packages_by_name.html")
# See also CRANtastic
browseURL("http://crantastic.org/")

# See current packages
library()  # Brings up editor list of installed packages
search()   # Shows packages that are currently loaded

# TO INSTALL AND USE PACKAGES
# Can use menus: Tools > Install Packages... (or use Package window)
# Or can use scripts, which can be saved in incorporated in source
install.packages("ggplot2")  # Downloads package from CRAN and installs in R
?install.packages
library("ggplot2")  # Make package available; often used for loading in scripts
require("ggplot2")  # Preferred for loading in functions; maybe better?
library(help = "ggplot2")  # Brings up documentation in editor window

# VIGNETTES
vignette(package = "grid")  # Brings up list of vignettes (examples) in editor window
?vignette
browseVignettes(package = "grid")  # Open web page with hyperlinks for vignette PDFs etc.
vignette()  # Brings up list of all vignettes for currently installed packages
browseVignettes()  # HTML for all vignettes for currently installed packages
# If links are dead, go to CRAN and search by name
browseURL("http://cran.stat.ucla.edu/web/packages/available_packages_by_name.html")

# UPDATE PACKAGES
# In RStudio, Tools > Check for Package Updates
update.packages()  # Checks for updates; do periodically
?update.packages

# UNLOAD/REMOVE PACKAGES
# By default, all loaded packages are unloaded when R quits
# Can also open Packages window and manually uncheck
# Or can use this code
# To unload packages
detach("package:ggplot2", unload = TRUE)
?detach

# To permanently remove (delete) package
install.packages("psytabs")  # Adds psytabs
remove.packages("psytabs")   # Deletes it
?remove.packages