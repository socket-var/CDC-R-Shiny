library(usmap)
library(ggplot2)

states_df <- read.csv("./FluViewPhase2Data/StateDataforMap_2018-19week6.csv")

colnames(states_df)[1] = "state"

states_df$ACTIVITY.LEVEL = as.numeric(gsub('Level ', '', states_df$ACTIVITY.LEVEL))

states_df

plot_usmap(data = states_df, values = "ACTIVITY.LEVEL", lines = "black", regions = c("county")) +
  ggtitle("2018-19 Influenza Season Week 7 ending Feb 16, 2019") +
  scale_fill_continuous(
    name = "ILI Activity Level",
    type="gradient",
    low = "green", high = "red",
    breaks = seq(1, 10),
    labels = c(rep("Minimal", 3), rep("Low", 2), rep("Moderate", 2), rep("High", 3)),
    na.value = "transparent"
  ) +
  guides(colour = "colorbar") +
  theme(legend.position = "right", legend.key.height = unit(2, "cm"), plot.title = element_text(hjust = 0.5))
  # TODO: override legend title


