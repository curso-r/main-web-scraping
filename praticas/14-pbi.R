library(RSelenium)

driver <- rsDriver(browser = "firefox")
u <- "https://paineis.cnj.jus.br/QvAJAXZfc/opendoc.htm?document=qvw_l%2FPainelCNJ.qvw&host=QVS%40neodimio03&anonymous=true&sheet=shPDPrincipal"

driver$client$navigate(u)
