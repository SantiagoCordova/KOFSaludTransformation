#' read_IndiceSaludExcel
#'
#' @param path data path where Indice de Salud Report is saved and
#' each sheet is a Country with the specific standarized layout
#' @param sheet Country
#'
#' @return read Data
#' @export
#' @import readxl dplyr purrr stringr
#'
read_IndiceSaludExcel <- function(path, sheet){

  n <- path %>% stringr::str_count()
  year <- path %>%
    substr(., n-8,n) %>%
    substr(., 1,4) %>%
    as.numeric()

  .data <- read_excel(path, sheet, range = "E3:G14")

  .data <- .data %>%
    mutate(Year = year) %>%
    mutate(OperacionSalud = sheet)

  return(.data)
}
