a <- read.csv("adhaar_state.csv")
names(a) <- c("STATE","ADHAAR_GENERATED")
library(ggplot2)
p <-ggplot(a, aes(STATE,ADHAAR_GENERATED))
q <- p + geom_bar(stat = "identity",colour="blue",fill="aquamarine",width=0.9)+coord_flip()+theme_minimal()
q
png(file = "state.png")