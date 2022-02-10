## 02-10-2022 

url = 'https://data.giss.nasa.gov/gistemp/graphs/graph_data/Global_Mean_Estimates_based_on_Land_and_Ocean_Data/graph.txt'
temp_anomaly = read.delim(url, skip=5, sep="", header=FALSE, col.names = c("Year", "No_Smoothing", "Lowess_5"))

head(temp_anomaly)
tail(temp_anomaly)

temp_1998 = temp_anomaly$No_Smoothing[temp_anomaly$Year==1998]
temp_2012 = temp_anomaly$No_Smoothing[temp_anomaly$Year==2012]
temp_1998
temp_2012

temp_1880 = temp_anomaly$No_Smoothing[temp_anomaly$Year==1880]
temp_2020 = temp_anomaly$No_Smoothing[temp_anomaly$Year==2020]

plot(No_Smoothing~Year, data=temp_anomaly, ylab="Global Mean Temp Anomaly (C), type=b")
lines(Lowess_5~Year, data=temp_anomaly, col="red")
abline(v=1998, lty="dashed")
abline(v=2012, lty="dashed")
lines(c(temp_1998, temp_2012)~ c(1998, 2012), col = "blue", lwd=3)

## create rolling average user defined function 

data = c(1, 3, 5, 7, 9, 11, 13, 15)
## user passes vectr oof ordered time series data 
calc_rolling_avg = function(data, moving_window=5){
  result = rep(NA, length(data)) ## initializing results vector
  for(i in c(moving_window:length(data))){
    result[i] = mean(data[seq(from=(i-moving_window), to=i)])
  }
  return(result)
}

calc_rolling_avg(data, moving_window = 2)

temp_anomaly_5yr = calc_rolling_avg(temp_anomaly$No_Smoothing)
temp_anomaly_5yr
temp_anomaly$avg_5_yr = temp_anomaly_5yr
head(temp_anomaly)

plot(No_Smoothing~Year, data=temp_anomaly, type="b")
lines(avg_5_yr~Year, data=temp_anomaly, col="red")

## add 10 year 
temp_anomaly_10yr = calc_rolling_avg(temp_anomaly$No_Smoothing, moving_window = 10)
temp_anomaly$avg_10_yr = temp_anomaly_10yr

plot(No_Smoothing~Year, data=temp_anomaly, type="b")
lines(avg_5_yr~Year, data=temp_anomaly, col="red")
lines(avg_10_yr~Year, data=temp_anomaly, col="blue")



