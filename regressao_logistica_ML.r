 #Clear existing data and graphics
 rm(list=ls())
 graphics.off()
 urlfile <- "https://raw.githubusercontent.com/edsonzmartinez/cursoR/main/lowbwt.csv"
 dados <- read.csv2(urlfile)
 head(dados)
 library(carot)
 library(pROC)
 # Visitas ao médico
 table(dados$FTV)
 dados$FTV2 <- ifelse(dados$FTV<3,dados$FTV,2)
 table(dados$FTV2)
 # Partos prematuros
 table(dados$PTL)
 dados$PTL2 <- ifelse(dados$PTL==0,0,1)
 table(dados$PTL2)
 # Logistic regression
 modelo <- factor(LOW) ~ AGE + LWT + factor(RACE) + factor(SMOKE) + factor(PTL2) + factor(HT) + factor(UI) + factor(FTV2) 
 lmodel <- glm(modelo,data=dados,family="binomial")
 summary(lmodel)
 # Predicted
 pred <- predict(lmodel)
 summary(pred)
 # Probs
 prob <- 1/(1+exp(-pred))
 summary(prob)
 # Validation
 spec <- c(train = .75, test = .25)
 g    <- sample(cut(seq(nrow(dados)),nrow(dados)*cumsum(c(0,spec)),labels = names(spec)))
 res  <- split(dados, g)
 lmodelt <- glm(modelo,data=res$train,family="binomial")
 summary(lmodelt)
 pred <- predict(lmodelt,newdata=res$test)
 pred_y <- as.numeric(pred>0)
 true_y <- as.numeric(res$test$LOW==1)
 # Confusion matrix
 true_pos  <- (true_y==1) & (pred_y==1)
 true_neg  <- (true_y==0) & (pred_y==0)
 false_pos <- (true_y==0) & (pred_y==1)
 false_neg <- (true_y==1) & (pred_y==0)
 conf_mat <- matrix(c(sum(true_pos),sum(false_pos),sum(false_neg),sum(true_neg)),2,2)
 colnames(conf_mat) <- c("Yhat = 1","Yhat = 0")
 rownames(conf_mat) <- c("Y = 1","Y = 0")
 conf_mat
 # Precision, recall, F1 score
 precision <- diag(conf_mat) / rowSums(conf_mat) 
 recall <- diag(conf_mat) / colSums(conf_mat) 
 F1 <- 2 * (precision * recall) / (precision + recall)
 # ROC curve
 roccurve <- roc(true_y,pred)
 plot(roccurve)
 cbind(roccurve$thresholds,roccurve$sensitivities,roccurve$specificities
 ###
 ### Cross-validation K-fold
 ###
 # Specify the cross-validation method
 ctrl <- trainControl(method = "cv", number = 5)
 # Fit a regression model and use k-fold CV to evaluate performance
 modelK <- train(modelo,data=dados,family="binomial", method = "glm", trControl = ctrl)
 # view summary of k-fold CV               
 print(modelK)
 modelK$resample
 ###
 # Leave one out cross validation (LOOCV)
 ###
 # defining training control
 # as Leave One Out Cross Validation
 ctrl <- trainControl(method = "LOOCV")
 # training the model by assigning sales column
 # as target variable and rest other column
 # as independent variable
 modelLOOCV <- train(modelo,data=dados,family="binomial", method = "glm", trControl = ctrl)
 # printing model performance metrics
 # along with other details
 print(modelLOOCV)
 modelLOOCV$resample
 

