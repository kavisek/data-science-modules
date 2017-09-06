library(DBI)
library(shiny)
library(shinydashboard)
header <- dashboardHeader(title = 'Orders')
side <- sidebarMenu(menuItem("KPIs", tabName = "dashboard", icon = icon("calculator")))
pullCurr1 <-
  selectInput('year', 'Year:', choices = c('2003', '2004', '2005'))
pullCurr2 <-
  selectInput(
    'month', 'Month', choices = c(
      'January' = '1', 'February' = '2', 'March' = '3', 'April' = '4', 'May' = '5', 'June' = '6',
      'July' = '7', 'August' = '8', 'September' = '9', 'October' = '10', 'November' = '11', 'December' = '12'))
sidebar <-
  dashboardSidebar(sidebarMenu(side),pullCurr1, pullCurr2)
info1 <- valueBox('Value',  h3(textOutput("sales")), color = 'red')
info2 <-
  valueBox('Number',  h3(textOutput("orders")), color = 'yellow')
row1 <-  fluidRow(info1,info2)
body <- dashboardBody(row1)
ui <- dashboardPage(header,sidebar,body)
server <- function(input, output) {
  # make the connection
  conn <-
    dbConnect(
      RMySQL::MySQL(), "wallaby.terry.uga.edu", dbname = "ClassicModels", user = "student", password =
        "student")
  output$sales <-  renderText({
    sql <-
      paste0(
        'SELECT FORMAT(SUM(quantityOrdered*priceEach),2) FROM Orders, OrderDetails WHERE Orders.orderNumber = OrderDetails.orderNumber AND YEAR(orderDate) = ',input$year, ' AND month(orderDate) = ', input$month)
    query <-  dbGetQuery(conn,sql)[1,1]
  })
  output$orders <-  renderText({
    sql <-
      paste0(
        'SELECT COUNT(*) FROM Orders WHERE YEAR(orderDate) = ',input$year, ' AND MONTH(orderDate) = ', input$month)
    query <-  dbGetQuery(conn,sql)[1,1]
  })
}

shinyApp(ui, server)