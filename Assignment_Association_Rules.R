
########## Groceries Data Set #########

install.packages("Matrix")
library(arules)

data() # get the file list within R
data("Groceries") # consider Grossary csv file 
summary(Groceries) # density of 0.02609146 
inspect(Groceries[1:10])
class(Groceries)
itemFrequencyPlot(Groceries,topN=20)

Groceries_rules<-apriori(Groceries,parameter = list(support = 0.01,confidence = 0.55,minlen=3))
inspect(sort(Groceries_rules,by="lift"))
#inspect(tail(sort(Groceries_rules,by="lift"))) # last 5 rules
#inspect(head(sort(Groceries_rules,by="lift"))) # first 5 rules

library(arulesViz)
plot(Groceries_rules,method = "scatterplot")
plot(Groceries_rules,method = "grouped")
plot(Groceries_rules,method = "graph")
#plot(Groceries_rules,method = "mosaic")


########## Book Data Set #########

book<-read.csv(file.choose()) # read csv file

book1<-as.matrix(book) # convert data frame into matrix

book2<-as(book1,"transactions") # convert into formal class transactions to use for AV algorithum

View(book2)

summary(book2) # density of 0.2202273

inspect(book2[1:10])

class(book2)

itemFrequencyPlot(book2,topN=20)

install.packages("Matrix")
library(arules)

book_rules<-apriori(book2,parameter = list(support = 0.05,confidence = 0.01,minlen=5))
inspect(sort(book_rules,by="lift"))

library(arulesViz)
plot(book_rules,method = "scatterplot")
plot(book_rules,method = "grouped")
plot(book_rules,method = "graph")


########## Movies Data Set #########

mymovies<-read.csv(file.choose()) # read csv file
View(mymovies)
movies<-mymovies[ , 1:5] # consider column 1 to 5 (not considered binary)
View(movies)
write.csv(movies,file = "movies.csv",row.names = F) # write desired csv file to working directory
getwd()

movies1<-read.transactions(file.choose(),format="basket") # read csv file for final class transaction
View(movies1)
summary(movies1)
inspect(movies1[1:10])
class(movies1)
itemFrequencyPlot(movies1,topN=20)

install.packages("Matrix")
library(arules)

movie_rules<-apriori(movies1,parameter = list(support = 0.15,confidence = 0.10,minlen=2))
inspect(sort(movie_rules,by="lift"))

library(arulesViz)
plot(movie_rules,method = "scatterplot")
plot(movie_rules,method = "grouped")
plot(movie_rules,method = "graph")


