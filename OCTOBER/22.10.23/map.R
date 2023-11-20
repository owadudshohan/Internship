library(ggplot2)
nz<-map_data("nz")
ggplot(nz, aes(long, lat, group=group))+
  geom_polygon(fill="white", color="black")+
  coord_map()