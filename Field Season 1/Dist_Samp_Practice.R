## Intro to R Basics Tutorial

# generate values from normal distribution
dists <- rnorm(n = 50, mean = 0, sd = 3)
dists
head(dists)
str(dists)
min(dists)
max(dists)
summary(dists)

hist(dists)
#making it have more intervals with bins

hist(dists, breaks = 15)
abline(v = 0, col = "red") #how can this be applied to trails that are more random than transects

posdists <- abs(dists) #make negative values into positive values, since distance signs don't matter

hist(posdists, xlab = "Distance")

#now create break points for bin intervals

setbreaks <- seq(from = 0, to = 8, by = .5) #make sequence from 0-8 increasing by .5
hist(posdists, breaks = setbreaks, xlab = "Distance")

#now check number of observations (p = n/N) which is detection prob. = #detected/#we should have seen w/ perfect detectability
length(posdists)

#now make n into something
n <-length(dists)


## The number of observations, n = 50

# The parameter N can be obtained using the histogram as shown below; read off the maximum
# frequency (say it is 9, but 8 for me) and then multiply this by the number of possible intervals,
# including intervals where no distances were recorded - in the example below, the number of intervals
# is 16. Note that your distances will be different to the one shown in this document and so use
# the values relevant to your data.

# Total # observations in the strip 
N <- 8 * 16

#detection probability 
p <- n/N
p
# seems to be .390625

#Isolating truncate distances, see how they affect probability

truncdists <- posdists[posdists <= 6]

truncn <- length(truncdists)
# The number of distances <=6 is 47
hist(truncdists, breaks=seq(0, 6, 0.5), xlab="Distance", main="")
truncN <- 9 * 12
truncp <- truncn/truncN
truncp
## The prob. of detection with truncation is 0.4166667, detection increases as you remove sightings that were further away


library(Distance)

#Fit HN model, no adjustments terms, half-normal key function specified
ds(posdists, key = "hn", adjustment = NULL)

# Fit a half-normal detection function, saves model for later, quiet argument prevents any printing
dsmodel <- ds(posdists, key="hn", adjustment=NULL, quiet=TRUE)

#Summary of detection function
summary(dsmodel)

# p estimate is .525, our OG was .391, so not super close

# Plot detection function 
plot(dsmodel)

#truncate distances again for new model

dstrunc <- ds(posdists, key = "hn", adjustment = NULL, truncation = 6)
summary(dstrunc)

# p here is .937, with truncation earlier it was .417, so also not that close


##### MY DATA ######

library(dplyr)

colnames(snake_sur) <- as.character(snake_sur[1,])
snake_sur <- snake_sur[-c(1:2),] #prelim cleaning to remove NAs

snake_sur <- snake_sur[!is.na(snake_sur$Species), ] #removing 6 nights of no snakes


distance_data <- snake_sur[, c("Station", "Species", "Distance_From_Trail_m", "Reptile_ID")] #just show these columns


distances_TBS <- distance_data[distance_data$Station == "TBS", ] #filter by station and split the data
distances_YRS <- distance_data[distance_data$Station == "YRS", ]


TBS_dists <- as.numeric(distances_TBS$Distance_From_Trail_m)
YRS_dists <- as.numeric(distances_YRS$Distance_From_Trail_m) #making vectors

summary(TBS_dists)
summary(YRS_dists)

par(mfrow = c(1,2))

hist(TBS_dists, breaks = 15)

hist(YRS_dists, breaks = 15)

setbrks1 <- seq(from = 0, to = 8, by = 0.5) #make break points
setbrks2 <- seq(from = 0, to = 5, by = 0.5)

hist(TBS_dists, breaks = setbrks1, xlab = "Distance")
hist(YRS_dists, breaks = setbrks2, xlab = "Distance") #plotting with new breaks

length(TBS_dists)
length(YRS_dists)

n1 <- length(TBS_dists) #31 observations here
n2 <- length(YRS_dists) #23 observations here


N1 <- 9 * 16
N2 <- 8 * 10

phat1 <- n1/N1
phat1

phat2 <- n2/N2
phat2

# Truncating for TBS

truncdists <- TBS_dists[TBS_dists <= 5]

truncn <- length(truncdists)
truncn #29

par(mfrow = c(1,1))
hist(truncdists, breaks = seq(0, 5, .5), xlab = "Distance")


truncN <- 9 * 10

truncp <- truncn/truncN
truncp # .322

