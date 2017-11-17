# Simple linear regression
dataset = read.csv('Salary_data.csv')

# Splitting data to training & test set
# Installing packages caTools
library(caTools)

split = sample.split(dataset$YearsExperience, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# We don't need to apply feature scaling manually as the linReg package takes care of this 

# Fitting linear regression to the training set 

# We're saying that salary is proportional to years experience
regressor = lm(formula = Salary ~ YearsExperience, data = training_set)

# Predicting test set results
x_hypothesis = predict(regressor, newdata = test_set)

# Visualising the training set results
library(ggplot2)
ggplot() +
    geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), 
               colour = 'red') +
    geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
              colour = 'blue') +
    ggtitle('Salary vs Experience (Training)') + 
    xlab('Years of experience') + ylab('Salary')

# Visualising the test set results 
ggplot() +
    geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
               colour = 'blue') +
    geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
              colour = 'red') +
    ggtitle('Salary vs experience (test)') + 
    xlab('Years of experience') + ylab('Salary')








