#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic

  # Page 1 - DB load
  mod_db_picker_server("db_picker_1")

  # Page 2 - Food Choices
  mod_food_choice_server("starters")
  mod_food_choice_server("mains")
  mod_food_choice_server("desserts")
  # Other Pages
}
