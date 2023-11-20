library(ggplot2)
demo<-data.frame(
  gender=c("Male", "Female", "Common Gender"),
  Total=c(80000000, 80000000, 20000000)
)
ggplot(data=demo)+
  geom_bar(mapping = aes(x=gender, y=Total), stat = "identity")