# Mammals scatterplot
#1)Visulizing two variables
{
library(openintro)
data(mammals)
head(mammals)
library(ggplot2)
ggplot(mammals,aes(x=BodyWt,y=BrainWt))+geom_point()

# Baseball player scatterplot
data(mlbBat10)
head(mlbBat10)
ggplot(mlbBat10,aes(x=SLG,y=OBP))+geom_point()

#The relationship between two variables may not be linear. 
#In these cases we can sometimes see strange and even inscrutable patterns in a
#scatterplot of the data. Sometimes there really is no meaningful relationship 
#between the two variables. Other times, a careful transformation of one or both of
#the variables can reveal a clear relationship.
#Recall the bizarre pattern that you saw in the scatterplot between
#brain weight and body weight among mammals in a previous exercise. 
#Can we use transformations to clarify this relationship?
  
#ggplot2 provides several different mechanisms 
#for viewing transformed relationships. 
#The coord_trans() function transforms the coordinates of the plot.
#Alternatively, the scale_x_log10() and scale_y_log10() 
#functions perform a base-10 log transformation of each axis. 
#Note the differences in the appearance of the axes.

#The mammals dataset is available in your workspace.
#?coord_trans tRANSFORM CARTESIAN CORDINATE
# Scatterplot with coord_trans()
ggplot(data = mammals, aes(x = BodyWt, y = BrainWt)) +
  geom_point() + 
  coord_trans(x = "log10", y = "log10")
#End of visualizing two variables}
