# Business Analytics exam - Clara Albert
# Exercise 1
path1 = file.path("~","Erasmus/Business Analytics/stackoverflow_data","data1.csv")
path2 = file.path("~","Erasmus/Business Analytics/stackoverflow_data","data2.csv")

# Exercise 2
data1 = read.csv(path1, stringsAsFactors = FALSE)
data2 = read.csv(path2, stringsAsFactors = FALSE)
dim(data1);dim(data2)

# Exercise 3
data =rbind(data1,data2)
dim(data)
nrow(data) == nrow(data1) + nrow(data2)

# Exercise 4
names(data)[names(data) == "Y"] = "Postcategory"
names(data)

# Exercise 5
data$Postcategory = replace(data$Postcategory,data$Postcategory == 'HQ', 'High-quality post')
data$Postcategory = replace(data$Postcategory,data$Postcategory == 'LQ_EDIT', 'Low-quality post')
data$Postcategory = replace(data$Postcategory,data$Postcategory == 'LQ_CLOSE', 'Low-quality post')
head(data$Postcategory, 3)

# Exercise 6
data$Pythonintags = grepl("<python>",data$Tags)
head(data, 3)

# Exercise 7
data$Body = gsub("(<[^>]*>)","",data$Body)

# Exercise 8
data$Body = gsub("\\s+"," ",data$Body)
head(data$Body, 1)

# Exercise 9
data$num_words = sapply(strsplit(data$Body, " "), length)
names(data)
head(data$num_words)

# Exercise 10
library(ggplot2)
ggplot(data, aes(x=Postcategory, y=num_words, col=Pythonintags)) + geom_boxplot(notch=TRUE, outlier.shape = NA) + labs(title="Number of words separated by post category",x="Post Category", y = "Number of words") +  scale_x_discrete(limits=c("High-quality post", "Low-quality post")) + scale_y_continuous(limits = c(0,300))
