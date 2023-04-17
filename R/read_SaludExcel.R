#' read_SaludExcel
#'
#' @param path data path where Reporte FEMSA Indicadores Salud Género is saved and
#' each sheet is a Country with the specific standarized layout
#' @param sheet Country
#'
#' @return read Data
#' @export
#' @import readxl dplyr purrr
#'
read_SaludExcel <- function(path, sheet){

  .data <- read_excel(path, sheet, range = "B3:V15")

  names(.data) <- c('Mes', MetadataSalud$Nombres)

  .data <- .data %>%
    mutate(Mes = month.abb) %>%
    mutate(OperacionSalud = sheet)

  return(.data)
}
