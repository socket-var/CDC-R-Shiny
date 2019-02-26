library("ggplot2")
library("dplyr")

files<-list.files("./FluViewPhase2Data/VisitData/",pattern="*csv", full.names=T)

n <- length(files)

# make a list of dataframes
data_list <- list()
for (i in 1:n) {
  data_list[[i]] <- read.csv(file = files[i], skip=1)
  
}

# get only necessary columns

for (i in 1:n) {
  data_list[[i]] <- as.data.frame(data_list[[i]][, c("WEEK", "X.UNWEIGHTED.ILI")])
}


final_data <- bind_rows(data_list, .id="KEY")

final_data$WEEK <- factor(final_data$WEEK, levels = c(40:53, 1:39))

final_data

ggplot() + 
  geom_line(aes(WEEK, X.UNWEIGHTED.ILI, colour=KEY, group=KEY), final_data, size=1.3) +
  
  expand_limits(y = 0) + 
  ggtitle("Percentage visits") +
  xlab("Week") +
  ylab("% of Visits for ILI") +
  scale_color_manual(labels=c("2017-18", "2016-17", "2015-16", "2014-15", "2011-12", "2009-10","2018-19")
                     , values=c("skyblue", "blue", "orange", "pink", "green", "black", "red")) +
  scale_x_discrete(breaks = c(seq(40,53,by=2), seq(1,39,by=2)) ) +
  geom_point(aes(WEEK, X.UNWEIGHTED.ILI, shape=2), final_data[314:332, ], size=2) +
  scale_shape_identity()
  



