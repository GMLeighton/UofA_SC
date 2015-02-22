## ggplot2 learning phase ##
##02_22_2015##
##Duchess##

install.packages("ggplot2", depedencies = TRUE)
install.packages("plyr")
install.packages("ggthemes")
install.packages("reshape2")

library("ggplot2")
library("plyr")
library

## Make sure to call these into activity using the library() command ##

head(iris)

##iris is built in R dataset##
iris[1:2,]

## Can use ddply from plyr to subset and get means##
ddply(iris, .(Species), summarize, mean.Sep.Wid = mean(Sepal.Width))

## Melt from reshape allows you to subset out and do more straightforward things##
df = melt(iris, id.vars = "Species")
df[1:2,]
##Can then put them back in order##
dcast(df, Species ~ variable, mean)


## We have entered data and aesthetics, i.e. how we map the data##
myplot = ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width))
summary(myplot)


## Make iris dataset my own ##

MyIris = iris

## Geom will prescribe how the data is plotted based on data and aesthetics ##

myplot = ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point()


## Can also do myplot + geom_point()##

## The point size is a setting, not aesthetic ##

myplot + geom_point(size = 3)

## Now can drop some of the unnecessary stuff while adding color in aesthetics ##
myplot = ggplot(data = iris, aes(Sepal.Length,Sepal.Width, color = Species)) + geom_point(size = 3)



## Now can drop some of the unnecessary stuff while adding color in aesthetics ##
myplot = ggplot(data = iris, aes(Sepal.Length,Sepal.Width, color = Species)) + 
  geom_point(aes(shape = Species), size = 3)


## Now work with diamonds dataset ##
d1 = diamonds
d2 <- diamonds[sample(1:dim(diamonds)[1], 1000), ]

d1plot = ggplot(data = d1, aes(carat, price, color = color)) + geom_point(size = 3)
d2plot = ggplot(data = d2, aes(carat, price, color = color)) + geom_point(size = 3)

## Next set of grammar is stats ##

library(MASS)

## Have to factor race since it is coded as numbers in this package ##
BirthBoxplot = ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot()
summary(BirthBoxplot)

## Next part of ggplot grammar: FACETS ##

## Allows us to subset the data and make subplots for certain sets of the data ##
## the dot in facet grid means that we are cutting up by species and nothing else ##
myplot = ggplot(data = iris, aes(Sepal.Length,Sepal.Width, color = Species)) + 
  geom_point(aes(shape = Species), size = 3) +
  facet_grid(Species ~ .)


## Can flip the axes ##
myplot = ggplot(data = iris, aes(Sepal.Length,Sepal.Width, color = Species)) + 
  geom_point(aes(shape = Species), size = 3) +
  facet_grid(. ~ Species)

## Can Wrap facets ##

myplot = ggplot(data = iris, aes(Sepal.Length,Sepal.Width, color = Species)) + 
  geom_point(aes(shape = Species), size = 3) +
  facet_wrap(~ Species)






