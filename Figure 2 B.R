#MCSPD (exponential) of dataset excluding taphonomic bias and farming revolution.
#Excludes Tapes transgression, dates before 8000 BP
#Excludes Late Neolithic, dates after 4000 BP.

#Load the workpackages
library(rcarbon)
library(readr)

#Load the dataset from local source
STAGED23052020 <- read_csv2("~/Github/STAGED23052020.csv", col_names = TRUE)
#Create dataset exluding dates younger than 4000 BP and older than 8000 BP
dates <- subset(STAGED23052020, BP>3999 & BP<8001)
#Calibrate dates
caldates <-calibrate(x=dates$BP, errors=dates$SD, calCurves='intcal13', normalised=FALSE, calMatric=TRUE)
#Combining dates
bins <- binPrep(dates$Site_ID, dates$BP, h=100)
#Create SPD
spd <-spd(x=caldates, bins=bins, spdnormalised = FALSE, timeRange=c(9450,3750), runm=200)
plot(spd, calendar = "BCAD")

# Use the modelTest function
MCSPD <- modelTest(caldates, errors=dates$SD, bins=bins, nsim=1000, timeRange=c(9450,3750), method=c("uncalsample"), model="exponential", runm=200, raw=FALSE)
#Plot the MCSPD
plot(MCSPD, calendar="BCAD")
#Generate summary statistics for MCSPD
summary(MCSPD)

