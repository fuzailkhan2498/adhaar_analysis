b<- read.csv("adhaar_district.csv")
names(b) <- c("DISTRICT","ADHAAR_GENERATED")
library(ggplot2)
p <-ggplot(data=b, aes(DISTRICT,ADHAAR_GENERATED))
View(b)
q <- p + geom_bar(stat = "identity",colour="blue",fill="aquamarine",width=0.9)+theme_minimal()
q
png(file = "district.png")