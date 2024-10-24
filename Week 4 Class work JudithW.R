
library("tidyverse")
surveys<-read.csv("data/portal_data_joined.csv")

str(surveys)

#Selecting columns- *Selecting a number of columns you need

Month_day_year<-select(surveys,month,day,year)

#Filtering by equals- *Selecting rows that need a criteria

filter(surveys,year==1981)
Year_1981<-filter(surveys,year==1981)

#Filtering by range
filter(surveys,year %in% c(1981:1983)) Does bucket matching

filter(surveys,year==c(1981,1982,1983)) Never do this, recycles the vector

#Filtering by multiple conditions
bigfoot_with_weight<-filter(surveys,hindfoot_length>40 & !is.na(weight))

#Multi filtering
Small_animals<-filter(surveys,weight<5)
small_animal_ids<-select(small_animals,record_id,plot_id,species_id)

small_animal_ids<-select(filter(surveys,weight<5),record_id,plot_id,species_id)

#Using a pipe
small_animal_ids<-filter(surveys,weight<5) %>% select(record_id,plot_id,species_id)




#Part b
library(tidyverse)
surveys<-read.csv("data/portal_data_joined.csv")

#Addding a column
surveys<-surveys %>% 
  mutate(weight_kg=weight/1000)

str(surveys)
#Creating multiple columns

surveys<-surveys %>% 
  mutate(weight_kg=weight/1000,
weight_kg2=weight_kg*2)


surveys<-surveys %>% 
  filter(!is.na(weight)) %>% 
  mutate(weight_kg=weight/1000,
         weight_kg2=weight_kg*2)

str(surveys)
head(surveys)

#Challenge 1
surveys_challenge<-surveys %>% 
  filter(year<1995) %>% 
  select(year,sex,weight)

#Challenge 2
surveys_hindfoot_half<-surveys %>% 
  filter(!is.na(hindfoot_half) %>% 
           filter(hindfoot_length<30) %>% 
           select(hindfoot_half=hindfoot_length/2) %>%
           select(species_id),hindfoot_half)

surveys_hindfoot_half<-surveys %>% 
  filter(!is.na(hindfoot_half) %>% 
           filter(hindfoot_length<30) %>% 
           mutate(hindfoot_half=hindfoot_length/2) %>%
           select(species_id),hindfoot_half)

         #Group by and summarize
surveys2<-surveys %>% 
  group_by(sex) %>% 
  mutate(mean_weight=mean(weight))
str(surveys2)

surveys3<-surveys %>% 
  group_by(sex) %>% 
  summarize(mean_weight=mean(weight))
str(surveys3)


surveys3<-surveys %>% 
  group_by(sex,species_id) %>% 
  summarize(mean_weight=mean(weight))
str(surveys3)

#Arrange function ()
surveys3<-surveys %>% 
  group_by(sex,species_id) %>% 
  summarize(mean_weight=mean(weight)) %>% 
  arrange(-mean_weight)
  str(surveys3)
  
  
  #Multiple columns
  surveys3<-surveys %>% 
    group_by(sex,species_id) %>% 
    summarize(mean_weight=mean(weight),
              mean_weight=mean(weight)) %>% 
    arrange(-mean_weight)

  #Challenge
  
  Surveys_challenge3<-surveys %>% 
    group_by(year) %>% 
    summarize(max_weight_g=max(weight)) %>% 
    mutate(max_weight_kg=max_weight_g/1000) %>% 
    arrange()
 
  Surveys %>% 
    group_by(sex) %>% 
    summarize(max_weight_g)=max(weight)) %>% 
    mutate(max_weight_kg=max_weight_g/1000) %>% 
    count()
