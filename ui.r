
library(shiny)
library(readxl)
library(ggplot2)
library(ggcorrplot)
library(dplyr)
library(GGally)
library(ggExtra)
library(RColorBrewer)
library(reshape2)
library(shinyWidgets)
ui <- fluidPage(

   
    titlePanel("Adaptive Conjoint Analysis"),
    setBackgroundColor(
        color = c("#F7FBFF", "#2171B5"),
        gradient = "radial",
        direction = c("buttom", "right")
    ),

   
    tabsetPanel( #
        tabPanel("Page 1",
           br(),
           
                sidebarPanel( width= 3,h3("1. Filter your market"),br(), br(),
                     radioButtons(inputId = "type",
                                  label = "Company Size:",
                                  choices = c("Small", "Medium", "Big"), selected = 0),
                     radioButtons(inputId = "city",
                                  label = "Select City",
                                  choices = c("Seattle", "Portland"), selected = 0),
                    submitButton("Show"))
                )
    ,
    fluidRow(    
                h3("2. Choose your combo plan"), 
          column(2,       
                 
                              h3 ("Combo Plan 1"),
                              selectInput(inputId = "data",
                                          label = "Choose the Carrier",
                                          choices = c("T-mobile","Sprint", "Verizon"),
                                          selected = 1),
                              selectInput(inputId = "data",
                                          label = "Choose the Price",
                                          choices = c("Up to $30","$30-$50", "$50-$80"),
                                          selected = 1),
                              selectInput(inputId = "data",
                                          label = "Choose the Velocity",
                                          choices = c("2MB","5MB", "8MB"),
                                          selected = 1),
                              selectInput(inputId = "data",
                                          label = "Choose the Wi-Fi service",
                                          choices = c("No Wi-Fi", "Customized"),
                                          selected = 1)
                              ),
          column(2,
                 
                     h3 ("Combo Plan 2"),
                     selectInput(inputId = "data",
                                 label = "Choose the Carrier",
                                 choices = c("T-mobile","Sprint", "Verizon"),
                                 selected = 1),
                     selectInput(inputId = "data",
                                 label = "Choose the Price",
                                 choices = c("Up to $30","$30-$50", "$50-$80"),
                                 selected = 1),
                     selectInput(inputId = "data",
                                 label = "Choose the Velocity",
                                 choices = c("2MB","5MB", "8MB"),
                                 selected = 1),
                     selectInput(inputId = "data",
                                 label = "Choose the Wi-Fi service",
                                 choices = c("No Wi-Fi", "Customized"),
                                 selected = 1),
                     ),
          column(2, 
                            h3 ("Combo Plan 3"),
                            selectInput(inputId = "data3",
                                        label = "Choose the Carrier",
                                        choices = c("T-mobile","Sprint", "Verizon"),
                                        selected = 1),
                            selectInput(inputId = "data3",
                                        label = "Choose the Price",
                                        choices = c("Up to $30","$30-$50", "$50-$80"),
                                        selected = 1),
                            selectInput(inputId = "data4",
                                        label = "Choose the Velocity",
                                        choices = c("2MB","5MB", "8MB"),
                                        selected = 1),
                            selectInput(inputId = "data5",
                                        label = "Choose the Wi-Fi service",
                                        choices = c("No Wi-Fi", "Customized"),
                                        selected = 1)
                            ),
         
           mainPanel(
                      tabsetPanel(
                              tabPanel("Plot", plotOutput("plot")), 
                              tabPanel("Summary", verbatimTextOutput("summary")), 
                              tabPanel("Table", tableOutput("table"))
                                    )
                     )
              )
         )

)

server <- function(input, output) {


}

# Run the application 
shinyApp(ui = ui, server = server)
