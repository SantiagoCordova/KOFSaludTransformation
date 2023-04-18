#' read_SaludExcel
#'
#' @param path data path where Reporte FEMSA Indicadores Salud Género is saved and
#' each sheet is a Country with the specific standarized layout
#' @param sheet Country
#'
#' @return read Data
#' @export
#' @import readxl dplyr purrr stringr
#'
read_SaludExcel <- function(path, sheet){

  n <- path %>% stringr::str_count()
  year <- path %>%
    substr(., n-8,n) %>%
    substr(., 1,4) %>%
    as.numeric()

  .data <- read_excel(path, sheet, range = "B3:V15")

  names(.data) <- c('Mes', MetadataSalud$Nombres)

  .data <- .data %>%
    mutate(Mes = month.abb) %>%
    mutate(Year = year) %>%
    mutate(Fecha = paste(Mes, Year) %>% lubridate::my()) %>% select(-Mes) %>%
    mutate(OperacionSalud = sheet)

  return(.data)
}
