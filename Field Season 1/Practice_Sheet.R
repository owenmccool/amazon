# Module 1 Videos: Intro to R

as.character(5.3)
as.character(TRUE)
as.character(FALSE)
as.character(3L)

as.numeric("45")
as.numeric(TRUE)
as.numeric(FALSE)
as.numeric(7L)

as.logical("TRUE")
as.logical("FALSE")
as.logical(3)
as.logical(-5)
as.logical(0)

as.integer(3.3)
as.integer("5")
as.integer(TRUE)


res1 = 1.5 + 4L
res1
class(res1)

res2 = 1.5 + TRUE
res2
class(res2)

res3 = 5L + TRUE
res3
class(res3)

TRUE + TRUE
TRUE + FALSE

1.5 + "5"


na_var = NA
na_var
na = 3

class(na_var)

na_var = as.character(na_var)
na_var
class(na_var)

inf_val = 5/0
class(inf_val)

Inf=3


inf_log = as.logical(Inf)
inf_log

inf_char = as.character(Inf)
inf_char

as.numeric(inf_log)
as.numeric(inf_char)


0/0
sqrt(-1)
Inf+Inf
Inf-Inf
Inf*0


NULL
my_var = NULL
my_var

class(my_var)

result = NA + 4
result 

result = NULL + 4
result


# Module 2 videos: Data Structures #


temperature = 75 #fahrenheit
temperature_C = (temperature-32)*5/9
temperature_C


# vector for lizard's weights
lizards_weight = c(2.25, 4.45, 1.75) # in grams
str(lizards_weight)
lizards_weight[2]

# lizard size vector
lizards_size = c("medium", "large", "small")
str(lizards_size)
lizards_size[2]

# fixing potential mistakes with replacing vector numbers
lizards_weight[2] <- 3.45
lizards_weight

# fixing mistakes with underestimation of weight by .1g on miscalibration
lizards_weight <- lizards_weight + 0.1
lizards_weight


# VECTORS #

c(1,2,3,4)
#c stands for combine
nums = c(1,2,3,4)
nums

names=c("bob", "alice")
names
class(names)


mixed_vec =c(5,-1,"cat")
mixed_vec

bools = c(TRUE,TRUE,FALSE,TRUE)
bools

not_bools = c(TRUE,TRUE,FALSE,TRUE,1)
not_bools

#no mixed data types in a vector, but can have NA
nums = c(4,-1,NA,3.3)
nums

animals=c(NA,"cow","goat")
animals



nums = c(1,NaN,2,Inf,3)
nums

#the numerics have been converted to character strings
animals=c(NaN,Inf,"cow","goat")
animals

#if you use special terms in a logical vector, different conversion
c(FALSE,NaN,Inf,FALSE,NA,TRUE) #now logical true/false values are numeric

#vector with single value
c(5)
5


# COMBINING VECTORS #

a=13

nums = c(1.1,-2,0.3,7/2,abs(-4),a,-1*sqrt(3)+a)
nums
nums=round(nums, digits=2)
nums

nums2 = c(a,2,nums)
nums2

#GENERATING VECTORS#

nums=c(1,2,3)
nums

nums=1:3
nums

nums=1:140
nums

nums=1.3:10 #increment of not exact # won't be included
nums

?seq

nums=seq(1.3,10)
nums

nums=seq(1.3,10,2.1)
nums

nums=seq(1.3,-10,-2.1) #sign has to make sense on decrement number
nums


?rep


nums=2:4


rep(nums,times=5) #replicates sequence 5 times

rep(nums,length.out=5) #replicates until we hit critical value of 5 elements


a=c("cat","dog")
a

rep(a,times=5)
rep(a,length.out=5)


# RANDOM VECTORS #

?runif

random_nums=runif(7)
random_nums


random_nums=runif(7,-3,13)
random_nums

#function for randomly sampling values from vector
?sample

vec=1:7 
vec

rand_sample=sample(vec,size=3) #samples from vector above
rand_sample

vec=c("Alice","Bob","Carlie","Dan","Fiona","George")
vec

rand_sample=sample(vec,size=3) 
rand_sample
#you won't get same name twice in a result

rand_sample=sample(vec,size=10) #needs a modifier with "replace"
rand_sample

rand_sample=sample(vec,size=10,replace=TRUE)
rand_sample

set.seed(13) #do this before using random numbers (pseudorandom)

random_num=runif(7)
random_num


#BUILT-IN VECTORS#

?Constants


LETTERS
a=LETTERS
a

LETTERS="hello"
LETTERS
month.name
LETTERS
letters
#extra practice
rand_sample=sample(letters,size=6)
rand_sample

#ACCESSING VECTORS#

months=month.name #equalling a variable for the list provided by R
months
#getting individual values from vector with [x]
months[7] #retrieving 7th month
months[3]

months[12]
months[13]

months[c(3,7,3)]
months[3,7,3] #error because not multi-dimensional

