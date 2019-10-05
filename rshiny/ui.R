#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fixedPage(
    h1(span("Men Body Fat Calculator", style = "font-weight: 500"), 
       style = "font-family: 'Source Sans Pro';
     color: #8470FF; text-align: center;
     padding: 20px"),

    fixedRow(
        tabsetPanel(
            tabPanel("Input",
                     column(3,numericInput("Var1", "Var1:", 
                                           min = 0, max = 100000, value = 0, step = 1)),
                     column(3,numericInput("Var2", "Var2:", 
                                           min = 0, max = 100000, value = 0, step = 1)),
                     column(3,numericInput("Var3", "Var3:", 
                                           min = 0, max = 100000, value = 0, step = 1))
            )
        )
    ),
    
    fixedRow(
        tabsetPanel(
            tabPanel("Output",
                     h3(span("Men Body Fat Calculator:", verbatimTextOutput("res"), style = "font-weight: 300;float:center"), 
                        style = "font-family: 'Source Sans Pro';
                        padding: 20px;float:left"),
                     column(10, align="left",imageOutput("pp"))
                     ),
            tabPanel("Contact", 
                     p("If you have any problems, please contact us."),
                     p("Lu Li: lli468@wisc.edu"),
                     p("Jiawei Wu: jwu424@wisc.edu"),
                     p("Nan Yan: nyan5@wisc.edu"),
                     p("Youhui Ye: yye65@wisc.edu"))
        )
    )
    
    
))
