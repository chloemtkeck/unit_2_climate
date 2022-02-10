## 02-10-2022 User defined functions, class notes 
## similar to for loop, want to be able to repeat without copying and 
## pasting same type of code 

## if copy pasting 3+ more, good idea to create user defined function 
## benefits: eliminate error in copying code, can adjust code in one spot 


vec = c(1,3,5,7)

avg = function(x){
  sum(x)/length(x)
} 
## x is what data you're dringing into it 

avg(vec) ## use funtion as you would any other function
mean(vec) ## check 

## function will automatically return the last thing in the function

my_result = avg(vec)
my_result

## final value is returned, rexplicitly include return statement to say
## after this function is finised, ask to return 
avg = function(x){
  sum(x)/length(x)
  return(avg)
} 

avg() ## shows error bc no value 

## created arithmetic avergate with avg() but you can also make geometric
## average with function 

avg = function(x, arithmetic = TRUE){
  length_x = length(x)
  result = ifelse(arithmetic, sum(x)/length_x, prod(x)^(1/length_x)) ##ifelse(test, yes, no)
  return(result)
} 

avg(vec) ## takes arithmetic mean 
avg(vec, arithmetic = FALSE) ## takes geometric mean 

avg(vec, F) ##assuming im providing parameters in the correct order 
avg (F, vec) ##unexpected behavior 
avg(arithmetic = F, x = vec) ##if explicit, order does not matter, good coding 

## make it user friendly 
x= vec

avg = function(x, arithmetic = TRUE){
  if(!is.numeric(x)){stop("avg() failed. x must be numeric")} #exclamation point negates 
  length_x = length(x)
  result = ifelse(arithmetic, sum(x)/length_x, prod(x)^(1/length_x)) ##ifelse(test, yes, no)
  return(result)
} 

avg(FALSE) ##stops and displays message "avg () failed. x must be numeric"


## you can use this process to create your own r package that contains 
## a lst of functions for you and many people to use 

##exercise 7.1 
## Create a function that reads in someone's grade percentage points and
## returns their letter grade (A: 90-100, B: 80-90, etc.). You can 
## imagine how you could make this function fancier by including grading
## scheme info in the parameters to ask if the function user wanted to 
## also know if the student earned a B+, B or B-.

your_grade = function(x,)
  if(!is.numeric(x)){stop("x must be numeric")}
  if(x>=90){
    return("A")
  }
  if(x>=80){
    return("B")
  }
  if(x>=70){
    return("C")
  }
  if(x>=60){
    return("D")
  }
  if(c=<50){
    return("F")
  }


















