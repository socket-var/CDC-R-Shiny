# TODO: descending order for medical condition
library("ggplot2")

medicalData <- read.csv("./FluViewPhase2Data/Medical_Conditions.csv", skip = 1, na.strings = c("xx", "N/A"))

library("reshape2")

new_df <- medicalData[medicalData["SEASON"] == "2018-19", ]


new_df <- new_df[, c("MEDICAL.CONDITION", "CHILDREN.PERCENT...", "ADULTS.PERCENT...", "FEMALES..15.44.YR..PERCENT...")]


new_df <- melt(new_df, id="MEDICAL.CONDITION")




new_df$MEDICAL.CONDITION

ggplot(
  data = new_df, 
  aes(MEDICAL.CONDITION, value, fill =  variable)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = paste(value, "%", sep="")), position=position_dodge(width=0.9), hjust=-0.25, size=3) +
  ylab("Percentage") +
  xlab("Medical Condition") +
  ylim(0, 100) +
  coord_flip() +
  ggtitle("Selected Underlying Medical Conditions: 2018-19 Season") +
  scale_fill_discrete(labels = c("Children", "Adults", "Females(15-44 yr)")) +
  theme(legend.title=element_blank())

