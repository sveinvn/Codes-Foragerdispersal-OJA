#Load the workpackages
library(rcarbon)

sweden_dates <- calibrate(x=c(5680), errors=c(75))
eastern_dates <- calibrate(x=c(5695,5645,5510,5505,5480,5423,5187,5080,5010,5400,5325,5325,5325,5095,5373,5353,4911,4667,4583,5390,5330,5350,5334,5339,5351,5249,5190,5057,5055,5021,5017,5010,4939,4931,4891,4813,5030,4885,5030,5025,4905,4710,4570,4535,4475,5054,5054,5020,5020,4965,4965,4930,4905,4885,4970,4920,4915,4830,4735,4685,4665,4655), errors=c(50,45,105,45,35,37,35,40,40,55,40,45,50,40,34,101,39,39,38,75,70,70,31,37,31,32,100,28,27,28,29,27,47,31,31,46,80,80,30,40,40,40,40,45,40,85,35,35,45,35,40,40,35,35,40,90,25,50,50,30,30,35))
western_dates <- calibrate(x=c(5570,5550,5440,5520,5490,5430,5430,5220,5165,5100,5090,4980,4930), errors=c(70,80,120,110,130,100,60,70,105,80,180,30,30))

spd1 <-spd(x=sweden_dates,timeRange=c(7550,4850),spdnormalised=TRUE,runm=50)
spd2 <-spd(x=eastern_dates,timeRange=c(7550,4850),spdnormalised=TRUE,runm=400)
spd3 <-spd(x=western_dates,timeRange=c(7550,4850),spdnormalised=TRUE,runm=400)

plot(spd1,calendar="BCAD")
plot(spd2,calendar="BCAD",add=TRUE,type="simple",col="red",lwd=2,lty=2)
plot(spd3,calendar="BCAD",add=TRUE,type="simple",col="blue",lwd=2,lty=2)

legend("topleft", legend=c("Western Sweden (n=1)", "Eastern Norway (n=63)", "Western Norway (n=13)"), col=c("grey", "red", "blue"), lwd=2)
