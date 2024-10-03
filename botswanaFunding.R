
# Load the dataset
data <- read.csv("C:\\Users\\elvir\\OneDrive\\Desktop\\RProjects\\Botswana - Requirements and Funding Data\\BotswanaFinancialGund\\fts_incoming_funding_bwa.csv")

# Clean and convert necessary columns
data <- data %>%
  filter(!is.na(amountUSD)) %>%
  mutate(
    date = as.Date(date, format="%Y-%m-%d"),
    amountUSD = as.numeric(amountUSD)
  )
#calculate total funding by year

# Summarize total funding by year
funding_by_year <- data %>%
  group_by(budgetYear) %>%
  summarise(total_funding = sum(amountUSD, na.rm=TRUE))

# Plot the total funding by year
ggplot(funding_by_year, aes(x=budgetYear, y=total_funding)) +
  geom_bar(stat="identity", fill="blue") +
  labs(title="Total Funding by Year", x="Year", y="Total Funding (USD)")

#generate the top funders
install.packages("ggplot2")

# Summarize total funding by source organization
top_funders <- data %>%
  group_by(srcOrganization) %>%
  summarise(total_funding = sum(amountUSD, na.rm=TRUE)) %>%
  arrange(desc(total_funding)) %>%
  top_n(10, total_funding)

# Plot the top 10 funders
ggplot(top_funders, aes(x=reorder(srcOrganization, -total_funding), y=total_funding)) +
  geom_bar(stat="identity", fill="green") +
  labs(title="Top 10 Funders", x="Source Organization", y="Total Funding (USD)") +
  theme(axis.text.x = element_text(angle=45, hjust=1))

# Summarize total funding by source country
funding_by_country <- data %>%
  group_by(srcLocations) %>%
  summarise(total_funding = sum(amountUSD, na.rm=TRUE)) %>%
  arrange(desc(total_funding))

# Plot the top contributing countries
ggplot(funding_by_country, aes(x=reorder(srcLocations, -total_funding), y=total_funding)) +
  geom_bar(stat="identity", fill="orange") +
  labs(title="Funding by Country", x="Source Country", y="Total Funding (USD)") +
  theme(axis.text.x = element_text(angle=45, hjust=1))

#funding by sector

# Summarize total funding by project description
funding_by_sector <- data %>%
  group_by(description) %>%
  summarise(total_funding = sum(amountUSD, na.rm=TRUE)) %>%
  arrange(desc(total_funding)) %>%
  top_n(10, total_funding)

# Plot funding by project/sector
ggplot(funding_by_sector, aes(x=reorder(description, -total_funding), y=total_funding)) +
  geom_bar(stat="identity", fill="purple") +
  labs(title="Funding by Project/Sector", x="Project Description", y="Total Funding (USD)") +
  theme(axis.text.x = element_text(angle=45, hjust=1))

#currency conversion analysis
# Display original currency vs USD amounts
data %>%
  select(originalAmount, originalCurrency, amountUSD) %>%
  filter(!is.na(originalAmount), !is.na(amountUSD)) %>%
  head()

#decision date analysis
# Calculate the time difference between decision date and first reported date
data <- data %>%
  mutate(
    decisionDate = as.Date(decisionDate, format="%Y-%m-%d"),
    firstReportedDate = as.Date(firstReportedDate, format="%Y-%m-%d"),
    days_between = as.numeric(difftime(firstReportedDate, decisionDate, units = "days"))
  )

# Summarize the average days between decision and reporting
avg_days <- data %>%
  summarise(avg_days_between = mean(days_between, na.rm=TRUE))

# Print the result
print(avg_days)

