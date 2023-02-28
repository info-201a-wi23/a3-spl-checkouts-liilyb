spl_df <- read.csv("2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = F)

#How many of each material type gets checked out for each year?
library("dplyr")
library("ggplot2")
yearlymaterialtype <- spl_df %>%
  filter(MaterialType %in% c("BOOK", "EBOOK", "AUDIOBOOK", "VIDEODISC", "REGPRINT")) %>%
  group_by(CheckoutYear, MaterialType) %>%
  summarize(added_checkouts= sum(Checkouts))

ggplot(data = yearlymaterialtype) +
  geom_line(mapping = aes(x= CheckoutYear, y = added_checkouts, color = MaterialType)) +
  labs(title = "The Number of Checkouts for Each Material Type Each Year From 2017 to 2023",
       x = "Checkout Year",
       y = "The Amount of Checkouts",
       color = "Material Type")

