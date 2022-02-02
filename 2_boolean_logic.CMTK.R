## Boolean logic 2.1.22

vec = c(1, 0, 2, 1)
vec[c(F, T, T, F)]


x= 5 
x < 4
x > 3
x %in% vec
x = 2
x %in% vec
x == 3
x == vec

world_oceans = data.frame(ocean = c("Atlantic", "Pacific", "Indian", "Arctic", "Southern"),
                          area_km2 = c(77e6, 156e6, 69e6, 14e6, 20e6),
                          avg_depth_m = c(3926, 4028, 3963, 3953, 4500))
head(world_oceans)

world_oceans$avg_depth_m > 4000 # test condition-- how many oceans have an average depth greater than 4000

world_oceans[world_oceans$avg_depth_m>4000, ]
world_oceans$ocean[world_oceans$avg_depth_m>4000] ##only shows ocean name 


sum(world_oceans$avg_depth_m>4000) # tells you how many oceans have >4000 depth 


3 == 1+2
0.3 == 0.1+0.2
0.3 - (0.1+0.2)

error_threshold = 0.0000000001
abs(0.3-(0.1+0.2)) < error_threshold


### boolean operators 

world_oceans[world_oceans$avg_depth_m < 4000 & world_oceans$area_km2 < 5e6, ]


vec = c(1, 2, 3, NA)
vec == NA
is.na(vec)

any(is.na(vec))
all(is.na(vec))
