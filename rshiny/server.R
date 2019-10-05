#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

data <- read.csv("BodyFat.csv")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    res <- reactive({
        1 * input$Var1 + 2 * input$Var2 + 3 * input$Var3
    })
    

    
    output$res <- renderPrint({cat(res())})
    output$plot <- renderPlot({
        ggplot(data, aes(x=BODYFAT)) + geom_density() + theme_bw()})
    
    output$pp <- renderImage({
        
        if (is.na(sum(input$Var1, input$Var2, input$Var3)) | min(input$Var1, input$Var2, input$Var3) < 0 ){
            return(list(src = "error.png", width = 1000, height = 300, alt = "Face"))}
        else if (res() == 0){
            return(list(src = "bodyfat.jpg", width = 500, height = 300, alt = "Face"))}
        else if (res() < 18.5){
            return(list(src = "bodyfat1.jpg", width = 500, height = 300, alt = "Face"))}
        else if (res() < 24.9){
            return(list(src = "bodyfat2.jpg", width = 500, height = 300, alt = "Face"))}
        else if (res() < 29.9){
            return(list(src = "bodyfat3.jpg", width = 500, height = 300, alt = "Face"))}
        else if (res() < 34.9){
            return(list(src = "bodyfat4.jpg", width = 500, height = 300, alt = "Face"))}
        else {
            return(list(src = "bodyfat5.jpg", width = 500, height = 300, alt = "Face"))}
        
    }, deleteFile = FALSE)
})
