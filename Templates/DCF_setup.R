## A script to be run at the start of each DCF session
.DCFversion = "0.12"
.neededCRANPackages=c("devtools","mosaic","ggplot2","reshape2","plyr","rworldmap")
# load packages and install any that are needed
for (pk in .neededCRANPackages) { 
  if( !require(pk,character.only=TRUE)) 
    install.packages(pk,quietly=TRUE) 
}

# Check the DCF package
where = find.package("DCF", quiet=TRUE) # is it installed
if( length(where) < 0 | (getNamespaceVersion("DCF") != .DCFversion)) {
  install_url(paste("http://mosaic-web.org/go/Repository/DannyKaplan/DCF_",
                    .DCFversion,".tar.gz", sep=""))
}

require(DCF)
# Other options
options(na.rm=TRUE)