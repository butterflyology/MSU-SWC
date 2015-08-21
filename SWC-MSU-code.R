# Code for SWC at MSU 20-08-2015
# Day 1

# set the working directory (rstudio allows you to set this with the "Session" tab)
setwd("~/MSU-SWC")

# read the .csv (comma seperated value) file
read.csv("inflammation-01.csv", header = FALSE)

# assign a value to an object / variable
weight_kg <- 23 
weight_kg

# you can apply functions to a variable
2.2 * weight_kg
weight_kg <- 100
weight_kg

weight_lb <- weight_kg * 2.2
weight_lb 

# read the data in and assign it to a variable
dat <- read.csv("inflammation-01.csv", header = FALSE) 
# header = FALSE says that the first row of the file contains data
dim(dat)
head(dat)
tail(dat)
str(dat)

# identify parts of an object by index, [rows, columns]
dat[1, 1]
dat[20, 6]

dat[3:7, 5]
dat[3:7, 7:9]
dat[c(3, 6, 12), c(1, 5:7, 9)]
dat[6, ]
dat[, 17]

patient_1 <- dat[1, ]
max(patient_1)
min(patient_1)
range(patient_1)

max(dat[1, ])
sd(dat[1, ])

# In R, there are many ways to do the same thing
rowMeans(dat)
colMeans(dat)

# apply takes three arguements, 1 - the object, 2 - the index (1 is by rows, 2 is by columns, 3 - the function)
apply(dat, 1, mean)
apply(dat, 2, mean)

# if you want letters, they need to have quotes around them
animal <- c(m, n)
animal <- c("m", "o", "n", "k", "e", "y")
animal
# this is a vector of characters, use length() to get "dimensions"
animal[1:3]
animal[4:6]
animal[-1]
animal[-4]

avg_patient_inflammation <- apply(dat, 1, mean)
avg_day_inflammation <- apply(dat, 2, mean)
avg.day.inflammation <- apply(dat, 2, mean)

plot
?plot

# the basic plot function needs two arguments, what you want on the X-axis and the Y-axis. In this case, R interprets that you want the columns for the Y-axis
plot(avg_day_inflammation)
plot(apply(dat, 2, mean))

plot(avg_day_inflammation)
plot(avg_day_inflammation, pch =19, ylab = "Average Inflammation", las = 1) # the basic plot function can create excellent figures when you use additional arguments.

max_day_inflammation <- apply(dat, 2, max)
max_day_inflammation
plot(max_day_inflammation)

min_day_inflammation <- apply(dat, 2, min)
plot(min_day_inflammation)

# Data types in R
# character, numeric, integer, logical, complex
class(dat)
typeof(animal)
typeof(dat[, 1])

animals <- as.numeric(animal)

y <- 1:10
y
typeof(y)

z <- as.numeric(y)
typeof(z)
z

z <- c(z, "Tracy")

# make your own matrix
m <- matrix(nrow = 2, ncol = 2)
m
dim(m)

m <- matrix(1:6, nrow = 2, ncol = 3)
m

x <- 1:3
y <- 10:12

cbind(x, y)
rbind(x, y)

mdat <- matrix(c(1, 2, 3, 11, 12, 13), nrow = 2, ncol = 3, byrow = TRUE)
mdat

# lists
x <- list(1, "a", TRUE, 1+4i)
x
x[1, 1]
x[[1]]

# data frame - rows and columns must have same length
dat <- data.frame(id = letters[1:10], x = 1:10, y = 11:19)

dat <- data.frame(id = letters[1:10], x = 1:10, y = 11:20)
dat
dat[, 1]
dat$id
str(dat)
head(dat)
tail(dat)
summary(dat)
names(dat)

#functions - user writen functions are a fundamental part of R and one of its main strengths

# we are going to create a series of functions to convert among temperature scales. Note the use of parentheses to ensure the correct order of operations 
fahrenheit_to_kelvin <- function(temperature){
  kelvin <- ((temperature - 32) * (5 /9)) + 273.15
  return(kelvin)
}
fahrenheit_to_kelvin(temperature = 0) # note here that we are specifically calling the variable temp_fahrenheit. 
fahrenheit_to_kelvin # by calling the function wihtout the parentheses we can see the its code.

kelvin_to_celcius <- function(temperature){
  celcius <- temperature - 273.15
  return(celcius)
}
kelvin_to_celcius(273.15)

# here we can make a function that uses two previously written functions
fahrenheit_to_celcius <- function(temperature){
 temp_kelvin <- fahrenheit_to_kelvin(temperature)
 result <- kelvin_to_celcius(temp_kelvin)
 return(result)
}
fahrenheit_to_celcius(32)
fahrenheit_to_celcius(100)
range(1:20)

# want to find the span of 1:20 (the span is the max - min)
span <- function(a){
  diff <- max(a) - min(a)
  return(diff)
}
span(1:20)
