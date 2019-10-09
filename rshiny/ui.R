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
       style = "font-family: 'Source Sans Pro'; text-align: center;padding: 20px"),

    fixedRow(
        tabsetPanel(
            tabPanel("Output",
                     sidebarPanel(
                         numericInput("weight", "WEIGHT:", min = 0, max = 1000, value = 158, step = 0.5),
                         selectInput("weight_unit", "Unit for weight:", choices = c("lbs", "kg")),
                         p("Note: Valid input should ranges from 120 to 270 lbs or 54.5 to 122.5 kg"),
                         
                         numericInput("abdomen", "ABDOMEN:", min = 0, max = 1000, value = 86, step = 0.5),
                         selectInput("abdomen_unit", "Unit for ABDOMEN:", choices = c("cm", "inches")),
                         p("Note: Valid input should ranges from 70 to 130 cm or 27.5 to 51 inches"),
                         
                         numericInput("wrist", "WRIST:", min = 0, max = 1000, value = 17, step = 0.1),
                         selectInput("wrist_unit", "Unit for WRIST:", choices = c("cm", "inches")),
                         p("Note: Valid input should ranges from 15 to 22 cm or 6 to 8.5 inches"),
                         
                         submitButton("Submit", icon("refresh"))
                     ),
                     h3(span("Your body fat percentage (%):", verbatimTextOutput("res"), style = "font-weight: 300;float:center"), 
                        style = "font-family: 'Source Sans Pro';
                        padding: 20px;float:left"),
                     imageOutput("pp")
                     
            ),
            tabPanel("Info&Contact",
                     p('Pictures used in this calculator are from following:'),
                     tags$div(a(href="https://emojiisland.com/products/loudly-crying-face-emoji-icon/", "link to Picture1")),
                     tags$div(a(href="https://www.bariatricmexicosurgery.com/understanding-bmi-categories-levels-of-body-mass-and-obesity/", "link to Picture2")),
                     p("-------------------------------------------"),
                     p("If you have any problems, please contact us."),
                     p("Lu Li: lli468@wisc.edu"),
                     p("Jiawei Wu: jwu424@wisc.edu"),
                     p("Nan Yan: nyan5@wisc.edu"),
                     p("Youhui Ye: yye65@wisc.edu"))
            
        )
    )
    
    
))
