library(shiny)

#' Interface Shiny pour HouseholderAcoustics
#'
#' Lance une interface interactive pour tester le package sans écrire de code.
#'
#' @export
householder_acoustic_shiny <- function() {

  ui <- fluidPage(
    titlePanel("Householder Acoustics Analyzer"),
    sidebarLayout(
      sidebarPanel(
        textAreaInput("matrixA", "Entrer la matrice A (séparée par des virgules)"),
        textInput("vectorx", "Entrer le vecteur x (séparé par des virgules)"),
        actionButton("run", "Analyser")
      ),
      mainPanel(
        plotOutput("plots"),
        verbatimTextOutput("log")
      )
    )
  )

  server <- function(input, output) {
    observeEvent(input$run, {
      # Conversion de l'entrée texte en matrice et vecteur
      vec <- as.numeric(unlist(strsplit(input$vectorx, ",")))
      mat <- as.numeric(unlist(strsplit(input$matrixA, ",")))
      n <- sqrt(length(mat))
      A <- matrix(mat, nrow = n, byrow = TRUE)
      x <- vec

      res <- householder_acoustic_analysis(A, x)

      output$log <- renderPrint(res)

      # Graphiques de la fonction principale seront affichés dans la console
    })
  }

  shinyApp(ui, server)
}
