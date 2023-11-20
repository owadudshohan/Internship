library(ggplot2)
library(dplyr)

df_sum <- df %>% 
  group_by(z) %>% 
  summarise(x = mean(x), y = mean(y)) %>%
  rename(z2 = z)

df2 <- dplyr::select(df, -z)

ggplot(df, aes(x, y)) + 
  geom_point(data = df2, colour = "grey70") +
  geom_point(aes(colour = z)) + 
  facet_wrap(~z)