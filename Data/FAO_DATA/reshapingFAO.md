Constructing the Simple Area/Population file
=============================

The raw data are from the UN Food and Agriculture Organization.  In this document, the format is changed to make them a standard table so that students can work with the data effectively from the start.

Use the `reshape2` package



Read in the "raw" data:

```r
pop <- read.csv("CountryPopulation.csv")
area <- read.csv("CountryArea.csv")
```


Create a population dataframe that has separate columns for each population variable:

```r
goo <- dcast(pop, Country + Year ~ Element, value.var = "Value")
```


Similarly, create an area dataframe that has separate columns for each area variable:

```r
foo <- dcast(area, Country + Year ~ Item, value.var = "Value")
```


Put them into one, wider dataframe and fix the names:

```r
FAO <- merge(foo, goo)
nms <- names(FAO)
nms <- sub("[[:space:]]+$", "", nms)
names(FAO) <- nms
```


Write the data, just for 2009:

```r
write.csv(file = "FAO-simple.csv", subset(FAO, Year == 2009), row.names = FALSE)
```

