###Class exercise -- Implement the code below to extract query results 
## from the AdventureWorks Database

library(DBI)
library(shiny)
library(shinydashboard)

header <- dashboardHeader(title = 'Orders in Adventureworks')


side <- sidebarMenu(menuItem("KPIs", tabName = "dashboard", icon = icon("calculator")))

##define two dropdown boxes
pullCurr1 <-
  selectInput('year', 'Year:', choices = c('2003', '2002', '2001'))
pullCurr2 <-
  selectInput(
    'month', 'Month', choices = c(
      'January' = '1', 'February' = '2', 'March' = '3', 'April' = '4', 'May' = '5', 'June' = '6',
      'July' = '7', 'August' = '8', 'September' = '9', 'October' = '10', 'November' = '11', 'December' = '12'))

#define sidebar with the two dropdown boxes

sidebar <-
  dashboardSidebar(sidebarMenu(side),pullCurr1, pullCurr2)

### define the values/Query results in the center of the dashboard

info1 <- valueBox('Value', h3(textOutput("sales")), color = 'red')
info2 <- valueBox('Number', h3(textOutput("orders")), color = 'yellow')

row1 <- fluidRow(info1,info2)

body <- dashboardBody(row1)

## assemble the webpage
ui_advworks1 <- dashboardPage(header,sidebar,body)

## connect to a database server and specify the input and output

wmc3317_2server <- function(input, output) {
  # make the connection
  conn <-
    dbConnect(
      RMySQL::MySQL(), "wmc3317-2.bus.sfu.ca", dbname = "adventureworks", user = "nsaraf", password =
        "XXXXX")

#extract query results into R objects 
  
  output$sales <- renderText({
    sql <-
      paste0(
        'select count(*) from salesorderheader where YEAR(OrderDate) = ',input$year, ' AND month(OrderDate) = ', input$month)
    query <- dbGetQuery(conn,sql)[1,1]
  })

  output$orders <- renderText({
    sql <-
      paste0(
        'select count(*) from salesorderheader where YEAR(OrderDate) = ',input$year, ' AND month(OrderDate) = ', input$month)
    query <- dbGetQuery(conn,sql)[1,1]
  })
}

## create the page using the ui object which contains the FORMATTING
## and the server object which contains the CONTENT

shinyApp(ui_advworks1, wmc3317_2server)