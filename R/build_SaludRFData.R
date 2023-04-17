
#' build_SaludRFData
#'
#' @param .data munged Salud Data Frame
#'
#' @return .data transfomed Salud Data Frame to fit RF layout
#' @import readxl dplyr purrr
#' @export
#'

build_SaludRFData <- function(.data){
  .data <- .data %>%
    filter(Concepto %in% c("Enfermedad General", "Covid"), Variable != 'Fatalidad') %>%
    group_by(Operación, Fecha, Concepto, Variable) %>%
    summarise(n = sum(N)) %>%
    pivot_wider(., names_from = c(Variable), values_from = n) %>%
    mutate(Agrupador = "Enfermedad", Género = NA, Mes = lubridate::month(Fecha),
           Año = lubridate::year(Fecha)) %>%
    rename('Días'  = Dias) %>%
    select(Fecha, Mes, Año, Operación, Agrupador, Concepto, Género, Casos, Días)
}
