#' food_choice UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_food_choice_ui <- function(id, title){
  ns <- NS(id)
  tagList(
    # add
    h2(title),
    shiny::textInput(inputId = ns("name"),
                     label = "label1",
                     placeholder = "Name"),
    shiny::textInput(inputId = ns("description"),
                     label = "label1",
                     placeholder = "Longer description"),
    shiny::actionButton(inputId = ns("add food"),
                        label = "Add"),
    p("TODO also need to add a table showing all options entered already, which updates on the button press and has buttons to remove options.")


    # delete
  )
}

#' food_choice Server Functions
#'
#' @noRd
mod_food_choice_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_food_choice_ui("food_choice_1")

## To be copied in the server
# mod_food_choice_server("food_choice_1")
