#' munge_DSVExcel
#'
#' @param .path path where <Formato Indicadores Desarrollo Social> excel is saved
#'
#' @return munged Fornmato Indicadores Desarollo Social
#' @export
#'
munge_DSVExcel <- function(.path){
  .data <- read_excel(.path,
                  sheet = "Indicadores DS",
                  skip = 15)

  .data <- .data %>%
    mutate(País = ifelse(País == "Mexico", "México", País)) %>%
    mutate(País = ifelse(País == "RAMSA", "Corporativo", País)) %>%
    mutate(País = ifelse(País == "Panama", "Panamá", País)) %>%
    filter(!País %>% is.na()) %>%
    mutate(Operación = País) %>%
    mutate(País = ifelse(País == "Corporativo", "México", País)) %>%
    mutate(`Fecha Inicio\r\n(DD/MM/AAAA)` = `Fecha Inicio\r\n(DD/MM/AAAA)` %>%
             lubridate::ymd()) %>%
    mutate(`Fecha Fin\r\n(DD/MM/AAAA)` = `Fecha Inicio\r\n(DD/MM/AAAA)` %>%
             lubridate::ymd()) %>%
    mutate(`# de Personas/Voluntarios Externos` = `# de Personas/Voluntarios Externos` %>%
             as.numeric()) %>%
    mutate(`Eje Rector de Sostenibilidad` = `Eje Rector de Sostenibilidad` %>% stringi::stri_trans_totitle(.)) %>%
    mutate(`Causas de Voluntariado` = `Causas de Voluntariado` %>% stringi::stri_trans_totitle(.))

  .data <- .data %>%
    mutate(Date = lubridate::ym(paste(lubridate::year(`Fecha Inicio\r\n(DD/MM/AAAA)`), lubridate::month(`Fecha Inicio\r\n(DD/MM/AAAA)`)))) %>%
    rename(To = 'País') %>%
    mutate(From = 'México') %>%
    dplyr::left_join(., TipoCambio::kofTCClose) %>%
    mutate(InvMX = `Inversión Total`*TC)

  return(.data)
}
