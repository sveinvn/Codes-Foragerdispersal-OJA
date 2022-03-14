#Calculate maximus growth rate for Neolithic transition from STAGED

#Load the workpackages
library(rcarbon)
library(readr)
library(growthrates)

#Load the dataset from local source
STAGED23052020 <- read_csv2("~/Github/STAGED23052020.csv", col_names = TRUE)
#Calibrate dates
caldates <-calibrate(x=STAGED23052020$BP, errors=STAGED23052020$SD, calCurves='intcal13', normalised=FALSE, calMatric=TRUE)
#Combining dates
bins <- binPrep(STAGED23052020$Site_ID, STAGED23052020$BP, h=100)
#Create SPD
spd <-spd(x=caldates, bins=bins, timeRange=c(12050,1850), spdnormalised = FALSE, runm=200)
#Plot the SPD
plot(spd, calendar = "BCAD")

#Calculate growthrate from raw SPD data
#Create dataframe with row numbers 1-801. Necessary in order make fit_easylinear analyze the data in the correct direction.
Ypoint <- data.frame ("ypoint" = 1:10201)
#Create a dataframe with values for year and density from SPD -> Grid, and add ypoint
growthdata <- data.frame ("year" = spd$grid$calBP, "density" = spd$grid$PrDens, "ypoint" = Ypoint$ypoint)
#Create subset of growthdata excluding rows outside the timeframe 4700-3550 cal BCE (i.e. 6750-5600 cal BP from grid)
growthdata2 <- growthdata[-c(1:5300, 6452:10201), ]
#Easy linear method
fit <- fit_easylinear(growthdata2$ypoint, growthdata2$density, h = 300)

#plot
plot(fit)
lines(fit, pch = "+", col = "red")
plot(fit, log = "y")
lines(fit, pch = "+", col = "red")

#Summary
summary(fit)
coef(fit)
