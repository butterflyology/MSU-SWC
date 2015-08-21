#updateR, by CA Hamm (version 0.1) 19 October 2014

#--run in the old version of R
setwd("~/MSU-SWC")
packages <- installed.packages()[,"Package"]
save(packages, file="Rpackages.3.2.2")

#--run in the new version
setwd("~/MSU-SWC")
load("Rpackages.3.2.2")
for (p in setdiff(packages, installed.packages()[,"Package"]))
install.packages(p)

# To remove all packages except the base
#remove.packages(packages)