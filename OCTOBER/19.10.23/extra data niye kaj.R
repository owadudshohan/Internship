# library(ggplot2)
# demo <- data.frame(
#   cut = c("Fair", "Good", "Very Good", "Premium", "Ideal"),
#   freq = c(1610, 4906, 12082, 13791, 21551)
# )
# 
# ggplot(data = demo) +
#   geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")


#stat = "identity" , we are asking R to use the y-value we provide for the dependent variable.

library(ggplot2)
demo<-data.frame(
  cut=c("Dhaka", "Rajshahi", "Khulna", "Barisal","chittagong", "Rangpur", "Mymensingh", "Sylhet"),
  freq=c(20724,16728,18425,10258,6852,19525,17128,12512)
)
ggplot(data=demo)+
  geom_bar(mapping = aes(x=cut, y=freq, fill=cut), stat="identity")