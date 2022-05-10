library(httr)
library(jsonlite)


# cep ---------------------------------------------------------------------

u_base <- "https://brasilapi.com.br/api"
endpoint_cep <- "/cep/v2/"

# vamos gerar um CEP válido aqui: https://www.geradordecep.com.br
cep <- "58084435"

u_cep <- paste0(u_base, endpoint_cep, cep)
r_cep <- GET(u_cep)

# Vamos entender as diferentes formas de pegar o resultado

content(r_cep)
content(r_cep, as = "text")
content(r_cep, as = "raw")
content(r_cep, as = "parsed")

# agora vamos pesquisar na tabela FIPE

endpoint_fipe <- "/fipe/marcas/v1/"
tipo_veiculo <- "carros"
u_fipe <- paste0(u_base, endpoint_fipe, tipo_veiculo)
r_fipe <- GET(u_fipe)

content(r_fipe, simplifyDataFrame = TRUE)

## transformando resultado em um data frame

## lendo com jsonlite

## salvando em arquivo

## lendo arquivo com jsonlite

## e o parâmetro?

endpoint_fipe_tabelas <- "/fipe/tabelas/v1"
u_fipe_tabelas <- paste0(u_base, endpoint_fipe_tabelas)
r_fipe_tabelas <- GET(u_fipe_tabelas)

tabelas <- r_fipe_tabelas |> 
  httr::content(simplifyDataFrame = TRUE) |> 
  tibble::as_tibble()

## chamando com um parâmetro

query_fipe <- list(
  tabela_referencia = "270"
)

r_fipe_query <- GET(u_fipe, query = query_fipe)

## outra forma de usar query


# preco de carro na FIPE --------------------------------------------------

## infelizmente ainda não dá para pegar a lista de carros pela Brasil API
## https://github.com/BrasilAPI/BrasilAPI/issues/373

## Mas nós podemos pegar aqui: https://www.tabelafipebrasil.com/fipe/carros
## (depois podemos fazer isso via web scraping!)

endpoint_preco <- "/fipe/preco/v1/"
cod_veiculo <- "060006-7"
u_preco <- paste0(u_base, endpoint_preco, cod_veiculo)
r_preco <- GET(u_preco)

content(r_preco, simplifyDataFrame = TRUE)
