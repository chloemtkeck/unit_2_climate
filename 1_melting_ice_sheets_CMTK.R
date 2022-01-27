## Chloe Keck MSCI 758 01-26-2022
## Following along with class 

ant_ice_loss = read.table(file = "data/antarctica_mass_200204_202111.txt",
                          skip = 31, sep = "", header = FALSE, col.names = c("decimal_date", "mass_gt", "sigma_Gt"))
##file = file name, skip = how many lines down the data starts, sep = how you want to separate data, header=whether
## header is contained in the file, col.names = what you want to name data 

head(ant_ice_loss)
## shows you the first 6 rows of data 
tail(ant_ice_loss)
## shows last 6 

grn_ice_loss = read.table(file = "data/greenland_mass_200204_202111.txt",
                          skip = 31, sep = "", header = FALSE, col.names = c("decimal_date", "mass_gt", "sigma_Gt"))

head(grn_ice_loss)
dim(grn_ice_loss)
## dimensions 
summary(grn_ice_loss)

plot(mass_gt~decimal_date, data=ant_ice_loss)
## visualize y~x, data tells where its coming from

plot(mass_gt~decimal_date, data=grn_ice_loss, ylab="Greenland Mass Loss (Gt)", xlab="Date (Decimal)")
## ylab = label on y axis, xlab = label on x axis

plot(mass_gt~decimal_date, data=ant_ice_loss, type="l")
lines(mass_gt~decimal_date, data=grn_ice_loss, col="red")
## run two lines together to include both, type = type of plat (l=line), col = color 

min(grn_ice_loss$mass_gt)
## determines minimum data point in specific dataset and specific variable 

plot(mass_gt~decimal_date, data=ant_ice_loss, type="l", ylim=c(0, -5191.1))
lines(mass_gt~decimal_date, data=grn_ice_loss, col="red")
## flips the axis, so change 

plot(mass_gt~decimal_date, data=ant_ice_loss, type="l", ylim=c(-5191.1, 0))
lines(mass_gt~decimal_date, data=grn_ice_loss, col="red")
## hard coding a number "-5191.1"

grn_min = min(grn_ice_loss$mass_gt)
## creating variable eliminates hard coding 

range(grn_ice_loss$mass_gt)
## determines range of data, can use as ylim so you dont have to edit a bunch 

plot(mass_gt~decimal_date, data=ant_ice_loss, type="l", ylim=c(range(grn_ice_loss$mass_gt)))
lines(mass_gt~decimal_date, data=grn_ice_loss, col="red")
## includes range as ylim 

data_break = data.frame(decimal_date=2018, mass_gt=NA, sigma_gt=NA)
data_break
## accounts for gap in data/missions , add in NA 

ant_ice_loss_with_NA = rbind(ant_ice_loss,data_break)

data_break = data.frame(decimal_date=2018.0, mass_Gt=NA, sigma_Gt=NA)
data_break

ant_ice_loss_with_NA = rbind(ant_ice_loss, data_break) # Merge ant_ice_loss data frame with our NA point
tail(ant_ice_loss_with_NA) # Our NA value in 2018 is now the last row of our data frame

order(ant_ice_loss_with_NA$decimal_date) # Use order() to list the indices of the data after its sorted from smallest to biggest
ant_ice_loss_with_NA = ant_ice_loss_with_NA[order(ant_ice_loss_with_NA$decimal_date),] # Reorder the data frame, sorting by date

#Repeat with Greenland data.frame
grn_ice_loss_with_NA = rbind(grn_ice_loss, data_break) # Merge grn_ice_loss data frame with our NA point
grn_ice_loss_with_NA = grn_ice_loss_with_NA[order(grn_ice_loss_with_NA$decimal_date),]

plot(mass_Gt ~ decimal_date, data=ant_ice_loss_with_NA, ylab="Antarctica Mass Loss (Gt)", type='l', ylim=range(grn_ice_loss_with_NA$mass_Gt, na.rm=TRUE)) +
  lines(mass_Gt ~ decimal_date, data=grn_ice_loss_with_NA, type='l', col='red') 


###there si something wrong with my data, go home and practice and re do 
