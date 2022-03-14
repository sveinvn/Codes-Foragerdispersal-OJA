#Load the workpackages
library(rcarbon)

sweden_dates <- calibrate(x=c(5680), errors=c(75))
eastern_dates <- calibrate(x=c(5510,5390,5330,5240,5040,4990,5505,5645,5350,5353,4911,4667,4583,5373,5400,5325,5325,5325,5095,5695,5645,5351,5339,5334,5249,5480,5423,5187,5080,5010), errors=c(105,75,70,40,40,40,45,80,70,101,39,39,38,34,55,50,45,50,40,50,45,31,37,31,32,35,37,35,40,40))
western_dates <- calibrate(x=c(5540,5432,5217,5205,5430,4930,4980,5490,5570,5440,5550,5100,5090,5430,5220,5520,5460,5420,5330,5250,5250,5250,5230,5220,5150,5165), errors=c(30,38,33,29,100,30,30,130,70,120,80,90,180,60,70,110,30,30,30,30,30,30,30,30,30,105))

spd1 <-spd(x=sweden_dates,timeRange=c(7550,4850),spdnormalised=TRUE,runm=50)
spd2 <-spd(x=eastern_dates,timeRange=c(7550,4850),spdnormalised=TRUE,runm=300)
spd3 <-spd(x=western_dates,timeRange=c(7550,4850),spdnormalised=TRUE,runm=300)

plot(spd1,calendar="BCAD")
plot(spd2,calendar="BCAD",add=TRUE,type="simple",col="red",lwd=2,lty=2)
plot(spd3,calendar="BCAD",add=TRUE,type="simple",col="blue",lwd=2,lty=2)

legend("topleft", legend=c("Western Sweden (n=1)", "Eastern Norway (n=30)               ", "Western Norway (n=26)"), col=c("grey", "red", "blue"), lwd=2)
