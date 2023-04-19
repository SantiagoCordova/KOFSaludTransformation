#' build_DesSocialData
#'
#' @param .data data built with munge_DSVExcel
#'
#' @return Desorollo Social Aggragted data
#' @export
#'
build_DesSocialData <- function(.data){
  .data <- .data %>%
    filter(Sistema == 'Desarrollo Social') %>%
    group_by(Operación,  Sistema,`Dimensión de Desarrollo Social`, Date) %>%
    summarise(
      Actividades = n(),
      Propios     = sum(`# de Colaboradores / Voluntarios Internos`),
      Externos    = sum(`# de Personas/Voluntarios Externos`),
      HorasTotales    = sum(`Horas Totales por Capacitación`),
      # HorasVol    = sum(`Horas Totales del Voluntariado`),
      Inversion   = sum(`InvMX`)) %>%
    rename(Agrupador = `Dimensión de Desarrollo Social`)

  return(.data)

}
