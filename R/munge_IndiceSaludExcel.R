#' munge_IndiceSaludExcel
#'
#' @param .path data path where Indice de Salud Report is saved and
#' each sheet is a Country with the specific standarized layout
#'
#' @return .data a standarized data frame with a long format for Health index
#' @import readxl dplyr purrr
#' @export
#'

munge_IndiceSaludExcel <- function(.path){
  .data <- (.path %>%
              excel_sheets() %>%
              set_names())[-c(1,2,14,15,16)] %>%
    map_df(read_IndiceSaludExcel, path = .path)
  .data <- .data %>%
    mutate(OperacionSalud = ifelse(OperacionSalud == 'índice de Salud KOF', 'KOF', OperacionSalud)) %>%
    replace(is.na(.),0)
  .data <- .data %>%
    select(OperacionSalud, Factor, `N° de Personas`, Year)

  return(.data)
}
