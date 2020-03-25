#Introduction to Data wrangling
library(gapminder)
library(dplyr)
View(gapminder)
summary(gapminder)
gapminder %>% 
  filter(country=="United States")

# Filter for China in 2002 using multipke filter
gapminder %>% filter(country=="China",year==2002)

#using arrange verb
gapminder%>% arrange(gdpPercap)

gapminder%>% arrange(desc(gdpPercap))#using Desc order in arrange
#filtering then arranging
gapminder %>% 
  filter(year==2007) %>% arrange(desc(gdpPercap))



# Use mutate to change lifeExp to be in months
gapminder%>%mutate(lifeExp=lifeExp*12)

# Use mutate to create a new column called lifeExpMonths
gapminder%>%mutate(lifeExpMonths=lifeExp*12)


# Filter, mutate, and arrange the gapminder dataset
gapminder%>%filter(year==2007)%>%
  mutate(lifeExpMonths=12*lifeExp)%>%
  arrange(desc(lifeExpMonths))
