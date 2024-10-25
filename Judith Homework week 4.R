library(tidyverse)

#1
surveys<-read.csv("data/portal_data_joined.csv")


#2
surveys %>% 
  filter(weight>30 & weight<60)
head(surveys)

#3
biggest_critter<-surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(species_id,sex) %>% 
  summarize(max_weight=max(weight))

biggest_critter%in% arrange(max_weight)

biggest_critter%in% arrange(-max_weight)

biggest_critter %>% arrange(max_weight)
biggest_critter %>% arrange(-max_weight)


#4
surveys %>% 
  group_by(species_id) %>% 
  tally() %>% 
arrange()


surveys %>% 
  group_by(plot_id) %>% 
  tally() %>% 
  arrange()

#5
surveys_avg_weight<-surveys %>% filter(!is.na(weight)) %>% 
  mutate(avg_weight=mean(weight)) %>% 
  select(species_id,sex,weight,avg_weight)

#6
surveys
-avg_weight%>% 
  group_by(species_id,sex) %>% 
  mutate(above_average=weight>avg_weight)
filter(weight=>above average)
