library(ggplot2)
nz<-map_data("nz")
ggplot(nz, aes(long, lat, group=group))+
  geom_polygon(fill="darkorange", color="black")
  #coord_quickmap()