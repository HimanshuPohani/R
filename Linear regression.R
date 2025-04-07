sales <- data.frame(
  Budget = c(1,2,3,4,5),
  Sales = c(4,5,7,8,11)
)
a <- lm(Sales~ Budget, data = sales)
summary(a)
new <- data.frame(Budget = 6)
pred <- predict(model,new)
print(pred)
