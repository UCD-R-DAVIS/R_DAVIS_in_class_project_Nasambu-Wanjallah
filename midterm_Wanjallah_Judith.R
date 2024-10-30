library(tidyverse)

url<-"https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv"

lap<-read.csv(url)

str(lap)

running_laps<-lap %>% 
  filter(non-running activities) %>% 
  filter(total_elapsed_time>=60) %>% 
  filter(minutes_per_mile>10 & minutes_per_mile<5)



running_laps<-lap %>% 
  filter(non-running activities) %>% 
  filter(total_elapsed_time>=60) %>% 
  filter(minutes_per_mile>10 & minutes_per_mile<5) %>% 
  mutate(pace_cat=case_when(minutes_per_mile<6~"fast", minutes_per_mile<8~"medium", minutes_per_mile>8~"slow"),
form=case_when(year==2024~"new form", year<2024~"old form"))

running_laps %>% 
  group_by(pace,form) %>% 
  select(form, slow,medium,fast)