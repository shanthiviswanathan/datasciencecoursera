Shiny Project - Central Limit Theorem
========================================================
author: Shanthi Viswanathan
date: 15 Aug 2014

Introduction
========================================================

This shiny application has 3 tabs.

- Plot
- DataSet
- About

DataSet Tab
========================================================

DataSet tab displays the entire data set. Below is the summary of the housing data.


```r
housing <- read.csv("data/BostonHousing.csv")
summary(housing)
```

```
      CRIM             ZN            INDUS            CHAS       
 Min.   : 0.01   Min.   :  0.0   Min.   : 0.46   Min.   :0.0000  
 1st Qu.: 0.08   1st Qu.:  0.0   1st Qu.: 5.19   1st Qu.:0.0000  
 Median : 0.26   Median :  0.0   Median : 9.69   Median :0.0000  
 Mean   : 3.61   Mean   : 11.4   Mean   :11.14   Mean   :0.0692  
 3rd Qu.: 3.68   3rd Qu.: 12.5   3rd Qu.:18.10   3rd Qu.:0.0000  
 Max.   :88.98   Max.   :100.0   Max.   :27.74   Max.   :1.0000  
      NOX              RM            AGE             DIS       
 Min.   :0.385   Min.   :3.56   Min.   :  2.9   Min.   : 1.13  
 1st Qu.:0.449   1st Qu.:5.89   1st Qu.: 45.0   1st Qu.: 2.10  
 Median :0.538   Median :6.21   Median : 77.5   Median : 3.21  
 Mean   :0.555   Mean   :6.29   Mean   : 68.6   Mean   : 3.79  
 3rd Qu.:0.624   3rd Qu.:6.62   3rd Qu.: 94.1   3rd Qu.: 5.19  
 Max.   :0.871   Max.   :8.78   Max.   :100.0   Max.   :12.13  
      RAD             TAX         PTRATIO           B        
 Min.   : 1.00   Min.   :187   Min.   :12.6   Min.   :  0.3  
 1st Qu.: 4.00   1st Qu.:279   1st Qu.:17.4   1st Qu.:375.4  
 Median : 5.00   Median :330   Median :19.1   Median :391.4  
 Mean   : 9.55   Mean   :408   Mean   :18.5   Mean   :356.7  
 3rd Qu.:24.00   3rd Qu.:666   3rd Qu.:20.2   3rd Qu.:396.2  
 Max.   :24.00   Max.   :711   Max.   :22.0   Max.   :396.9  
     LSTAT            MEDV     
 Min.   : 1.73   Min.   : 5.0  
 1st Qu.: 6.95   1st Qu.:17.0  
 Median :11.36   Median :21.2  
 Mean   :12.65   Mean   :22.5  
 3rd Qu.:16.95   3rd Qu.:25.0  
 Max.   :37.97   Max.   :50.0  
```

Plot Tab
========================================================

Plot tab is the main tab of this application. By increasing the sample size, the user can see how the distribution of the sample means comes closer to normal distribution.

A sample histogram for the MEDV (median value of a home in $000):
![plot of chunk unnamed-chunk-2](ShinyProject-figure/unnamed-chunk-2.png) 

About Tab
========================================================

About tab describes the application and instructs the users on how to use this application.
