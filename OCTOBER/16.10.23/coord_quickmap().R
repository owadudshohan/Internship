library(ggplot2)
nz <- map_data("nz")

# ggplot(nz, aes(long, lat, group = group)) +
#   geom_polygon(fill = "white", colour = "black")+
#   coord_map()

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black")+
  coord_quickmap()
# 
# 
# ggplot(nz, aes(long, lat, group = group)) +
#   geom_polygon(fill = "white", colour = "black")

