Working Outline
===============

# Modes of Visualization

## Topics
* grammar of graphics, up to a level where students can parse Rossling-type graphics
* visual esthetics

## Readings
* Tufte, *[The Display of Quantitative Information][http://www.amazon.com/The-Visual-Display-Quantitative-Information/dp/0961392142/ref=sr_1_1?ie=UTF8&qid=1343928142&sr=8-1&keywords=tufte]* 2/e 
* http://xkcd.com/657/                                                                                                                                                                                            
# Structure of Relational Data

## Topics
* wide vs long
* operations through join
* cleaning data/tidy data

## Country-by-Country Data

The United Nations Food and Agriculture Organization (FAO) has a wide range of data broken down by year and country.

Access it by going to <http://faostat3.fao.org/home/index.html#DOWNLOAD>

Pick a category, select all countries and all years, choose "table" (not "pivot table") and download.  The result will be in narrow format.  

Two examples are in

1. FAO_DATA/CountryArea.csv which gives areas (including many subareas, like arable land) for each country
2. FAO_DATA/CountryPopulation.csv which gives various population numbers across the years, including total, working, rural, etc.

Introduce students to the database operations by having them make GapMinder-like graphics.

#### Comments

Find some health-related data.  FAO doesn't have this.  GAPMINDER?

The FAO site was suggested by Dan Flath.

## Possible Examples
* Raindrop timing and weather forecasts.  If the forecast probability of rain was 30%, what is the probability (across times) of drops having falling in the last 30 minutes (or over 20 of the last 30 minutes, etc.)
    * One instrument is called a "disdrometer".  
    * Online data from [Oklahoma](http://weather.ou.edu/~guzhang/page/Disdrometer_data.html) which says that the raw form can be provided.
    * More online data from [NCAR](http://data.eol.ucar.edu/codiac/dss/id=113.073)
* Zillow versus political donations
* from Nolan/Lang summer Berkeley course
* Verizon text telephone data (see Dick De Veaux example from JSM)
* Simple text mining: extracting sex from the Federal Election Commission database
* [Tufte Sparklines in R](http://cran.r-project.org/web/packages/YaleToolkit/YaleToolkit.pdf)

# NOT
* No formal inference
* No grungy programming

                                                                                                                                                                                    