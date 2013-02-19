Day 1
=====================

## Introduction

### What is Data?

Measurements together with the context in which the measurement was taken.
Information collected for a purpose.

Major types of information being collected nowadays:
* Photographs and videos: Russian meteorite
* Time series and sounds: Stock prices, seismograms, North Korean nuclear test detection
* Text: Crisis mapping, earthquake estimation
* Tabular data

### What is Big Data?

* Data with lots of cases.
* Data with lots of variables.

The goal of computing on data is to reduce it to a form where decisions and judgments can be supported.  We'll call this a "presentation" of data.

Some goals for data presentations:
* Identifying interesting or important events that are hidden by a mass of irrelevant events.  Example: Going through a database of clinical reports to identify drug side-effects and interactions.
* Looking for patterns in data that help us understand the overall system.  Often, information is distributed among the multiple measured variables and our job is to condense that distributed information into a form where it's readily interpreted. Example: Interpreting the expression pattern of thousands of genes to identify pathways or mechanisms of a disease.

### Goals for this course

* Introduce you to the basic ideas of data presentation
    * Graphics modalities
    * Transformating and combining data
    * Summarizing patterns with models 
    * Classification and dimension reduction
* Develop the skills needed to make effective data presentations
    * Access to tabular data
    * Re-organization of tabular data for combining different sources
    * Proficiency with basic techniques for modeling, classification, and dimension reduction.
    * Experience with choices in data presentation
* Develop the confidence to work with modern tools
    * Computer commands
    * Documentation and work-flow
    
#### What we won't do

* Techniques for reduction of information from photographs, videos, or free text.
* Techniques for heirarchical or similarly structured data (e.g. XML files)
* Techniques particular to the Internet
* Techniques about computational processes for huge data sets; we'll work with data that fits on a conventional computer.

#### Style of the class

* In class:
    * About half the time as presentation of concepts and new skills.  
        * Often these will be presented with very small data sets that make it easy to see what's going on.
    * About half the time with you working on using these concepts and skills with us present.
        * Getting a specific assigned example to work
        * Exploring the data on your own.
* Out of class:
    * A little bit of drill, just to solidify basic skills.
    * Write up a short report about what you did in class.
    * Work on another case study that we'll assign.
* You're job is to tell a story with the data.  To do this, you'll have to think about what the story might be --- call it making hypotheses --- and then test these possibilities with the data.  Construct a presentation of the data that supports or refutes your hypotheses.

### You are pioneers

* There is no established way to teach this material, or even a broad consensus about what material should be taught.
* We need to find out what works and what doesn't.
* We ask you to be robust enough to bear up with things that don't seem initially to be working; give them a chance until we definitively conclude that they won't work.
* You will be working with very limited support materials: we're lacking texts, formally written assignments, crib sheets for computer commands.
* Sometimes we will miss something basic.  Unfortunately, we the instructors take a lot of knowledge for granted and any amount of talking among us won't reliably identify what this is.  We need you to help us identify the things that many students won't already know so that we can make them explicit.  Example from algebra: If I can reduce it to a quadratic form, I can find the zeros.

### Today's Agenda

#### Log in to R.  Basic aspects of syntax:
* Functions and arguments.
* Assignments.

#### Tabular data

Structure of tabular data: 
* cases and variables
* types of variables: quantitative and categorical

Basic operations on data frames: examples with small data sets, CPS85, KidsFeet, Utilities.
* number of cases
* number of variables
* names of the variables
* summary
* selection of a small number of variables
    * $ notation
    * Indexing notation --- after the comma
    * small sets and sequences
* selection of a small number of cases
    * head
    * sample
    * Indexing --- before the comma

* transformation of variables on a case-by-case basis within a data frame.
    * Heads up:
        * Week 2: Combination of multiple cases
        * Week 3: Combination of multiple data frames
    * Scaling and rates (dividing one variable by another)
    * Use of transformations, esp. logarithms

### Today's graphics modality: The scatter plot

Quick scatter plots: xyplot

Graphical principles of scatter plots
* x and y are each a "dimension".  So natural to plot out two dimensions.
* Many possibilities for three dimensions, but x,y,z doesn't seem to be effective unless you can rotate it, and this is hard to reproduce and display.  So color and size and shape are used.  Later in the semester, we'll work with "dimension reduction."
* Position is precisely detected.
* Size and color are not, so use these for categories with discrete differences or just to suggest a trend.

Elaborate scatter plots with `mScatter`: 
* choices of x and y variables
* choice of symbol size
* choice of colors

### Use of R Markdown

* Creating, naming, and saving files.
* Using "run chunks" to test
* Compiling to HTML
* Publishing to RPubs
* Copying the command form produced by `mScatter` into a document.

### Larger data: `FAOsimple` country data

Scaling and logarithms

Tell a story with the FAO data.


### Out of class: `nhanes` data

Try to tell a story about body shape using the 33,000 people in the nhanes data.  Pay attention to your failures: the scatter-plot format isn't well suited for everything.  Make note of ways that the scatter plot isn't informative for a hypothesis that you want to test.  We'll try again later in the course with new techniques that we'll learn.

### Exercises

Create a document "Week-1-Exercises.Rmd" and write up your work there.

#### Creating New Variables

* Calculate population density
    * population per area
    * population per agricultural area
* Add up the male and female population and verify that it matches total population.  (You can make a new variable and plot it against the original total population.)
* Calculate body-mass index according to the formula $\frac{m}{h^2}$ and see how it corresponds to the body mass index in the data.

#### Data Exploration

Look at the various data sets available at <http://www.gapminder.org/data/>.

Construct five hypotheses that you would like to test using this sort of country-by-country data.  Later in the course, you'll learn how to assemble such data in a form you can use for your analysis.