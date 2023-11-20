library(ggplot2)
df <- data.frame(x = 1:3, y = 1:3)
base <- ggplot(df, aes(x, y)) + geom_point()
base_t <- base + labs(title = "This is a ggplot") + xlab("This is x") + ylab("This is y")
base_t + theme(axis.title.y  = element_text(margin = margin(r = 10, l=10)))+
   theme(axis.title.x  = element_text(margin = margin(t = 10, b=10)))