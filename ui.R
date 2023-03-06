
library(shiny)
data("mtcars")

# 
shinyUI(fluidPage(
  titlePanel("Consumo de combustible y rendimiento para 32 automóviles"),
  sidebarLayout(
    sidebarPanel(
      radioButtons("cilindro", label = h3("Cantidad de cilindro"),
                                 choices = list("Elegir 4" = 4, "Elegir 6" = 6, "Elegir 8" = 8), 
                                 selected = 4)
    ),
     mainPanel(
       plotOutput("graf_cilindro")
     )
  ),
  sidebarLayout(
    sidebarPanel(
      sliderInput("caballos", h3("Caballos de fuerza"),52,335,c(60,200),pre="hp",
                  )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("graf_caballos")
    )
  ),
  sidebarLayout(
    sidebarPanel(
      # Copy the chunk below to make a group of checkboxes
      checkboxGroupInput("modelo", label = h3("Modelos de automóviles"), 
                         choices = c(rownames(mtcars)),
                         selected = "Mazda RX4"),
      
      
      hr(),
      fluidRow(column(3, verbatimTextOutput("value")))
    ),
    
    mainPanel(
      tableOutput("tabla_mtcars")
  
    )
  )

  )
  
  )
  



  

