library(tidyverse)

library(lubridate)

mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

mloa_2<-mloa %>% 
  filter(!is.na(rel_humid) & !is.na(temp_C_2m) & !is.na(windSpeed_m_s))

mloa_2<-mloa %>% 
  mutate(datetime=ymd_h(year,month,day,hour24,min))

mloa_2<-mloa %>% 
  mutate(datetimelocal=with_tz(datetime,tzone="pacific/Honolulu"))

mean_hourly_temp<mloa_2 %>% 
  mutate(month=month(datetimelocal),hour=hour(datetimelocal)) %>% 
  group_by(month,hour) %>% 
  summarize(mean_temp=mean(temp_C_2m))

ggplot(mean_hourly_temp,aes(x=month,y=mean_temp,color=as.factor(hour)))+ geom_point(size=3)+
  labs(
    title = "mean_hourly temperature by month",
    x="month"
    y="mean temperature",
    color="hour of day (local)"
  )+
  theme_minimal()

