#SPD with TRB pot sites missing

#Load the workpackages
library(rcarbon)
library(readr)

#Load the dataset from local source
STAGED17022020 <- read_csv2("~/Github/STAGED23052020.csv", col_names = TRUE)

#SPD of all dates excluding TRB pot sites
#First create a subset without the sites, i.e. 
DatesA <- STAGED17022020[-c(94:105, 537:539, 648:649, 759, 792:799, 1028:1029: 1175:1182, 1235:1239, 1282, 1330:1333, 1335:1340), ]
binsA <- binPrep(DatesA$Site_ID, DatesA$BP, h=200)
caldatesA <- calibrate(x=DatesA$BP, errors=DatesA$SD, calCurves='intcal13', normalised=FALSE, calMatric=TRUE)
spdA <- spd(x=caldatesA, bins=binsA, timeRange=c(12050,3750))

#SPD of the TRB pot sites
DatesB <- STAGED17022020[-c(1:93, 106:536, 540:647, 650:758, 760:791, 800:1027, 1030:1174, 1183:1234, 1240:1281, 1283:1329, 1334, 1341:1428), ]
binsB <- binPrep(DatesB$Site_ID, DatesB$BP, h=200)
caldatesB <- calibrate(x=DatesB$BP, errors=DatesB$SD, calCurves='intcal13', normalised=FALSE, calMatric=TRUE)
spdB <- spd(x=caldatesB, bins=binsB, timeRange=c(12050,3750))

#Plots
plot(spdA, calendar="BCAD", runm=400)
plot(spdB, calendar="BCAD", runm=400, add=TRUE,type="simple",col="black",lwd=2,lty=2)
legend("topleft", legend=c("SPD without TRB pot sites", "SPD of Early Neolithic I TRB pot sites"), col=c("grey", "black"), lwd=2)
