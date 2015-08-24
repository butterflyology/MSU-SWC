# Code for SWC at MSU - Chris Hamm
# Day 1 (20-Aug-2015)

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

# exploring the plot function a bit more
sampl <- read.csv("sample.csv", header = TRUE)
head(sampl)

# lets look at the association between Age and Anuerisms_q1 (note that both of these are continuous variables)
plot(sampl$Age, sampl$Aneurisms_q4, ylab = "Q4 Aneurisms", xlab = "Age", pch = 19, las = 1)
# look up the help function page for plot by typing "?plot" in the console to see what each of the arguments does 

# Day 2 (21-Aug-2015)
setwd("~/MSU-SWC")
samp <- read.csv("sample.csv", header = TRUE)
head(samp)
str(samp)


hist(samp$Aneurisms_q1, xlim = c(50, 400), col = "grey")
hist(samp$Aneurisms_q4, add = TRUE)

# pdf(file = "t-test-demo.pdf", bg = "white")
plot(samp$Aneurisms_q1, samp$Aneurisms_q4, pch = 19)
# dev.off()

t.test(samp$Aneurisms_q1, samp$Aneurisms_q4, alternative = "two.sided")

install.packages("dplyr")
install.packages("devtools")
library("devtools")
install_github("rmcelreath/rethinking")


install.packages("MEDUSA_0.93-4-25.tar.gz", type = "source", repos = NULL, dependencies = TRUE)
update.packages()


# When R undergoes a major update, the packages that you have installed will need to be reinstalled to work properly. Reinstalling every package can be tedious. I have written a simple script to help you reinstal all your packages. This script makes a file with all the package names in the old version of R. You then install the new version of R and run the second part of the script. The file "udateR" in this repo contains an independent copy of the script.

#--run in the old version of R
setwd("~/MSU-SWC")
packages <- installed.packages()[,"Package"]
save(packages, file="Rpackages.3.2.2")

#--run in the new version
setwd("~/MSU-SWC")
load("Rpackages.3.2.2")
for (p in setdiff(packages, installed.packages()[,"Package"]))
install.packages(p)

# To remove all packages except the base
#remove.packages(packages)



# using functions to analyze multiple data sets
analyze <- function(filename){
  # compute the ave, min, and max for inflammation over time
  par(mfrow = c(3, 1))
  dat <- read.csv(file = filename, header = FALSE)
  avg_day_inflammation <- apply(dat, 2, mean)
  plot(avg_day_inflammation)
  max_day_inflammation <- apply(dat, 2, max)
  plot(max_day_inflammation)
  min_day_inflammation <- apply(dat, 2, min)
  plot(min_day_inflammation)
  par(mfrow = c(1, 1))
}
analyze("inflammation-01.csv")


best_practice <- c("Let", "the", "computer", "do", "the", "work")

print_words <- function(sentence){
  print(sentence[1])
  print(sentence[2])
  print(sentence[3])
  print(sentence[4])
  print(sentence[5])
  print(sentence[6])
}
print_words(best_practice)

print_words <- function(sentence){
  for(word in sentence){
    print(word)
  }
}
print_words(best_practice)

for(variable in something){
  do thing with variable
}

for(word in best_practice){
  print(word)
}  

vowels <- c("a", "e", "i", "o", "u")
len <- 0
for(i in vowels){
  len <- len + 1
}
len
length(vowels)

library("dplyr")

surveys <- read.csv("portal_data_joined.csv", header = TRUE)
head(surveys)
str(surveys)
surveys$plot_id <- as.factor(surveys$plot_id)

# select takes columns
head(select(surveys, plot_id, species_id, weight))
# filter takes rows
filter(surveys, year == 1995)

# what if you want to use rows and columns

# pipes look like %>%

surveys %>% filter(weight < 5) %>% select(species_id, sex, weight)

surveys_sml <- surveys %>% filter(weight >= 5) %>% select(species_id, sex, weight)
head(surveys_sml)

# generate an object that contains samples before 1985, return sex and weight
surveys %>% filter(year < 1985) %>% select(species_id, weight)

# mutate - makes new columns based on something done to existing columns
surveys %>% mutate(weight_kg = weight / 1000) %>% head

surveys %>% mutate(weight_kg = weight / 1000) %>% filter(!is.na(weight)) %>% head

# group_by - for the split-apply-combine paradigm
surveys %>% group_by(sex) %>% tally()

# mean weight by sex?
surveys %>% group_by(sex) %>% summarise(mean_weight = mean(weight))

surveys %>% group_by(sex) %>% summarise(mean_weight = mean(weight, na.rm = TRUE))

surveys %>% group_by(sex) %>% summarise(mean_weight = mean(weight, na.rm = TRUE)) %>% filter(!is.na(mean_weight))

surveys %>% group_by(sex, species_id) %>% summarise(mean_weight = mean(weight, na.rm = TRUE)) %>% filter(!is.na(mean_weight))

test1 <- surveys %>% group_by(sex, species_id) %>% summarise(mean_weight = mean(weight, na.rm = TRUE), min_weight = min(weight, na.rm = TRUE)) %>% filter(!is.na(mean_weight))

write.table(test1, file = "Test1.txt", sep = "\t", eol = "\r")
