library("ggplot2")
library("reshape2")

new_df <- read.csv("./FluViewPhase2Data/FluSurveillance_FluSurv-NET_Entire Network_Data.csv", skip = 2, na.strings = c("null"))

new_df <- head(new_df, -17)

new_df <- new_df[, c("MMWR.WEEK", "CUMULATIVE.RATE", "AGE.CATEGORY")]

new_df$AGE.CATEGORY <- factor(new_df$AGE.CATEGORY, levels = c("0-4 yr", "5-17 yr", "18-49 yr", "50-64 yr", "65+ yr"))

new_df$AGE.CATEGORY

new_df <- new_df[complete.cases(new_df), ]

new_df$CUMULATIVE.RATE = as.numeric(new_df$CUMULATIVE.RATE)

new_df$MMWR.WEEK <- factor(new_df$MMWR.WEEK, levels=unique(new_df$MMWR.WEEK))


ggplot(
  data = new_df, 
  aes(x = MMWR.WEEK, y = CUMULATIVE.RATE, colour = AGE.CATEGORY, group = AGE.CATEGORY)) +
  geom_point() +
  geom_line() +
  expand_limits(y = 0) + 
  ggtitle("Average Box Office Revenue by Year") +
  xlab("MMWR Week") +
  ylab("Rates per 100,000 population") +
  scale_y_continuous(breaks=seq(0,100, 10))
