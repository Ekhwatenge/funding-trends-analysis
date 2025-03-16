# Funding Trends Analysis

In this repository we share the code and data to analyze incoming funding trends for various projects, focusing on source organizations, countries, and project types. The analysis was conducted using R, and the results provides insights into global contributions and sectoral funding allocations for the year 2024.

## Table of Contents
- [Data](#data)
- [Analysis](#analysis)
- [Visualizations](#visualizations)
- [Report](#report)
- [Requirements](#requirements)
- [Usage](#usage)

## Data
The data used for this analysis is stored in the `data/` folder. The primary dataset `fts_incoming_funding_bwa.csv` contains funding information such as:
- Date of funding
- Project description
- Source organization and country
- Funding amount in USD and other currencies
- Decision and reporting dates

## Analysis
The R script for performing the analysis is in `analysis/funding_analysis.R`. Analyses includes the following
- **Total Funding by Year-** Overview of funding trends by year.
- **Top Funders-** Identification of top contributing organizations.
- **Funding by Country-** Breakdown of contributions by source countries.
- **Sectoral Analysis-** Distribution of funding across various project sectors.
- **Currency Conversion Analysis-** Comparisons between original currencies and their USD equivalents.
- **Decision Date Analysis-** the timing between funding decisions and reports.

## Visualizations
The analysis generates several visualizations, including:
- Total funding by year
- Top 10 funders
- Funding by country
- Funding by project/sector

These visualizations are produced using `ggplot2` in R.

## Report
An RMarkdown file (`analysis/funding_report.Rmd`) is included to generate a detailed report on the funding analysis. The report can be rendered as an HTML or PDF file.

## Requirements
Ensure you have the following R packages installed:
- `dplyr`
- `ggplot2`
- `readr`
- `rmarkdown` (for report generation)

You can install these packages using:
```r
install.packages(c("dplyr", "ggplot2", "readr", "rmarkdown"))
