
## Intro to iNEXT: Extrapolation and Interpolation of Hill Numbers

## Setting up the prep

## install iNEXT package from CRAN
install.packages("iNEXT")

## install the latest version from github
install.packages('devtools')
library(devtools)
install_github('JohnsonHsieh/iNEXT')
library(iNEXT)
library(dplyr)

data(spider)
head(spider)

out <- iNEXT(spider, q=c(0, 1, 2), datatype = "abundance", endpoint = 500) #q is the variable that denotes how much weight common obs get
names(out)
head(out$iNextEst)
out$iNextEst$coverage_based
out$iNextEst$size_based

ggiNEXoutggiNEXT(out, type=1, facet.var="Assemblage")
ggiNEXT(out, type=1, facet.var="Order.q", color.var="Assemblage")

## Not run:
# display black-white theme
ggiNEXT(out, type=1, facet.var="Order.q", grey=TRUE)

# S3 method for class 'iNEXT'
plot(out, type=1)
## End(Not run)

ggiNEXT(out, type=1, facet.var="Order.q", color.var="Assemblage")


ggiNEXT(out, type=3, facet.var="Assemblage")
ggiNEXT(out, type=3, facet.var="Order.q", color.var="Assemblage")



#### Working with my data

div.mat <- snakes.sur %>%
  group_by(Station, Species) %>% 
  tally()

div.mat <- div.mat %>%
  na.omit()


div.mat <- div.mat %>% 
  pivot_wider(names_from = Station, 
              values_from = n, 
              values_fill = 0) %>%
  column_to_rownames(var = "Species")


out2 <- iNEXT(div.mat, q=c(0, 1, 2), datatype = "abundance") #q is the variable that denotes how much weight common obs get

out2$DataInfo

cv_bases_est <- out2$iNextEst$coverage_based

ggiNEXT(out2, type = 1, facet.var = "Order.q", color.var = "Assemblage")


# Determine where to select m, run genus analyses with ^ and then maybe try with guild stuff

























