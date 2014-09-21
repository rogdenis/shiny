library(shiny)
library(XLConnect)
d <- readWorksheet(loadWorkbook("energy.xlsx"),sheet=1)
names(d)<-c("co","sa","wa","ra","oh","or","ga","gd","hl","cl")
shinyUI(fluidPage(theme = "bootstrap.css",
  headerPanel("Calculate your house energy load"),
  sidebarPanel(
    p(em("Documentation:",a("EnergyApp",href="index.html")),style="font-size:20px;"),
    sliderInput('sa', 'Surface Area',value = mean(d$sa), min = min(d$sa)*0.8, max = max(d$sa)*1.2, step = 10,),
    sliderInput('wa', 'Wall Area',value = mean(d$wa), min = min(d$wa)*0.8, max = max(d$wa)*1.2, step = 10,),
    sliderInput('ra', 'Roof Area',value = mean(d$ra), min = min(d$ra)*0.8, max = max(d$ra)*1.2, step = 10,),
    sliderInput('oh', 'Overall Height ',value = mean(d$oh), min = min(d$oh)*0.8, max = max(d$oh)*1.2, step = 0.1,),
    radioButtons("or", "Main windows orientation",
                 c("to the North" = "2",
                   "to the East" = "3",
                   "to the South" = "4",
                   "to the West" = "5")),
    sliderInput('ga', 'Glazing Area',value = mean(d$ga), min = 0, max = max(d$ga)*1.2, step = 0.1,),
    sliderInput('gd', 'Amount of windows',value = round(mean(d$gd)), min = 0, max = max(d$gd)+1, step = 1,)
  ),
  mainPanel(
    
    tableOutput("values"),
    style="font-size:20px"
    
  )
))