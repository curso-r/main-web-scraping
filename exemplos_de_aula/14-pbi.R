library(RSelenium)
library(magrittr)

driver <- rsDriver(browser = "firefox")
u <- "https://app.powerbi.com/view?r=eyJrIjoiMjcxNDIyNjAtOGM0Yi00ZWJhLWJkNmEtNjFiOTI0MWVlYjNiIiwidCI6IjI1NmNiNTA1LTAzOWYtNGZiMi04NWE2LWEzZTgzMzI4NTU3OCIsImMiOjh9"

driver$client$navigate(u)

# Clicar no brasil
el <- driver$client$findElement("xpath", "//*[@class='slicer-dropdown-menu']")
el$clickElement()

# Encontrar um elemento usando scrollBy()
scroll <- driver$client$findElement("xpath", "//*[contains(@class, 'scroll-scrolly_visible')]")
scroll$executeScript("arguments[0].scrollBy(0,400);", args = list(scroll))

checkbox <- driver$client$findElement("xpath", "//*[@title='Brazil']")
checkbox$clickElement()
