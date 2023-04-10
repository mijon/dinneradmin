#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    navbarPage(
      title = "Dinner Admin Page",
      tabPanel("DB Load",
               p("Area to choose which database to work on. Each dinner is a single SQLite database file with the standard table layout. This page allows the user to load saved dinners or create a new dinner"),
               mod_db_picker_ui("db_picker_1")),
      tabPanel("Food Details",
               p("View that lets you set up food options, i.e. add, change, and delete starters, mains, and desserts."),
               mod_food_choice_ui("starters", "Starters"),
               mod_food_choice_ui("mains", "Mains"),
               mod_food_choice_ui("desserts", "Desserts")),
      tabPanel("Wine Details",
               p("View that lets you set up the wine options: add, edit, and remove wine options.")),
      tabPanel("Billing",
               p("View that allows setting up billing groups")),
      tabPanel("Table Set up",
               p("View that allows the setting up of tables. I.e. creating and deleting tables")),
      tabPanel("Guests",
               p("View that lets you make a new guest, set food options, edit food options, assign guests to tables.")),
      tabPanel("Wine Orders",
               p("View that lets you set wine orders to tables and billing groups"))
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "dinneradmin"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