months

months[-1] #pretty mich "give me all the results of the vector except the first one"
months[-2:-11] #exclude everything but Jan and Dec

months
months[6] = "cow"
months

months[1:3]="dog" #replacing values with other values
months

months[1:8]=1:3te
months          #mixing numeric and char data in vector will lead to numeric changing to strings, why numers generated are ""


#VECTOR FUNCTIONS#

months=month.abb
months

?length
length(months)


?sort

sorted_months=sort(months)
sorted_months

sorted_months=sort(months,decreasing=TRUE)
sorted_months #reversing the alphabetical order

nums=sample(1:10,7,replace=TRUE)  #Drawing 7 numbers, ranged 1-10, and there can be duplicates
nums

sort(nums)


months
order(months).  #essentially says that the number order would be what happened if sorted alphabetically
sort(months)

months[order(months)]  #sort/order are similar functions in name

nums
unique(nums) #lets us find rare values in common value pools


# VECTOR MATH #

nums=c(9.5,8,4.7,1,6)
nums

nums +5
nums-7
nums*3
nums/2


nums
nums+1:5   #this adds 1st element of vector to 1st element of [list]

nums
nums + 1:2 #warning because our vector runs out of values early, R will recycle the values 

nums
nums + 1:10 #this is twice the length of what we did so R keeps adding until 1:10 has been used up

nums
sum(nums)
sum(nums)/length(nums)
mean(nums) #shortcut function

min(nums) #gets biggest/smallest numbers to find outliers and range
max(nums)

#dealing w/ missing data/ NAs
sum(c(nums,NA))
sum(c(nums,NA),na.rm=TRUE) #na.rm ignores NAs

nums
round(nums)
round(nums,digits=3)
sqrt(nums)
sin(nums)

#MATRICES#
#vectors w/ 2D instead of 1

?matrix
mat=matrix(0,nrow=3,ncol=5)
mat

mat=matrix(1:15,nrow=3,ncol=5)
mat

mat=matrix(1:15,nrow=3,ncol=5,byrow=TRUE)
mat


matrix(c("cat","dog"),3,3)

mat
mat[1]
mat[2]
mat[3] #shows which values are at the rank eg. 6 is the second value, 15 is the 15th

mat[1:3]
mat[c(5,15,5)] #our 5th value is 7, 15th is 15, 5th is 7


mat
mat[3,2] #gives us the value of row 3, column 2
mat[3,2:4] #gives us the value of row 3, columns 2, 3, and 4

mat[3,2:4, drop=FALSE] #if you need answer to be in form of vector, use drop parameter

mat
mat[2:3,2:4] =3
mat


mat
length(mat)
nrow(mat) 
ncol(mat)
dim(mat) #shortcut for below

c(nrow(mat),ncol(mat)) #same as dim(mat)


mat
mat*3

mat * 1:3 #trying it with a vector, goes in matrix top-down order for multiplying from 1 to 3

mat
mat %*% 1:5 #how you would do it with linear algebra (don't worry about it)

mat
mat + mat
mat*2


#More Matrices#

data=c("low","high","high","low","medium")

data
data_fac=factor(data)
data_fac

as.numeric(data_fac) #so high means 1, low means 2, medium means 3
as.character(data_fac) #factors can help make numbers words, vice versa when useful

levels(data_fac) #R always sorts this data alphabetically, not by natural order

data
f1=factor(data, levels=c("low","medium","high"))
f1
as.numeric(f1)

f2=factor(data_fac, levels=c("low","medium","high"))
f2
as.numeric(f2)



## LOGIC UNIT ## 

# Video 0: INTRO VID #

#simulated vector for dolphin data
dolphins <- c(261, 241, 275, 230, 265) #in Kg
#avg. weight 260 for males
dolphins > 260
dolphins[dolphins > 260] # from the vector 'dolphins' give me the exact weights that are greater than 260

# and/or operators (&, |)

#simulated vector of female dolphins data
dolphins_f <- c(190,200,185,189,189,210,195,220)
#which dolphins have a weight between 190 and 220kg?
#which dolphins weights are above the average weight AND below 220kg? (avg. female weight 190)
dolphins_f[dolphins_f > 190 & dolphins_f < 220]

#which dolphins weights are below avg. weight OR above 200Kg?
dolphins_f <- c(190,200,185,189,189,210,195,220)
dolphins_f[dolphins_f < 190 | dolphins_f > 200] #from dolphins_f, I want the data where the weights are less than 190 OR greater than 200

#Video 1: Logical Operators#

?logical

a = -3
b = 4.5
c = 4.5

a < b
a > b
b > a
b < a
b > c
c > b

4>5
17>a

result = 17 > c
result

a <= b
a >= b

b <= c
b >= c

a == b
b == c

a != b
b != c

!TRUE
!FALSE

a == b
!(a == b)


NA > 0
NA == 0
!NA

# Video 2: Logic Chains #

