
library(ggplot2) # For visualization
library(dplyr)   # For data manipulation
library(readr)   # For reading CSV files


household_living_costs_price_indexes_june_2024_quarter_time_series_indexes_1_ <- read_csv("~/Downloads/household-living-costs-price-indexes-june-2024-quarter-time-series-indexes (1).csv")
View(household_living_costs_price_indexes_june_2024_quarter_time_series_indexes_1_)


hlpi_data <- read_csv("~/Downloads/household-living-costs-price-indexes-june-2024-quarter-time-series-indexes (1).csv")

head(hlpi_data)


str(hlpi_data)

hlpi_data_cleaned <- hlpi_data %>%
  filter(!is.na(index)) %>%
  select(hlpi_name, quarter, nzhec_name, index, change.q, change.a)

summary_data <- hlpi_data_cleaned %>%
  group_by(hlpi_name, nzhec_name) %>%
  summarise(
    Avg_Index = mean(index, na.rm = TRUE),
    Avg_Quarterly_Change = mean(change.q, na.rm = TRUE),
    Avg_Annual_Change = mean(change.a, na.rm = TRUE)
  )


print(summary_data)


ggplot(hlpi_data_cleaned, aes(x = quarter, y = index, color = hlpi_name, group = hlpi_name)) +
  geom_line() +
  facet_wrap(~ nzhec_name) +  
  labs(title = "Household Living Costs Index Over Time",
       x = "Quarter",
       y = "Living Costs Index") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme_minimal()


write_csv(hlpi_data_cleaned, "cleaned_hlpi_data.csv")


ggplot(hlpi_data_cleaned, aes(x = quarter, y = index, color = hlpi_name, group = hlpi_name)) +
  geom_line() +
  facet_wrap(~ nzhec_name) +  # Faceting by expenditure category
  labs(title = "Household Living Costs Index Over Time",
       x = "Quarter",
       y = "Living Costs Index") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme_minimal()


ggplot(hlpi_data_cleaned, aes(x = quarter, y = change.q, color = hlpi_name)) +
  geom_line() +
  labs(title = "Quarterly Change in Household Living Costs",
       x = "Quarter",
       y = "Quarterly Change (%)") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme_minimal()

ggplot(hlpi_data_cleaned, aes(x = quarter, y = change.a, color = hlpi_name)) +
  geom_line() +
  labs(title = "Annual Change in Household Living Costs",
       x = "Quarter",
       y = "Annual Change (%)") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme_minimal()


write_csv(hlpi_data_cleaned, "cleaned_hlpi_data.csv")

hlpi_data_cleaned <- hlpi_data %>%
  filter(!is.na(index)) %>%
  select(hlpi_name, quarter, nzhec_name, index, change.q, change.a)

summary_by_expense <- hlpi_data_cleaned %>%
  group_by(nzhec_name) %>%
  summarise(
    Avg_Index = mean(index, na.rm = TRUE),
    Avg_Quarterly_Change = mean(change.q, na.rm = TRUE),
    Avg_Annual_Change = mean(change.a, na.rm = TRUE)
  )

ggplot(hlpi_data_cleaned, aes(x = quarter, y = index, color = hlpi_name, group = hlpi_name)) +
  geom_line() +
  facet_wrap(~ nzhec_name) + 
  labs(title = "Household Living Costs Index Over Time by Expense Type",
       x = "Quarter",
       y = "Living Costs Index") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme_minimal()

7.1 Analysis and Plot for "Food"
food_data <- hlpi_data_cleaned %>%
  filter(nzhec_name == "Food")

ggplot(food_data, aes(x = quarter, y = index, color = hlpi_name, group = hlpi_name)) +
  geom_line() +
  labs(title = "Household Living Costs Index: Food",
       x = "Quarter",
       y = "Living Costs Index (Food)") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme_minimal()


housing_data <- hlpi_data_cleaned %>%
  filter(nzhec_name == "Housing")

ggplot(housing_data, aes(x = quarter, y = index, color = hlpi_name, group = hlpi_name)) +
  geom_line() +
  labs(title = "Household Living Costs Index: Housing",
       x = "Quarter",
       y = "Living Costs Index (Housing)") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme_minimal()

loan_data <- hlpi_data_cleaned %>%
  filter(nzhec_name == "Loan")  # Replace with actual loan category

ggplot(loan_data, aes(x = quarter, y = index, color = hlpi_name, group = hlpi_name)) +
  geom_line() +
  labs(title = "Household Living Costs Index: Loan",
       x = "Quarter",
       y = "Living Costs Index (Loan)") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme_minimal()

library(readr)   
library(dplyr)   
library(ggplot2)  


hlpi_data <- read_csv(file_path)

head(hlpi_data)


hlpi_data_cleaned <- hlpi_data %>%
  filter(!is.na(index)) %>%
  select(hlpi_name, quarter, nzhec_name, index, change.q, change.a)


expense_categories <- unique(hlpi_data_cleaned$nzhec_name)


