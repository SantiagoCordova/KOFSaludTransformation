#' build_VoluntariadoData
#'
#' @param .data data built with munge_DSVExcel
#'
#' @return Voluntariado Aggragted data
#' @export
#'
build_VoluntariadoData <- function(.data){
  .data <- .data %>%
    filter(Sistema == 'Voluntariado') %>%
    group_by(Operación,  Sistema, `Causas de Voluntariado`, Date) %>%
    summarise(
      Actividades = n(),
      Propios     = sum(`# de Colaboradores / Voluntarios Internos`),
      Externos    = sum(`# de Personas/Voluntarios Externos`),
      HorasTotales    = sum(`Horas Totales del Voluntariado`),
      # HorasVol    = sum(`Horas Totales del Voluntariado`),
      Inversion   = sum(`InvMX`)) %>%
    rename(Agrupador = `Causas de Voluntariado`)

  return(.data)

}
