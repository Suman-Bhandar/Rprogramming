pressure<-read_excel(file.choose()) #upload the data
View(pressure)
lmTemp<-lm(Pressure~Temperature,data = pressure) #craeting the Lm Model
plot(pressure, pch = 16, col = "blue") #Plot the results
?pch
abline(lmTemp) #Add a regression Line
summary(lmTemp)
plot(lmTemp$residuals,pch = 16,col = "red")
