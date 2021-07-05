library(magrittr)

u0 <- "https://www4.tjmg.jus.br/juridico/sf/proc_resultado.jsp"
id <- "03024173020168130105"

q0 <- list(
  comrCodigo = stringr::str_sub(id, -4, -1),
  numero = "1",
  listaProcessos = id,
  btn_pesquisar = "Pesquisar"
)
r0 <- httr::GET(u0, query = q0)

# Encontrar o código gerador do CAPTCHA
captcha <- r0 %>%
  httr::content("text", encoding = "latin1") %>%
  xml2::read_html() %>%
  xml2::xml_find_first("//*[@id='captcha_image']") %>%
  xml2::xml_attr("src")

# Resolver o CAPTCHA
tmp <- tempfile(fileext = ".png")
httr::GET(
  paste0("https://www4.tjmg.jus.br/juridico/sf/", captcha),
  httr::write_disk(tmp, overwrite = TRUE)
)
solved_captcha <- decryptr::decrypt(tmp, "tjmg")

# Enviar a resposta do CAPTCHA
q1 <- list(
  "callCount" = "1",
  "nextReverseAjaxIndex" = "0",
  "c0-scriptName" = "ValidacaoCaptchaAction",
  "c0-methodName" = "isCaptchaValid",
  "c0-id" = "0",
  "c0-param0" = paste0("string:", solved_captcha),
  "batchId" = "0",
  "instanceId" = "0",
  "page" = "",
  "scriptSessionId" = ""
)
u1 <- "https://www4.tjmg.jus.br/juridico/sf/dwr/call/plaincall/ValidacaoCaptchaAction.isCaptchaValid.dwr"
r1 <- httr::POST(u_captcha, body = q1, encode = "form")

# Voltar para a requisição inicial
file <- paste0("~/Downloads/", id, ".html")
r2 <- httr::GET(u0, query = q0, httr::write_disk(file, overwrite = TRUE))
