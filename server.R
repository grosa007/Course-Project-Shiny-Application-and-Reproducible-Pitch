#
# Los datos se extrajeron de la revista estadounidense Motor Trend de 1974 y comprenden el consumo de combustible y 10 aspectos del diseño y rendimiento del automóvil para 32 automóviles (modelos 1973--74).
#

library(shiny)
library(dplyr)
data("mtcars")

 mod_auto <- c(rownames(mtcars))


shinyServer(function(input, output) {
  
   output$graf_cilindro <- renderPlot({
     mtcarcyl <- data.frame(filter(mtcars,mtcars$cyl==input$cilindro))
   
     hist(mtcarcyl$mpg,main = "Cantidad de carros por Millas por galon",ylab = "Cantidad",xlab = "MPG")

      })
   
   output$graf_caballos <- renderPlot({
     mtcarhp <- data.frame(filter(mtcars,mtcars$hp>=input$caballos[1],mtcars$hp<=input$caballos[2]))
     x    <- c(mtcars$hp)
     caballos <- seq(min(x), max(x), length.out = input$caballos + 1)
     
     hist(mtcarhp$hp,breaks=caballos,main = "Cantidad de carros por Millas por galon",ylab = "Cantidad",xlab = "MPG")
     
   })
   
   output$tabla_mtcars <- renderTable({
     mtcars2 <- data.frame(cbind(mtcars,modelo=c(rownames(mtcars))))
     mtcarmodelo <- data.frame(filter(mtcars2,mtcars2$modelo==input$modelo))

     
     
     mtcarmodelo
     
   }) 
   
   
})

  

