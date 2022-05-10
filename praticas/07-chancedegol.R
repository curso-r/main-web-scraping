library(tidyverse)
library(httr)
library(rvest)
library(xml2)

u_cdg <- "http://www.chancedegol.com.br/br21.htm"

cdg_html <- GET(u_cdg)

cdg_table <- cdg_html  |>
  read_html() |>
  xml_find_first('//table') |>
  html_table()

cores <- cdg_html |>
  read_html() |>
  xml_find_all('//font[@color="#FF0000"]') |>
  xml_text()

