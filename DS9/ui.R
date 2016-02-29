shinyUI(pageWithSidebar(
  # Application title
  headerPanel('mtcars k-means clustering'),
  # Sidebar with input controls
  sidebarPanel(
    selectInput('xcol', 'X Variable', names(mtcars)),
    selectInput('ycol', 'Y Variable', names(mtcars)),
                selected=names(mtcars)[[2]],
    numericInput('clusters', 'How many clusters', 3,
                 min = 1, max = 9),
    helpText('Select one X variable and one Y variable. 
              You can then select a number of clusters and will see them in the graphic.')
  ),
  # Main panel where the plot and help text is located.
  mainPanel(
    plotOutput('plot1'),
    helpText('There is big black X at the center of the cluster, and each cluster in different color.')
  )
))