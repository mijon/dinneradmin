#' db_picker UI Function
#'
#' @description A shiny Module for the loading or creation of the dinneradmin
#'   db.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_db_picker_ui <- function(id){
  ns <- NS(id)
  tagList(
    h2("Load Existing Database"),
    shiny::fileInput(inputId = ns("file_picker"),
                     label = "Path to database."),
    h2("Create New Database"),
    p("TODO: Create something here, e.g. button or something to make a new db and connect")
  )
}

#' db_picker Server Functions
#'
#' @noRd
mod_db_picker_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_db_picker_ui("db_picker_1")

## To be copied in the server
# mod_db_picker_server("db_picker_1")
