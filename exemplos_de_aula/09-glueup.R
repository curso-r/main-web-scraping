library(magrittr)

# glue up -----------------------------------------------------------------

r <- httr::GET("https://app.glueup.com")

u <- "https://app.glueup.com/account/login/iframe/"

r <- httr::POST(u, body = list(
  "email" = Sys.getenv("GLUEUP_USER"),
  "password" = Sys.getenv("GLUEUP_PWD"),
  "stayOnPage" = "",
  "showFirstTimeModal" = "true"
), encode = "form")

r

r_home <- httr::GET("https://app.glueup.com")
scrapr::html_view(r_home)
