surveys<-read.csv("data/portal_data_joined.csv")
str(surveys)  

?str
surveys
nrow(surveys)
ncol(surveys)

#path
getwd()

dim(surveys)
#data frame 
bunch of vectors put together

summary(surveys)
summary.data.frame(surveys)

#surveys has 34786 rows and 13 columns
#first 5 rows
surveys[1,5]

head(surveys,1)
surveys[1,]
surveys[,1]

surveys[1] same as
surveys["record_id"]
dim(surveys[c("records_id", "year","day")])
    
#function-()
#dataframe or object[]

head(surveys) #is the same as surveys[1:6,]
surveys[1:5]

tail(surveys)

head(surveys["genus"])  #keep object the same
head(surveys[["genus"]])
head(surveys["genus,species"])

head(surveys["genus",]) #requested for rows


surveys$hindfoot_length
class(surveys$hindfoot_length)

surveys$plot_id #$only works for columns only ( it is a column operator, data framed must have names)

class(surveys$plot_id)


library(tidyverse)
install.packages("tidyverse")
library(tidyverse)

t_surveys<-read_csv("data/portal_data_joined.csv")
class(t_surveys)
t_surveys
