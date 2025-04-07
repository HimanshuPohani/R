#Based on house_prices.csv
library(readr)


house_prices <- read_csv("C:/Users/himan/OneDrive/Desktop/Himanshu/Btech/SEM 4/Fundamentals of Data Science/Lab/R/house_prices.csv.xls")


View(house_prices)

# EDA
summary(house_prices)
str(house_prices)


plot(house_prices$Area, house_prices$Price, main = "Area vs Price", xlab = "Area (sqft)", ylab = "Price")
plot(house_prices$Bedrooms, house_prices$Price, main = "Bedrooms vs Price", xlab = "Bedrooms", ylab = "Price")
plot(house_prices$Bathrooms, house_prices$Price, main = "Bathrooms vs Price", xlab = "Bathrooms", ylab = "Price")
plot(house_prices$Age, house_prices$Price, main = "Age vs Price", xlab = "Age of House (years)", ylab = "Price")


cor(house_prices)

#linear regression
lr <-lm(Price ~ Area + Bedrooms + Bathrooms + Age,data = house_prices)
summary(lr)

#Predict House Price
new <- data.frame(Area =5000, Bedrooms = 2, Bathrooms = 2, Age = 3)
pred_price <- predict(lr,newdata = new)
print(pred_price)

#Model Performance
actual <- house_prices$Price
pred <- predict(lr,newdata = house_prices)
rsme <- sqrt(mean((actual -pred)^2))
print(paste("RMSE: ", round(rsme,2)))
rsq <- summary(lr)$r.squared
print(paste("R-Squared:",round(rsq,5)))
