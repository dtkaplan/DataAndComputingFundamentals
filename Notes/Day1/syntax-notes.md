Basic Syntax in R
=======================




In English, "syntax" refers to the arrangement of words and phrases to create well formed sentences.  In computer languages, such as R, the syntax refers to the arrangement of symbols that creates legitimate commands.  Some basic syntax:


### Atoms

* Names of objects.  These start with a letter and contain letters and numbers (and periods and underscores, if you like).  Names with different capitalization are different.
* Literals, or "strings".  These are characters enclosed in quotation marks, such as `'hello'` or `"Hello to you!"`.  You can use either single or double quotes, but you must use the same type of quotation to start and end the string.  Remember: strings are in quotes, whereas names of objects are not.
* Numbers.  Things like `12.4` or `-12.7` or even `-2e-3`, using scientific notation.

R also works with collections of atoms.  Think of these as being like molecules in chemistry.  


### Function Invocation

A function is something that takes one or more inputs and produces an output. There are many functions built in to R and you can create your own.  To invoke a function, give the function name followed by open and close parentheses.  Any inputs to the function are contained inside the parentheses, separated by parentheses.  Examples:

```r
date()
```

```
## [1] "Tue Feb 19 10:37:07 2013"
```

```r
sqrt(25)
```

```
## [1] 5
```

```r
sin(3)
```

```
## [1] 0.1411
```

```r
seq(1, 10)
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```


### Assignment

You can create a new object by using `=` to "assign" a value to a name.  Example:

```r
x = 17
courseName = "DCF"
```


When you re-assign an object, the old value is forgotten.  Only the new value is kept.  For instance:

```r
x = 18
```


### Arithmetic

In order to make arithmetic easy to read, the arithmetic functions are arranged so that you can invoke them using the traditional syntax.  Examples:

```r
3 + 4
```

```
## [1] 7
```

```r
3 * 4
```

```
## [1] 12
```

```r
3^2
```

```
## [1] 9
```

```r
3/(1 + 5)
```

```
## [1] 0.5
```


You're used to associating the `=` sign with arithmetic, but that is not the meaning of `=` in R.  Remember, `=` is about assigning a name to a value: creating an object. So expressions that are impossible in mathematics can be perfectly sensible in R and other computer languages:

```r
n = 10
n = n + 1
```


### Named Arguments

The arguments to a function are often given names so that you can refer to them explicitly.  This is particularly convenient when a function has multiple arguments and you want to make sure that you don't mix them up. 

Example:

```r
seq(from = 3, to = 1)
```

```
## [1] 3 2 1
```


Many functions, particularly graphics functions, have a large number of potential arguments.  You can use one or more of these to control the behavior of the function.


```r
seq(from = 1, to = 10, by = 3)
```

```
## [1]  1  4  7 10
```

```r
seq(from = 1, to = 100, length = 3)
```

```
## [1]   1.0  50.5 100.0
```


### Collections of Similar Things --- Vectors

Often you will have a handful of things that you want to put together so that they become a single object: a collection. The `c()` function provides one way to put things together:

```r
c("April", "January")
```

```
## [1] "April"   "January"
```

```r
c(seq(1, 5), seq(5, 1))
```

```
##  [1] 1 2 3 4 5 5 4 3 2 1
```


A "vector" is a collection of things that are all the same type, e.g. numbers or strings.  There are also collections of things that are not necessarily all the same type.  The most common one that you will use is a "data frame" --- see below.



### Dialogs, Workspaces, Sessions

When you have a well formed expression, you can instruct R to execute it.  In response, R will do one of several things:

1. Print out the value that has been produced by the operation.
2. Assignment: Create the object, silently.
3. Produce a graphic, etc.
4. Give an error

The "dialog" is the sequence of your commands and R's command-by-command response.

A "workspace" is the collection of objects created by your commands.

A "session" is a sequence of commands and the objects created by them.  The commands in the console window create a session.  Each of your R/Markdown documents is an entirely separate session.

#### Errors

When you tell R to execute an expression that isn't well formed, R will not be able to carry out the operation.  Instead, R will "throw an error."  You'll see this as a printed error message. 

```r
fred + 3 = 2
```

```
## Error: object 'fred' not found
```


The operation is not performed.

#### Warnings

Sometimes, the people who wrote functions have identified situations when the operation makes sense and is do-able, but where they suspect that you might not intend to do what you asked.  In such a situation, a warning is printed.  The operation was performed, but you have been warned!

### Big Collections --- Data Frames

You will be working with data in this course, arranged in a tabular format.  This kind of object is called a "data frame" in R.  

#### Reading in Data

There are two main commands that you will use to create data-frame objects.

* The `fetchData()` takes the name of a data file and returns the data frame.  This is almost always assigned to a name for further use.

```r
cps = fetchData("CPS85")
```

```
## Data CPS85 found in package.
```

* The `data()` command reads in a data file and --- different from `fetchData()` --- silently creates an object without your having to do any assignment.

```r
data("FAOsimple")
```



### Basic Operations to Display Data

* Names of the variables: use `names()` with the data frame as an argument.

```r
names(cps)
```

```
##  [1] "wage"     "educ"     "race"     "sex"      "hispanic" "south"   
##  [7] "married"  "exper"    "union"    "age"      "sector"
```

* Number of rows: use `nrow()`

```r
nrow(cps)
```

```
## [1] 534
```

* Show just a few lines:

```r
head(cps)
```

```
##   wage educ race sex hispanic south married exper union age   sector
## 1  9.0   10    W   M       NH    NS Married    27   Not  43    const
## 2  5.5   12    W   M       NH    NS Married    20   Not  38    sales
## 3  3.8   12    W   F       NH    NS  Single     4   Not  22    sales
## 4 10.5   12    W   F       NH    NS Married    29   Not  47 clerical
## 5 15.0   12    W   M       NH    NS Married    40 Union  58    const
## 6  9.0   16    W   F       NH    NS Married    27   Not  49 clerical
```

* Show a summary:

```r
summary(cps)
```

```
##       wage            educ    race     sex     hispanic   south   
##  Min.   : 1.00   Min.   : 2   NW: 67   F:245   Hisp: 27   NS:378  
##  1st Qu.: 5.25   1st Qu.:12   W :467   M:289   NH  :507   S :156  
##  Median : 7.78   Median :12                                       
##  Mean   : 9.02   Mean   :13                                       
##  3rd Qu.:11.25   3rd Qu.:15                                       
##  Max.   :44.50   Max.   :18                                       
##                                                                   
##     married        exper        union          age            sector   
##  Married:350   Min.   : 0.0   Not  :438   Min.   :18.0   prof    :105  
##  Single :184   1st Qu.: 8.0   Union: 96   1st Qu.:28.0   clerical: 97  
##                Median :15.0               Median :35.0   service : 83  
##                Mean   :17.8               Mean   :36.8   manuf   : 68  
##                3rd Qu.:26.0               3rd Qu.:44.0   other   : 68  
##                Max.   :55.0               Max.   :64.0   manag   : 55  
##                                                          (Other) : 58
```


### HELP

The `help()` function will show the documentation for a function or data set.  This is particularly helpful to remind you what are the arguments to a function and what they mean, or what are the variables and cases in a data frame.

Try, `help(seq)`.



