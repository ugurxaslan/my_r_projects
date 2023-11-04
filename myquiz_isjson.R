install.packages("jsonlite")
Sys.sleep(5)  # 5 saniye beklemek için
library(jsonlite)
install.packages("httr")
Sys.sleep(5)  # 5 saniye beklemek için
library(httr)


github_url <- "https://raw.githubusercontent.com/CevikYazilimGelistirme-2324/Exercises/main/Week3/example_2.json"
response <- GET(github_url)
json_data <- content(response, as = "text")
json_data <- fromJSON(json_data)
# JSON verisi artık R veri yapısında kullanılabilir


stopifnot(exists("json_data"))
stopifnot(is.list(json_data))
stopifnot(length(json_data) == 1)
stopifnot(names(json_data) == "quiz")

# "maths" kategorisindeki "q1" altındaki "options" ve "answer" öğelerini eleman eleman sayısal olarak dönüştürün
json_data$quiz$maths$q1$options <- sapply(json_data$quiz$maths$q1$options, function(x) as.numeric(x))
json_data$quiz$maths$q1$answer <- as.numeric(json_data$quiz$maths$q1$answer)

# "maths" kategorisindeki "q2" altındaki "options" ve "answer" öğelerini eleman eleman sayısal olarak dönüştürün
json_data$quiz$maths$q2$options <- sapply(json_data$quiz$maths$q2$options, function(x) as.numeric(x))
json_data$quiz$maths$q2$answer <- as.numeric(json_data$quiz$maths$q2$answer[1])

stopifnot(all(is.numeric(json_data$quiz$maths$q1$options)))
myquiz <- json_data
myquiz