for (category in expense_categories) {

  category_data <- hlpi_data_cleaned %>%
    filter(nzhec_name == category)
  

  summary_category <- category_data %>%
    group_by(hlpi_name) %>%
    summarise(
      Avg_Index = mean(index, na.rm = TRUE),
      Avg_Quarterly_Change = mean(change.q, na.rm = TRUE),
      Avg_Annual_Change = mean(change.a, na.rm = TRUE)
    )
  

  print(paste("Summary for:", category))
  print(summary_category)
  

  ggplot(category_data, aes(x = quarter, y = index, color = hlpi_name, group = hlpi_name)) +
    geom_line() +
    labs(title = paste("Household Living Costs Index:", category),
         x = "Quarter",
         y = paste("Living Costs Index (", category, ")", sep = "")) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
    theme_minimal()
}

for (category in expense_categories) {

  category_data <- hlpi_data_cleaned %>%
    filter(nzhec_name == category)
  

  summary_category <- category_data %>%
    group_by(hlpi_name) %>%
    summarise(
      Avg_Index = mean(index, na.rm = TRUE),
      Avg_Quarterly_Change = mean(change.q, na.rm = TRUE),
      Avg_Annual_Change = mean(change.a, na.rm = TRUE)
    )

  print(paste("Summary for:", category))
  print(summary_category)
  

  ggplot(category_data, aes(x = quarter, y = index, color = hlpi_name, group = hlpi_name)) +
    geom_line() +
    labs(title = paste("Household Living Costs Index:", category),
         x = "Quarter",
         y = paste("Living Costs Index (", category, ")", sep = "")) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
    theme_minimal()
}
  

categories <- c(
  "Food", "Fruit and vegetables", "Meat, poultry and fish", "Grocery food",
  "Non-alcoholic beverages", "Restaurant meals and ready-to-eat food",
  "Alcoholic beverages and tobacco", "Alcoholic beverages", "Cigarettes and tobacco",
  "Clothing and footwear", "Clothing", "Footwear", "Housing and household utilities",
  "Actual rentals for housing", "Property maintenance", "Property rates and related services",
  "Local authority rates and payments", "Household energy", "Electricity", 
  "Household contents and services", "Furniture, furnishings and floor coverings",
  "Household textiles", "Household appliances", "Glassware, tableware and household utensils",
  "Tools and equipment for house and garden", "Other household supplies and services", "Health",
  "Medical products, appliances and equipment", "Out-patient services", "Hospital services",
  "Transport", "Purchase of vehicles", "Private transport supplies and services", "Petrol",
  "Passenger transport services", "Communication", "Postal services", "Telecommunication equipment",
  "Telecommunication services", "Recreation and culture", "Audio-visual and computing equipment",
  "Major recreational and cultural equipment", "Other recreational equipment and supplies",
  "Recreational and cultural services", "Newspapers, books and stationery", "Accommodation services",
  "Education", "Early childhood education", "Primary and secondary education",
  "Tertiary and other post-school education", "Other educational fees", "Miscellaneous goods and services",
  "Personal care", "Personal effects", "Insurance", "Credit services", "Other miscellaneous services",
  "Interest payments", "All groups"
)

for (category in categories) {
  

  category_data <- hlpi_data_cleaned %>%
    filter(nzhec_name == category)
  

  print(paste("Generating plot for category:", category))
  

  p <- ggplot(category_data, aes(x = quarter, y = index, color = hlpi_name, group = hlpi_name)) +
    geom_line() +
    labs(title = paste("Household Living Costs Index:", category),
         x = "Quarter",
         y = paste("Living Costs Index (", category, ")", sep = "")) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
    theme_minimal()

  print(p)
}


for (category in categories) {
  

  category_data <- hlpi_data_cleaned %>%
    filter(nzhec_name == category)
  

  print(paste("Generating plot for category:", category))
  

  if (nrow(category_data) > 0) {

    p <- ggplot(category_data, aes(x = quarter, y = index, color = hlpi_name, group = hlpi_name)) +
      geom_line() +
      labs(title = paste("Household Living Costs Index:", category),
           x = "Quarter",
           y = paste("Living Costs Index (", category, ")", sep = "")) +
      theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
      theme_minimal()
    

    print(p)
  } else {
    print(paste("No data for category:", category))
  }
}


food_data <- hlpi_data_cleaned %>%
  filter(nzhec_name == "Food")

ggplot(food_data, aes(x = quarter, y = index, color = hlpi_name, group = hlpi_name)) +
  geom_line() +
  labs(title = "Household Living Costs Index: Food",
       x = "Quarter",
       y = "Living Costs Index (Food)") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme_minimal()

housing_utilities_data <- hlpi_data_cleaned %>%
  filter(nzhec_name == "Housing and household utilities")


ggplot(housing_utilities_data, aes(x = quarter, y = index, color = hlpi_name, group = hlpi_name)) +
  geom_line() +
  labs(title = "Household Living Costs Index: Housing and Household Utilities",
       x = "Quarter",
       y = "Living Costs Index (Housing and Household Utilities)") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme_minimal()


alcohol_tobacco_data <- hlpi_data_cleaned %>%
  filter(nzhec_name == "Alcoholic beverages and tobacco")


ggplot(alcohol_tobacco_data, aes(x = quarter, y = index, color = hlpi_name, group = hlpi_name)) +
  geom_line() +
  labs(title = "Household Living Costs Index: Alcoholic Beverages and Tobacco",
       x = "Quarter",
       y = "Living Costs Index (Alcoholic Beverages and Tobacco)") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme_minimal()
