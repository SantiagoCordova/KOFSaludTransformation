#' Metadata Salud
#'
#' A subset of data from the World Health Organization Global Tuberculosis
#' Report ...
#'
#' @format ## `MetadataSalud`
#' A data frame with 20 rows and 4 columns:
#' \describe{
#'   \item{Nombres}{Unique concated names}
#'   \item{Concepto}{Grouped concept of the data}
#'   \item{Variable}{Type of count}
#'   \item{Género}{Gender data}
#'   ...
#' }
#'
#' MetadataSalud <- data.frame(
#' Nombres = c('HCMasculino', 'HCFemenino',
#'             'EnfGeneralCasosMasculino', 'EnfGeneralCasosFemenino',
#'             'EnfGeneralDiasPerdMasculino', 'EnfGeneralDiasPerdFemenino',
#'             'CovidCasosMasculino', 'CovidCasosFemenino',
#'             'CovidDiasPerdMasculino', 'CovidDiasPerdFemenino',
#'             'EnfProfCasosMasculino', 'EnfProfCasosFemenino',
#'             'EnfProfDiasPerdMasculino', 'EnfProfDiasPerdFemenino',
#'             'EnfGeneralFatalidadMasculino', 'EnfGeneralFatalidadFemenino',
#'             'HechosViolFatalidadMasculino', 'HechosViolFatalidadFemenino',
#'             'MaternidadCasosFemenino', 'MaternidadDiasFemenino'),
#' Concepto = c(rep('HC',2), rep('Enfermedad General',4), rep('Covid',4),
#'              rep('Enfermedad Profesional',4), rep('Enfermedad General',2), rep('HechosViolentos',2),
#'              rep('Maternidad',2)),
#' Variable  = c(rep('HC',2),
#'               rep('Casos',2), rep('Dias',2),
#'               rep('Casos',2), rep('Dias',2),
#'               rep('Casos',2), rep('Dias',2),
#'               rep('Fatalidad', 4),
#'               rep('Casos',1), rep('Dias',1)),
#' Genero    = c(rep(c('Masculino','Femenino'),9),rep('Femenino',2)))
#'
