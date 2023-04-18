#' munge_SaludExcel
#'
#' @param .path data path where Reporte FEMSA Indicadores Salud Género is saved and
#' each sheet is a Country with the specific standarized layout
#'
#' @return .data a standarized data frame with a long format
#' @import readxl dplyr purrr
#' @export
#'
munge_SaludExcel <- function(.path){

  .data <- .path %>%
    excel_sheets() %>%
    set_names() %>%
    map_df(read_SaludExcel, path = .path)

  .data <- .data %>%
    replace(is.na(.),0) %>%
    left_join(., OperacionNames) %>%
    select(-OperacionSalud) %>%
    pivot_longer(., cols = !c(Fecha, Operación), names_to = 'Nombres', values_to = 'N') %>%
    left_join(., MetadataSalud)

  return(.data)
}
