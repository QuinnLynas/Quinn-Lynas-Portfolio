library(ggplot2)
library(tidyverse)

stock_data <- read_csv("~/Desktop/stock_details_5_years.csv")

stock_data <- stock_data |>
  group_by(Company, Date) |>
  mutate(Day_Change = Close - Open) |>
  ungroup() |>
  mutate(Sector = case_when(Company %in% c("AAPL", "MSFT", "GOOGL",
                                           "NVDA", "META", "AVGO", "ORCL",
                                           "ADBE", "ASML", "CRM", "ACN", "IBM",
                                           "AMD", "TXN", "INTC", "SAP", "ADP", "INTU",
                                           "NOW", "CDNS", "SNPS", "KLAC", "LRCX", "MRVL",
                                           "MU", "ANET", "NXPI", "PANW", "ZS", "MDB", "NET",
                                           "DDOG", "PLTR", "ARM") ~ "Information Technology",
                            Company %in% c("DIS", "NFLX", "CMCSA", "TMUS", "VZ", "T",
                                           "SNAP", "EBAY", "RBLX", "SPOT", "SONY") ~ "Communication Services",
                            Company %in% c("AMZN", "TSLA", "HD", "MCD", "NKE", "SBUX",
                                           "TGT", "LOW", "CMG", "BKNG", "MAR", "TJX", "RCL", "HLT",
                                           "DG", "DLTR", "F", "GM", "STLA", "LI", "JD", "PDD",
                                           "CPNG", "BEKE") ~ "Consumer Discretionary",
                            Company %in% c("WMT", "PG", "KO", "PEP", "COST", "PM",
                                           "MO", "MDLZ", "KHC", "HSY", "CL", "KMB", "UL") ~ "Consumer Staples",
                            Company %in% c("LLY", "UNH", "JNJ", "NVO", "MRK", "ABBV", "PFE", "ABT",
                                           "AMGN", "BMY", "TMO", "ISRG", "MDT", "SYK", "ZTS", "REGN",
                                           "CI", "HUM", "MCK", "CVS", "DHR", "VRTX", "DXCM", "BDX", 
                                           "BSX", "SNY", "AZN", "GSK", "BIIB", "ALNY", "BGNE", "GMAB",
                                           "ARGX", "MRNA", "BNTX") ~ "Health Care",
                            Company %in% c("V", "MA", "JPM", "BAC", "WFC", "C", "GS", "MS", "BLK", "AXP",
                                           "SCHW", "USB", "PNC", "BK", "MET", "PRU", "PGR", "CB", "MMC",
                                           "AIG", "AFL", "HDB", "HSBC", "TD", "RY", "BMO", "BNS", "BNS",
                                           "UBS", "SMFG", "MUFG", "IBN", "BBVA", "SAN", "ING", "AON", 
                                           "KKR", "BX", "APO", "EQIX", "ICE", "CME", "MSCI", "SPGI",
                                           "S&P", "CNI") ~  "Financial",
                            Company %in% c("GE", "HON", "UPS", "UNP", "RTX") ~ "Industrial"))


s <- stock_data |>
  mutate(Month = substr(Date, start = 6, stop = 7),
         Year = substr(Date, start = 1, stop = 4),
         Day = substr(Date, start = 9, stop = 10)) 


