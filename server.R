library(shiny)
library(caret)
library(XLConnect)
d <- readWorksheet(loadWorkbook("energy.xlsx"),sheet=1)
names(d)<-c("co","sa","wa","ra","oh","or","ga","gd","hl","cl")
method="lm" #your method
ctrl <- trainControl(verboseIter=TRUE,method = "cv",number=2)
cool<-train(cl~sa + wa + ra + oh + or + ga + gd,d,method=method,trControl = ctrl)
heat<-train(hl~sa + wa + ra + oh + or + ga + gd,d,method=method,trControl = ctrl)
shinyServer(
  function(input, output) {
    #params<-reactive(as.data.frame(as.numeric(c(sa={input$sa},wa={input$wa},ra={input$ra},oh={input$oh},or={input$or},ga={input$ga},gd={input$gd}))))
    params<-reactive({list(sa=as.numeric(input$sa),
                           wa=as.numeric(input$wa),
                           ra=as.numeric(input$ra),
                           oh=as.numeric(input$oh),
                           or=as.numeric(input$or),
                           ga=as.numeric(input$ga),
                           gd=as.numeric(input$gd)
                           )})
    heating<-reactive({predict(heat,params())})
    cooling<-reactive({predict(cool,params())})
    heatingvalues<-reactive({
      data.frame(
        Type=c("Heating","Cooling","Average"),
        Load=c(heating(),cooling(),heating()/2+cooling()/2),
        stringsAsFactors=FALSE
        )
    })
    output$values<-renderTable({
      heatingvalues()
    })
  }
)