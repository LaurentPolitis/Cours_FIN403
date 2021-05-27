#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Position ISS"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("step",
                        "Number of position that we want to plot:",
                        min = 1,
                        max = 50,
                        value = 10),
            numericInput("sleep",label = "Break between each step",value = 1)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        
        list_position = lapply(X= 1:input$step, FUN = function(x){
            positionISS(x = x,timestep = input$sleep)
        } )
        df = do.call(rbind,list_position)
        
        # draw the histogram with the specified number of bins
        library(ggplot2)
        library(maps)
        
        world <- map_data(map = "world")
        p = ggplot(data = df, aes(y= as.numeric(`iss_position.latitude`), x = as.numeric(`iss_position.longitude`) ) ) +
            geom_polygon(data=world, aes(long, lat, group = group),fill = "black", colour = "grey")+
            coord_quickmap()+
            geom_point(color="red")+
            labs(x="lon",y="lat")
        
        p
        
    })

}

# Run the application 
shinyApp(ui = ui, server = server)
