#Sets the working directory
setwd("~/Regis/MSDS 696")

#reads the table into the dataframe
df <- read.csv("crx.data.txt", header=FALSE)

#steps to examine the dataframe
df
head(df)
tail(df)
summary(df)
str(df)

#labeled the missing values as NA
idx <- df == "?"
is.na(df) <- idx

library(mice) # load the library
library(VIM)  # load the library


#Visualizes the missing verses present data.
mice_plot <- aggr(df, col=c('navyblue','yellow'),
                  numbers=TRUE, sortVars=TRUE,
                  labels=names(df), cex.axis=.7,
                  gap=3, ylab=c("Missing data","Pattern"))  

#requested the number of complete cases
sum(complete.cases(df))
#653 of 690 cases are complete

#Move to new variable for more changes
df2 <- df


#removed the rows with NA, because percentage of the cases was very small
df2 <- na.omit(df2)


#Visualizes the missing verses present data.
mice_plot <- aggr(df2, col=c('navyblue','yellow'),
                  numbers=TRUE, sortVars=TRUE,
                  labels=names(df2), cex.axis=.7,
                  gap=3, ylab=c("Missing data","Pattern"))  #Visualizes the missing verses present data.


#looked closer at the values in df$v1
df2$V1
#only a and b found

#checked the structure of df2
str(df2)

#examined the 1st column
df2$V1

#examined the underlying numerics
as.numeric(df2$V1)

#Changed V1 to as.numeric
df2$V1 <- as.numeric(df2$V1)

#checked the structure of the column, the change was successful. 
str(df2$V1)
# NULL

#checked the structure of the dataframe, the change was successful.
str(df2)

#substracted 2 from the 3's and 2's to get 0's and 1's
df2$V1 <- df2[, 1] - 2

#looked at the results
df2$V1

#sets the field as factor
df2$V1 <- factor(df2$V1,
                  levels = c(1,0),
                  labels = c("Male", "Female"))  

#although I brought the numbers down to 0 and 1, the refactoring pushed it back up to 1 and 2.
as.numeric(df2$V1)


#Repeating the process, as appropriate, for all remaining factors

#looked closer at the values in df$V2
df2$V2
#only a and b found

#checked the structure of df2
str(df2)

#Changed V1 to as.numeric
df2$V2 <- as.numeric(as.character(df2$V2))

#checked the structure of the column, the change was successful. 
str(df2$V2)
summary(df2$V2)


#looked closer at the values in df$V2
df2$V2

#checked the structure of the dataframe, the change was successful.
str(df2)

#Example - round(.5) = 0, so adding .1 to each number to get normal rounding
round(.5 + .1)

# started new dataframe variable
df3 <- df2

#rounded - these appear to be ages
df3$V2 <- round(df3[,2] + .1)

#checked the entirety of V2.
df3$V2

#viewed the distribution of V2
hist(df3$V2)

#V2 minimum 14, max V2 77
summary(df3)

plot(df3$V2, log="y", type='h', lwd=1, lend=2)

#Further review demonstrates that Japan has various laws that do not clearly aid in defining the age of adulthood
#Adulthood there can be as early as 13 or as late as 21
CasesWithMinors <- df3[(df3[,2]<18),]

hist(CasesWithMinors$V2)

plot(CasesWithMinors$V2, log="y", type='h', lwd=1, lend=2)

#checked the structure of the dataframe, the change was successful.
str(df3)

#looks at the number of unique values in each column.
rapply(df3,function(x)length(unique(x)))

#examined the dataset
head(df3)
tail(df3)
summary(df3)
str(df3)

#examined the column V3
df3$V3

#multiplied it by 1000
df3$V3 <- (df3$V3 * 1000)

#examined the column again, the constant three decimal places looked conspicuously like thousands.
df3$V3

hist(df3$V3)

plot(df3$V3, log="y", type='h', lwd=1, lend=2)

#examined the column V4
df3$V4

#u=3, y=4, l=2
as.numeric(df3$V4)

#transferred to a  new variable
df4 <- df3

