#MCSPD (exponential) of complete dataset

#Load the workpackages
library(rcarbon)
library(readr)

#Load the dataset from local source
STAGED23052020 <- read_csv2("~/Github/STAGED23052020.csv", col_names = TRUE)
#Calibrate dates
caldates <-calibrate(x=STAGED23052020$BP, errors=STAGED23052020$SD, calCurves='intcal13', normalised=FALSE, calMatric=TRUE)
#Combining dates
bins <- binPrep(STAGED23052020$Site_ID, STAGED23052020$BP, h=100)
#Create SPD
spd <-spd(x=caldates, bins=bins, spdnormalised = FALSE, timeRange=c(12050,3500), runm=200)

# Use the modelTest function
MCSPD <- modelTest(caldates, errors=STAGED23052020$SD, bins=bins, nsim=1000, timeRange=c(12050,3500), method=c("uncalsample"), model="exponential", runm=200, raw=TRUE)
#Plot the MCSPD
plot(MCSPD, calendar="BCAD", xlim = c(-9550,-1550))
#Generate summary statistics for MCSPD
summary(MCSPD)
