---
title       : Creating and using energy consumption application
subtitle    : 
author      : Denis Rogachevsky 
job         : Internet
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [bootstrap, quiz, shiny, interactive]          # {mathjax, quiz, bootstrap}
ext_widgets: {rCharts: [libraries/nvd3]}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---
   
      
         
            
               
               

What would be more economically in terms of energy, one floor house with one big window or a two floors house with many small windows.   
Estimate with our Application!   

--- &radio

### Guess

What property of your house impacts the energy consumtion mostly?

1. House area
2. _House height_
3. Glazing area
4. Glazing dispersion

*** .hint   
probably not the most obvious
*** .explanation
warm air is cooling while going up


--- .class #id 

### Our data


The data is kindly provided by the UCI machine learning repository. You can take it here https://archive.ics.uci.edu/ml/datasets/Energy+efficiency#   



It contains 768 houses parameters and their heating and cooling values parameters.

--- .class #id 

### Use the app

Use our [simple app](http://rogdenis.shinyapps.io/shiny/ "EnergyApp") and select the design of the house that will save your money. It easy, try it out! 

![screenshot](EnergyApp.png)
http://rogdenis.shinyapps.io/shiny/