as.numeric(df4$V4)

#made the field as numeric
df4$V4 <- as.numeric(df4$V4)

#brought the lowest value to 0, and all others down by the same rate.
df4$V4 <- df4[, 4] - 2

#examined the column
df4$V4

#sets the column as factor
df4$V4 <- factor(df4$V4,
                 levels = c(0,1,2),
                 labels = c("l", "u","y")) 

#viewed its underlying numerics, factoring added 1 to each value
as.numeric(df4$V4)

# viewed overall structure of df4
str(df4)

#began with a new variable for the dataset
df5 <- df4

#examined the column V3
df5$V5

#g=3, p=4, gg=2
as.numeric(df5$V5)

#made the field as numeric
df5$V5 <- as.numeric(df5$V5)

#view the column as is
df5$V5

#brought the lowest value to 0, and all others down by the same rate.
df5$V5 <- df5[, 5] - 2

#examined the column
df5$V5

#sets the column as factor
df5$V5 <- factor(df5$V5,
                 levels = c(0,1,2),
                 labels = c("gg", "g","p")) 

#viewed its underlying numerics, factoring added 1 to each value
as.numeric(df5$V5)

## viewed the factor labels
df5$V5

# viewed overall structure of df5
str(df5)

#moved to a new variable
df6 <- df5

#examined the column V3
df6$V6

#  aa=2, c=3, cc=4, d=5, e=6, ff=7, i=8, j=9, k=10, m=11, q=12, r=13, w=14, x=15 
as.numeric(df6$V6)

#get lowest value
min(as.numeric(df6$V6))
#2

#get highest value
max(as.numeric(df6$V6))
#15

#made the field as numeric
df6$V6 <- as.numeric(df6$V6)

#view the column as is
df6$V6

#brought the lowest value to 0, and all others down by the same rate.
df6$V6 <- df6[, 6] - 2

#examined the column
df6$V6

#sets the column as factor
df6$V6 <- factor(df6$V6,
                 levels = c(0,1,2,3,4,5,6,7,8,9,10,11,12,13),
                 labels = c("aa","c","cc","d","e","ff","i","j","k","m","q","r","w","x")) 

#viewed its underlying numerics, factoring added 1 to each value
as.numeric(df6$V6)

## viewed the factor labels
df6$V6

# viewed overall structure of df5
str(df6)

# moved to a new variable
df7 <- df6

#examined the column V3
df7$V7

#  aa=2, c=3, cc=4, d=5, e=6, ff=7, i=8, j=9, k=10, m=11, q=12, r=13, w=14, x=15 
as.numeric(df7$V7)

#get lowest value
min(as.numeric(df7$V7))
#2

#get highest value
max(as.numeric(df7$V7))
#10

#made the field as numeric
df7$V7 <- as.numeric(df7$V7)

#view the column as is
df7$V7

#brought the lowest value to 0, and all others down by the same rate.
df7$V7 <- df7[, 7] - 2

#examined the column
df7$V7

#sets the column as factor
df7$V7 <- factor(df7$V7,
                 levels = c(0,1,2,3,4,5,6,7,8),
                 labels = c("bb","dd","ff","h","j","n","o","v","z")) 

#viewed its underlying numerics, factoring added 1 to each value
as.numeric(df7$V7)

## viewed the factor labels
df7$V7

# viewed overall structure of df5
str(df7)


df8 <-df7


#looked closer at the values in df$V2
df8$V8


#checked the structure of df8
str(df8)

#checked the structure of the column. 
str(df8$V8)


#looked closer at the values in df$V2
df8$V8

#checked the structure of the dataframe, the change was successful.
str(df8)

#Example - round(.5) = 0, so adding .1 to each number to get normal rounding
round(.5 + .1)

#rounded - these appear to be ages
df8$V8 <- round(df8[,8] + .1)

#checked the entirety of V2.
df8$V8

#viewed the distribution of V2
hist(df8$V8)

plot(df8$V8, log="y", type='h', lwd=1, lend=2)

#V2 minimum 14, max V2 77
summary(df8)
str(df8)

