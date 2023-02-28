spl_df <- read.csv("2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = F)

library("dplyr")
library("ggplot2")
checkoutsubjects <- spl_df %>%
  filter(Subjects %in% c("Fiction", "Nonfiction")) %>%
  group_by(CheckoutYear, Subjects) %>%
  summarize(subjectsperyear= sum(Checkouts))


ggplot(data = checkoutsubjects) +
  geom_line(mapping = aes(x= CheckoutYear, y = subjectsperyear, color = Subjects)) +
  labs(title = "The Number of Checkouts for Fiction vs. Nonfiction Materials at Seattle Libraries from 2017 to 2023",
       x = "Checkout Year",
       y = "The Amount of Checkouts",
       color = "Material Type")
