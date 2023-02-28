read.csv("2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = F)
spl_df <- read.csv("2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = F)

# What was the most checked out subject?
max_subject <- spl_df %>%
  count(Subjects) %>%
  filter(n == max(n, na.rm = T))

# WHat was the most checked out thing?
top_checkout <- spl_df%>% 
  filter(Checkouts == max(Checkouts, na.rm = T))

# How do the checkouts of books and ebooks compare every year?

booksvsebooks <- spl_df %>%
  filter(MaterialType %in% c("BOOK", "EBOOK")) %>%
  group_by(CheckoutYear, MaterialType) %>%
  summarize(sumcheckouts= sum(Checkouts))

#What Publisher had the most publishes?

MostPublish <- spl_df %>% 
  count(Publisher)
filter(n == max(n, na.rm = T))

    
# What month had the most check outs?
MostMonthCheckouts <- spl_df %>% 
  group_by(CheckoutMonth) %>%
  summarize(checkoutmonthtotal = sum(Checkouts, na.rm = T)) 