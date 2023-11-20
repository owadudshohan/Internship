library(ggplot2)
df <- data.frame(x = 1:3, y = 1:3)
base <- ggplot(df, aes(x, y)) + geom_point()
#base + theme_light() + ggtitle("theme_light()")
#This theme is designed to create plots with a simple and clean appearance, featuring light gray backgrounds and black text

#base + theme_dark() + ggtitle("theme_dark()")

base + theme_minimal()  + ggtitle("theme_minimal()")
#This theme is designed to create plots with a minimalist and clean appearance, featuring a white background with no gridlines or unnecessary decorations.