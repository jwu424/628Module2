#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    res <- reactive({
        if (input$weight_unit == "kg"){
            weight = input$weight * 2.20462
        }else{
            weight = input$weight}
        
        if (input$abdomen_unit == "inches"){
            abdomen = input$abdomen * 2.54
        }else{
            abdomen = input$abdomen}
        
        if (input$wrist_unit == "inches"){
            wrist = input$wrist * 2.54
        }else{
            wrist = input$wrist}
        
        round(-23.86796500 - 0.08350773 * weight + 0.86989031 * abdomen - 1.24546008 * wrist, 2)
    })
    

    output$res <- renderPrint({
        if (is.na(sum(input$weight, input$abdomen, input$wrist)) | min(input$weight, input$abdomen, input$wrist) < 0  | res() > 50 | res() <0
            
            | (input$weight_unit == 'kg' & input$weight < 54.5) | (input$weight_unit == 'kg' & input$weight > 122.5)
            | (input$weight_unit == 'lbs' & input$weight < 120) | (input$weight_unit == 'lbs' & input$weight > 270)
            
            | (input$abdomen_unit == 'inches' & input$abdomen < 27.5) | (input$abdomen_unit == 'inches' & input$abdomen > 51)
            | (input$abdomen_unit == 'cm' & input$abdomen < 70) | (input$abdomen_unit == 'cm' & input$abdomen > 130)
            
            | (input$wrist_unit == 'inches' & input$wrist < 6) | (input$wrist_unit == 'inches' & input$wrist > 8.5)
            | (input$wrist_unit == 'cm' & input$wrist < 15) | (input$wrist_unit == 'cm' & input$wrist > 22)){
            cat(' ')
        }
        else{cat(res())}
        })
    
    output$pp <- renderImage({
        
        if (is.na(sum(input$weight, input$abdomen, input$wrist)) | min(input$weight, input$abdomen, input$wrist) < 0 
            
            | (input$weight_unit == 'kg' & input$weight < 54.5) | (input$weight_unit == 'kg' & input$weight > 122.5)
            | (input$weight_unit == 'lbs' & input$weight < 120) | (input$weight_unit == 'lbs' & input$weight > 270)
            
            | (input$abdomen_unit == 'inches' & input$abdomen < 27.5) | (input$abdomen_unit == 'inches' & input$abdomen > 51)
            | (input$abdomen_unit == 'cm' & input$abdomen < 70) | (input$abdomen_unit == 'cm' & input$abdomen > 130)
            
            | (input$wrist_unit == 'inches' & input$wrist < 6) | (input$wrist_unit == 'inches' & input$wrist > 8.5)
            | (input$wrist_unit == 'cm' & input$wrist < 15) | (input$wrist_unit == 'cm' & input$wrist > 22)){
            
            return(list(src = "error1.png", width = 500, height = 360, alt = "Face"))}
        else if (res() > 50 | res() <0) {
            return(list(src = "error2.png", width = 500, height = 360, alt = "Face"))}
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
