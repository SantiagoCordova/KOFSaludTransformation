#' build_DSVData
#'
#' @param .path path where <Formato Indicadores Desarrollo Social> excel is saved
#' @return Desorollo Social and Voluntariado Aggragted data
#' @export
#'
build_DSVData <- function(.path){

  .data   <- .path %>% munge_DSVExcel(.)
  .dataDS <- .data %>% build_DesSocialData(.)
  .dataV  <- .data %>% build_VoluntariadoData(.)

  .data   <- rbind(.dataDS, .dataV)

  return(.data)
}
