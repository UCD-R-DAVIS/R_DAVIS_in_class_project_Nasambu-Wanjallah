library(tidyverse)

surveys<-read.csv("data/portal_data_joined.csv")

str(surveys)

surveys_wide<-surveys %>% 
  filter(!is.na(hindfoot_length)) %>% 
  group_by(genus,plot_type) %>% 
  summarize(mean_hindfoot=mean(hindfoot_length)) %>% 
  pivot_wider(names_from = plot_type,values_from = mean_hindfoot) 

arrange(control)


# Quiz 2

surveys
str(surveys)

summary(surveys$weight)

surveys %>% 
  mutate(weight_cat=case_when(
    weight<=20.00~"small",
    weight>20.00 & weight<48.00~"medium",large>=48.00
    ))

