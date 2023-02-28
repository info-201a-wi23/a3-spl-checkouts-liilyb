spl_df <- read.csv("2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = F)

library("dplyr")
library("ggplot2")
booksvsebooks <- spl_df %>%
  filter(MaterialType %in% c("BOOK", "EBOOK")) %>%
  group_by(CheckoutYear, MaterialType) %>%
  summarize(TotalCheckouts= sum(Checkouts))

ggplot(data = booksvsebooks) +
  geom_col(aes(x = CheckoutYear,
               y = TotalCheckouts,
               fill = MaterialType),
              position = "dodge")