3 < 5 < 7
3 < 5

(3 < 5) < 7
TRUE < 7 #true is converted to 1, so 1 is less than 7, not intended purpose


TRUE & TRUE #both values must be true for it to be true
TRUE & FALSE
FALSE & FALSE

TRUE | TRUE #will return true if one side is true, false if both sides false
TRUE | FALSE
FALSE | FALSE

a = 3 < 5
a
b = 5 < 7
b

a & b #true since both sides are true

3 < 5 & 5 < 7 #less than and greater than signs calculated before & operator

5 < 3 | 5 > 7 #false because 5<3 is false, and 5>7 false
FALSE | FALSE

age = 7
species = "cat"

species == "cat" | species == "dog" & age < 7
TRUE | FALSE & FALSE
TRUE | FALSE
TRUE

species == "cat" | (species == "dog" & age < 7) #same as above

(species == "cat" | species == "dog") & age < 7
(TRUE | FALSE) & FALSE 
TRUE & FALSE 
FALSE

# Video 3: Vector Logic #

data = sample(-2:2, 20, TRUE) #vector from -2 to 2, 20 of them, replace = TRUE
data

data[TRUE]

data[c(TRUE, FALSE)] #retrieves every other number
data[c(TRUE, FALSE, FALSE)] #retireves every 3rd number

data
result1 = data < 0
result1 #says whether each number in sequence is less or greater than zero w/ true/false

length(data) == length(result1)

data[result1] #shows us all the negative values from original vector
data[data < 0] #same thing
 

animals = c("cat", "dog", "cat", "cat", "cat", "dog", "cat", "dog", "cat")
animals

cats = animals[animals == "cat"] #in vector animals, how many values equal to "cat"?
cats
length(cats) #how many in the vector?

data

mean(data[data > 0]) #mean of all data in vector that is greater than zero

# Video 4: Logical Functions #

animals = c("cat", "dog", "dog", NA, "dog", "cow", NA, "dog", "cat")
animals == "cat"
animals[animals == "cat"] #is.na function 

is.na(animals) #are our values missing?
animals_no_na = animals[!is.na(animals)] #keep all values that aren't na
animals_no_na

animals_no_na[animals_no_na == "cat"] #now this is correct, only two values instead of 4

animals[!is.na(animals) & animals == "cat"] #getting rid of NAs AND printing cats

animals
any(is.na(animals)) #says that there are some na
any(animals == "bird") #no birds, but results in 'NA' because the NAs in the vector could be birds if they weren't missing
any(animals == "bird", na.rm = TRUE) #removes NAs, then finds if there are any birds, comes out 'FALSE' 

#shortcut for any function
anyNA(animals)

animals
duplicated(animals) #FALSE is first time reading the value, TRUE means it has been repeated

animals[!duplicated(animals)] #now getting all animals that aren't duplicated, each one only once
unique(animals)

sum(duplicated(animals)) #adding the second and third dog, second NA, second cat

anyDuplicated(animals) #tells you how many of your unique values have duplicates, dog, NA, cat has appeared before, so 3 is answer

nums = c(42, NA, Inf)

is.finite(nums) #only 42 finite, NA is unknown and Inf is infinite

is.infinite(nums) #only Inf infinite

# Video 5: Identical Checks #

data1 = 1:10
data2 = data1

data3 = data1
data3[9] = 17 #updating 9th value to 17

result1 = data1 == data2
result1 #all true values bc they both equal each other throughout vectors

result2 = data1 == data3
result2 #all true except where 17 is

sum(result1) 
sum(result2) #adds true and false (0 and 1) values together, sum of result1 is 10 and result2 is 9

length(result1)
length(result2) #both 10, cause 10 values in each vector


sum(!result1) #telling us we have zero false values in result 1
sum(!result2) #telling us we have one false value in result 2

identical(data1, data2) #answer is true, data1 and data2 are the same
identical(data1, data3) #answer is false, they aren't the same


8 == 8L #we want 8 to be treated as integer, operator expects both sides to be same data type
identical(8, 8L) #tells us they aren't identical


all.equal(data1, data2) #they are equal, so true
all.equal(data1, data3) #they aren't equal, and it shows how they are different

all.equal(8, 8L) #all.equal doesn't return false, tries to tell us how different they are


isTRUE("cat") #this is false

isTRUE(all.equal(data1, data2))
isTRUE(all.equal(data1, data3)) #Takes result of all.equal to check if it's true, converts stuff that isn't true to false

print(0.1, digits=22) #we can see the error towards the 15th digit

print(0.9, digits=22)

print(1, digits=22) #this is integer, no decimal digits

print(1 - 0.9, digits = 22) #error in 0.9 affects results, but usually not an issue

#error matters when determining if values are equivalent

0.1 == (1 - 0.9) #false because of R's error
all.equal(0.1, (1 - 0.9)) #as long as difference isn't very significant, all.equal will say the equality is TRUE



















































