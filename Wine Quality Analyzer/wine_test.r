wine <- read.csv("winequalityN.csv")

barplot(table(wine$quality))

wine$taste <- ifelse(wine$quality <6,'bad','good')
wine$taste[wine$quality == 6] <- 'normal'
wine$taste <- as.factor(wine$taste)
table(wine$taste)



set.seed(123)
samp <- sample(nrow(wine), 0.6*nrow(wine))
train <- wine[samp,]
test <- wine[-samp,]

train <- na.omit(train)


library(randomForest)
model <- randomForest(taste ~ . - quality, data = train)
model

pred <- predict(model,newdata = test)
table(pred,test$taste)

(722 + 275 + 819)/nrow(test)

