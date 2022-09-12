## Save working directory as MAXWELL-ANSAH.R ####
setwd("~/my R_projects/Bootcamp Assessment")
## HEADER ####
## MAXWELL ANSAH
## E-MAIL: MANSAH21@YAHOO.COM
## BOOTCAMP ASSESSMENT
## 2022-08-12 ####
## QUESTIONS ####
## Question 2, < create a data frame with headings mymat, dog and cat>
mymat <- as.factor(c("female", "male"))
dog <- c(32, 28)
cat <- c(28, 42)
data.frame(mymat,dog,cat)
## Question 3, < make a good histogram describing the height in centimeters of domestic cats at the shoulder>
cat <- c(20.7,21.7,23.7,27.1,20.0,27.0,27.4,24.6,24.3,18.6,20.1,19.8,24.9,21.8,25.7,23.0,25.2,27.9,21.8,25.8,27.3,20.1,24.5,19.3,20.7,21.9,18.1,21.8,26.7,21.4,22.8,24.0,22.9,19.9,26.3,24.7,25.9,19.1,25.2,22.1)
hist(cat, main = "Height in centimeters of domestic cats at shoulder") # Frequency
## Question 4, < perform a Shapiro test to decide whether the cat data adhere to a Guassian distritribution >
shapiro.test(cat) # where cat: is the numeric data values of the height in centimeters of cats at shoulder
## From the statistical results obtained from the Shapiro test, it would be observed that the p-value is 0.1345 which is greater than 0.05, we can assume that the sample data comes from a population that is normally distributed.
## Question 5, < to examine the 'CO2' data frame>
data(CO2)
help(CO2)
head(CO2)
CO2[CO2$conc == 350, ] # Selects all the columns of the Data frame for the rows where conc is equivalent to 350
which(CO2$conc == 350)
my_selection <- which(CO2$conc == 350) # Assign selection to a new dataframe, my_selection
my_selection # check output
CO2[my_selection, ] # Print out new dataframe based on conc==350
my_select <- CO2[my_selection, ] # store selection in new dataframe
my_select # check output
## Create a boxplot showing uptake vs treatment variable
my_uptake <- my_select$uptake
my_uptake # check output of uptake variable
my_treatment <- as.factor(my_select$Treatment)
my_treatment # Check output of treatment options
boxplot(my_uptake ~ my_treatment, 
        main="Boxplot of Uptake vs Treatment variable for conc==350", 
        xlab="Uptake", ylab="Treatment", col="green", las=1)

## Question 6, < Given the set of data below
y <- c(1.36,-0.10,0.39,-0.05,-1.38,-0.41,-0.39,-0.06,1.10,0.76) # y input
x <- c(-0.16,-0.25,0.70,0.56,-0.69,-0.71,0.36,0.77,-0.11,0.88) # x input
df <- data.frame(y,x) # create a dataframe
df[ , ] # check dataframe
plot(df$y, df$x, main="Regression for y vs x", col=I("darkblue"), xlab = "Just an example label",
     ylab="My y axis label") # make a scatter plot
abline(lm(y ~ x, data = df),col="red",stat_regline_equation(label.x=0.3, label.y=0.4)) # create a regression line
## library(ggplot)
## library(ggpubr)
## Question 7, < Residual regression
model<- lm(y ~ x, data=df) # a simple regression model without any weight
model # model output
resid(model) # check residuals
summary(model)
## Interpretation of summary of regression model

## Question 9 < ("Perform 1-way Analysis of variance to evaluate the overall effect of insect spray type from insectsprays data frame")
data(InsectSprays)
head(InsectSprays)
help(InsectSprays)
my_data <- InsectSprays[ , ]
my_data
levels(my_data$spray)