#moved to a new variable
df9 <- df8

#examined the column, it is already factored as true and false
df9$V9

#the true correlates to the 2 and the false correlates to the 1
as.numeric(df9$V9)

#examined the column, it is already factored as true and false
df9$V10

#the true correlates to the 2 and the false correlates to the 1
as.numeric(df9$V10)

#examined the column, minimum 0 max 67.
df9$V11


min(df9$V11)

mean(df9$V11)

max(df9$V11)


#examined the column, it is already factored as true and false
df9$V12

#the true correlates to the 2 and the false correlates to the 1
as.numeric(df9$V12)

#examined the column
df9$V13

#Viewed the underlying numbers
as.numeric(df9$V13)

#Checked to see the number of unique values in the column
rapply(df9,function(x)length(unique(x)))

#examined the Column, factor with a fake level
df9$V14

#moved to a new variable
df10 <- df9

#cannot use zipcode for calculations, rendering to character
df10$V14 <- as.character(df10$V14)

#examined the data, now it has quotes
df10$V14

#moved to another variable
df11 <- df10

#examined the column
df11$V15

#examined its structure
str(df11$V15)

#changed it from integer to numeric
df11$V15 <- as.numeric(df11$V15)

#examined the column again
df11$V15

#examined its structure again
str(df11$V15)

#moved to a new variable
df12 <- df11

#examined the column
df12$V16

#examined it as nummeric
as.numeric(df12$V16)

#made it numeric
df12$V16 <- as.numeric(df12$V16)

#examined the column after the change
df12$V16

#minused 1 to get to 1's and 0's
df12$V16 <- df12[, 16] - 1

#examined the column again after the second change
df12$V16


#sets the column as factor
df12$V16 <- factor(df12$V16,
                   levels = c(0,1),
                   labels = c("denied", "approved"))

#examined the column as a factor
df12$V16

#examined the head of the data
head(df12)

#moved to a new variable
df13 <- df12

#added column names
colnames(df13) <- c("Sex","Age","Debt","Marital Status","IsCustomer","EducationLevel","Ethnicity","YearsEmployed","PriorDefault","Employed","CreditScore","DriversLicense","Citizen ","ZipCode", "Income", "Approved")

#looked at the full dataset
df13
str(df13)


library(RColorBrewer)
library(dplyr)


Sex <- df13 %>% 
  group_by(Sex) %>% 
  summarise(n = n())
mutate(freq = n / sum(n))


Sex

cols<-brewer.pal(n=3,name="Set1")
cols_t1<-cols[Sex$Sex]
#plot
plot(Y~X,dat,col=cols_t1,pch=16)
plot(Sex$n, col=cols_t1, pch=16)        
legend("topright",legend=paste(rep(c("Male","Female"))))        





SexApproved <-df13 %>%
  group_by(Sex, Approved) %>%
  summarise (n = n()) %>%
  mutate(freq = n / sum(n))

SexApproved

cols<-brewer.pal(n=4,name="Set1")
cols_t1<-cols[SexApproved$Sex]
#plot
plot(Y~X,dat,col=cols_t1,pch=16)
plot(SexApproved$freq, col=cols_t1, pch=16)        
legend("topright",legend=paste(rep(c("Male Denied","Male Approved", "Female Denied", "Female Approved"))))




SexMaritalStatusApproved <- df13 %>%
  group_by(Sex, `Marital Status`,Approved) %>%
  summarise (n = n()) %>%
  mutate(freq = n / sum(n))

SexMaritalStatusApproved

cols<-brewer.pal(n=6,name="Set1")
cols_t1<-cols[SexMaritalStatusApproved$Sex]
#plot
plot(Y~X,dat,col=cols_t1,pch=16)
plot(SexMaritalStatusApproved$freq, col=cols_t1, pch=16)        
legend("topright", xpd = TRUE, legend=paste(rep(c("L Male Approved","U Male Denied", "U Male Approved", "Y Male Denied", "Y Male Approved", "L Female Approved", "U Female Denied", "U Female Approved", "Y Female Denied","Y Female Approved"))))



