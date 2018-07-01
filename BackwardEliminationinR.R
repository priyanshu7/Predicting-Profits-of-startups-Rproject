# Importing the dataset
dataset = read.csv('50_Startups.csv')

# categorical variable state

dataset$State = factor(dataset$State,
                         levels = c('Florida', 'California', 'New York'),
                         labels = c(3, 2, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting Multiple Linear Regression to training set
# All the columns can be writtten as dot (.)
regressor = lm(formula = Profit ~ R.D.Spend+Administration+Marketing.Spend + State,
               data = training_set)

#Predicing Results
y_pred = predict(regressor, newdata = test_set)

#regressor = lm(formula = Profit ~ R.D.Spend,
               #data = training_set)
#y_pred1 = predict(regressor, newdata = test_set)

#Implementing Backward Elimination
regressor = lm(formula = Profit ~ R.D.Spend+Administration+Marketing.Spend + State,
               data = dataset)
regressor = lm(formula = Profit ~ R.D.Spend+Administration+Marketing.Spend ,
               data = dataset)
summary(regressor)
regressor = lm(formula = Profit ~ R.D.Spend+Marketing.Spend ,
               data = dataset)
summary(regressor)
regressor = lm(formula = Profit ~ R.D.Spend,
               data = training_set)
y_pred1 = predict(regressor, newdata = test_set)
