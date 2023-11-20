ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = depth), bins = 10)
# use when working with continuous data and want to visualize its distribution, geom_histogram
#It divides the data into intervals (bins) and shows the frequency or count of data points within each bin.
#commonly used with continuous data to visualize the distribution.
