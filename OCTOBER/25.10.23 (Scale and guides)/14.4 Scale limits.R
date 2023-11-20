library(ggplot2)
df <- data.frame(x = 1:6, y = 8:13)
base <- ggplot(df, aes(x, y)) + 
  geom_col(aes(fill = x)) +                    
  geom_vline(xintercept = 3.5, colour = "darkorange") # for visual clarity only

base
