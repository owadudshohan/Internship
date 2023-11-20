# library(ggplot2)
# nz<-map_data("nz")
# ggplot(nz, mapping = aes(long, lat, group=group))+
# geom_polygon(fill="white", color="black")+
#   coord_map()

# library(ggplot2)
# nz<-map_data("nz")
# ggplot(nz, mapping = aes(long, lat, group= group))+
#   geom_polygon(fill="white", color="black")+
#   coord_map()

# library(ggplot2)
# nz<-map_data("nz")
# ggplot(nz, mapping = aes(long, lat, group=group))+
#   geom_polygon(fill="white", color="black")+
#   coord_map()
 
library(ggplot2)
nz<-map_data("nz")
ggplot(nz, mapping = aes(long, lat, group=group))+
  geom_polygon(fill="black", color="white")+
  coord_map()