EthnicityApproved <- df13 %>%
  group_by(Ethnicity,Approved) %>%
  summarise (n = n()) %>%
  mutate(freq = n / sum(n))

EthnicityApproved



#revisited the credit score column, after researching Japanese credit score factoring
df13$CreditScore


#
head(model.matrix(  ~ ., data = df13))
library(caret)
df14 <- df13

df14

#This creates the train set
df14_train <- df14[1:457, ]
# This creates the test set
df14_test <- df14[458:653, ]

#this examines the structure of the dataframe
str(df14)

#This creates the train labels
df14_train_labels <- df14[1:457, 16]

#This creates the test labels
df14_test_labels <- df14[458:653, 16]

#Slpit out all non continuous variables to 1's and 0's for model matrix
dummies <- dummyVars(" ~ .", data = df14)
head(dummies)
head(predict(dummies, newdata = df14))
trsf <-data.frame(predict(dummies, newdata = df14))
trsf
str(trsf)

# This creates the function to normaliz continuous variables
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}


# This normalizes the continuous variables
df14_n <- as.data.frame(lapply(trsf[1:211], normalize))

# this moves to a new variable for the dataframe
df14_n2 <- df14_n
#df2_n2 <- df[,-10]  # By column number referencing:
#df14_n2
#df2_n3 <- subset(df2_n2, select = -c(ca..)) # delete By column Name:
#df2_n3
#df2_n3 <- subset(df2_n3, select = -c(thal..)) # delete By column Name:
#df2_n3

#This creates the train set
df14_n2_train <- df14_n2[1:457, ]
# This creates the test set
df14_n2_test <- df14_n2[458:653, ]

#this examines the structure of the dataframe
str(df14_n2)

#This creates the train labels
df14_n2_train_labels <- df14[1:457, 16]

#This creates the test labels
df14_n2_test_labels <- df14[458:653, 16]

#These comands load key libraries
library(class)
library(datasets)
library(gmodels)

#These odd line commands create the test predictions based on the classifier with the training set
#The even lined commands check the validity of the results

df_test_pred <- knn(train = df14_n2_train, test = df14_n2_test, cl = df14_n2_train_labels, k = 1) # 3,9,5,1
CrossTable (x = df14_n2_test_labels, y = df_test_pred, prop.chisq=FALSE)
df_test_pred <- knn(train = df14_n2_train, test = df14_n2_test, cl = df14_n2_train_labels, k = 3) # 3,9,5,1
CrossTable (x = df14_n2_test_labels, y = df_test_pred, prop.chisq=FALSE)
df_test_pred <- knn(train = df14_n2_train, test = df14_n2_test, cl = df14_n2_train_labels, k = 5) # 3,9,5,1
CrossTable (x = df14_n2_test_labels, y = df_test_pred, prop.chisq=FALSE)
df_test_pred <- knn(train = df14_n2_train, test = df14_n2_test, cl = df14_n2_train_labels, k = 7) # 3,9,5,1
CrossTable (x = df14_n2_test_labels, y = df_test_pred, prop.chisq=FALSE)
df_test_pred <- knn(train = df14_n2_train, test = df14_n2_test, cl = df14_n2_train_labels, k = 9) # 3,9,5,1
CrossTable (x = df14_n2_test_labels, y = df_test_pred, prop.chisq=FALSE)

#The best performing model whas the second with k = 3



library(caret)
library(randomForest)
library(ipred)
library(bst)
library(gbm)

df15 <- df14

str(df15)

df15 <- df15[,-14]

str(df15)

#This creates the train set
df15_train <- df15[1:457, ]
# This creates the test set
df15_test <- df15[458:653, ]

#bagging 
train_bag <- bagging(Approved ~ ., data=df15_train, coob=T) #trained on the bagging trainset  
train_bag   #display characteristics of training
prediction1 <- predict(train_bag, df15_test) #predictions obtained via testset
confusionMatrix(prediction1, df15_test$Approved, positive = "approved") # comparison of results


#End