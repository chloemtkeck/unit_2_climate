## Chloe Keck MSCI 758 01-27-2022 
## redoing class work to see if it will actually run 

ant_ice_loss = read.table(file = "data/antarctica_mass_200204_202111.txt",
                          skip = 31, sep = "", header = FALSE, col.names = c("decimal_date", "mass_gt", "sigma_Gt"))
grn_ice_loss = read.table("data/greenland_mass_200204_202111.txt", skip=31, sep="", header = FALSE, col.names = c("decimal_date", "mass_Gt", "sigma_Gt")) # Greenland ice mass loss

head(ant_ice_loss)
head(grn_ice_loss)
dim(ant_ice_loss)
summary(ant_ice_loss)

## plot antarctica ice loss 
plot(mass_gt ~ decimal_date, data=ant_ice_loss, ylab="Antarctica Mass Loss (Gt)")
## plot greenland ice loss 
plot(mass_Gt ~ decimal_date, data=grn_ice_loss, ylab="Greenland Mass Loss (Gt)")

##plot together as lines 
plot(mass_gt ~ decimal_date, data=ant_ice_loss, ylab="Ice Sheet Mass Loss (Gt)", type='l') 
lines(mass_Gt ~ decimal_date, data=grn_ice_loss, col='red') 

plot(mass_gt ~ decimal_date, data=ant_ice_loss, ylab="Antarctica Mass Loss (Gt)", type='l', ylim=range(grn_ice_loss$mass_Gt)) +
  lines(mass_Gt ~ decimal_date, data=grn_ice_loss, type='l', col='red') 

#Create data.frame with an NA between the GRACE missions. Column names must match so it will merge with ant and grn data
data_break = data.frame(decimal_date=2018.0, mass_Gt=NA, sigma_Gt=NA)
data_break = data.frame(decimal_date=2018.0, mass_gt=NA, sigma_Gt=NA)
data_break

#Add NA data point to the Antarctica ice trends data frame
ant_ice_loss_with_NA = rbind(ant_ice_loss, data_break) # Merge ant_ice_loss data frame with our NA point
tail(ant_ice_loss_with_NA) # Our NA value in 2018 is now the last row of our data frame
order(ant_ice_loss_with_NA$decimal_date) # Use order() to list the indices of the data after its sorted from smallest to biggest
ant_ice_loss_with_NA = ant_ice_loss_with_NA[order(ant_ice_loss_with_NA$decimal_date),] # Reorder the data frame, sorting by date

#Repeat with Greenland data.frame
grn_ice_loss_with_NA = rbind(grn_ice_loss, data_break) # Merge grn_ice_loss data frame with our NA point
grn_ice_loss_with_NA = grn_ice_loss_with_NA[order(grn_ice_loss_with_NA$decimal_date),]

plot(mass_gt ~ decimal_date, data=ant_ice_loss_with_NA, ylab="Antarctica Mass Loss (Gt)", type='l', ylim=range(grn_ice_loss_with_NA$mass_Gt, na.rm=TRUE)) +
  lines(mass_Gt ~ decimal_date, data=grn_ice_loss_with_NA, type='l', col='red') 

head(ant_ice_loss_with_NA)
plot(mass_gt ~ decimal_date, data=ant_ice_loss_with_NA, ylab="Antarctica Mass Loss (Gt)", xlab="Year", type='l') +
  lines((mass_gt+2*sigma_Gt) ~ decimal_date, data=ant_ice_loss_with_NA, type='l', lty='dashed') +
  lines((mass_gt-2*sigma_Gt) ~ decimal_date, data=ant_ice_loss_with_NA, type='l', lty='dashed') 
