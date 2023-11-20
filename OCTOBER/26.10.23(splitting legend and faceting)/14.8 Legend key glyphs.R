library(ggplot2)
base <- ggplot(economics, aes(date, psavert, color = "Savings"))

base + geom_line()
base + geom_line(key_glyph = "timeseries")
#By specifying "timeseries" as the key glyph, you are indicating that you want to use a custom representation in the legend for this line. 