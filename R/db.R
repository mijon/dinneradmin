

#' Connect To A {dinneradmin} database
#'
#' @param path **character** path to the SQLite db
#' @md
#' @return database connection
dinner_con <- function(path) {
  con <- DBI::dbConnect(RSQLite::SQLite(), path)
  DBI::dbExecute(conn = con, "PRAGMA foreign_keys=ON")
  con
}

bootstrap_db <- function(con) {
  table_definitions <- readLines(fs::path_package("dinneradmin", "sql_scripts/tables.sql")) |>
    paste(collapse = "\n") |>
    stringr::str_split("\n\n") |>
    dplyr::first()

  DBI::dbWithTransaction(con, {
    purrr::walk(table_definitions,
                \(x) {DBI::dbSendStatement(con, x)})
  })
}

#' Set Up Database
#'
#' Sets up a SQLite database at a given path with all the tables needed for
#' running {dinneradmin}.
#'
#' @param path **character**
#'
#' @return
#' @export
#'
#' @examples
initialise_db <- function(path) {
  con <- dinner_con(path)
  bootstrap_db(con)
  con
}
