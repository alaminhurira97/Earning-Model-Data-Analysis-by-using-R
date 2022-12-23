setwd("C:/HW#4")

# reading the dataset with a positive salary
wiw1<-readRDS("ACSwiw.Rda")

# creating dummy variables 
# HS=1 if SCHL= 16 or 17, ASC=1 if SCHL= 18,19 or 20, OB=1 if SCHL= 21, MB= 1 if SCHL=22,23 or 24, so reference category for these dummy variables is SCHL= 01-15. FEM=1 if SEX=2 and reference category for this dummy is SEX=1. YEARi= 1 if YEAR=2020 and the reference category is YEAR=2019.
wiw1$HS<-ifelse(wiw1$SCHL==16|wiw1$SCHL==17,1,0)
wiw1$ASC<-ifelse(wiw1$SCHL==18|wiw1$SCHL==19|wiw1$SCHL==20,1,0)
wiw1$OB<-ifelse(wiw1$SCHL==21,1,0)
wiw1$MB<-ifelse(wiw1$SCHL>=22,1,0)
wiw1$FEM<-ifelse(wiw1$SEX==2,1,0)
wiw1$Yrs<-ifelse(wiw1$YEARi==2020,1,0)

# LRM: wage= b0+b1HS+b2ASC+b3OB+b4MB+b5AGE+b6FEM+b7YEAR+epsilon
Model 1<-(lm(WAGP~HS+ASC+OB+MB+AGEP+FEM+Yrs,data=wiw1))
summary(Model 1)
Model 2<-(lm(log(WAGP)~HS+ASC+OB+MB+AGEP+FEM+Yrs,data=wiw1))
summary(Model 2)