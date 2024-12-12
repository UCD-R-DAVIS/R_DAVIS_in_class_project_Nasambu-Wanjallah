#1-Reading in the file

library(tidyverse)

url<-"https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv"

Tyler_lap_data<-read.csv(url)

#2 and 3-Filter out non-running activities

Filter_Normal_running<-Tyler_lap_data %>% 
  filter(activity == "Running") %>% 
  filter(pace<=10&pace>=5) %>% 
  filter(elapsed_time>1)

#4-Grouping into 3 time periods
Filter_Normal_running<-Filter_Normal_running %>% 
  mutate(date=as.Date(timestamp),
         time_period=case_when(
           date<as.Date("2024-01-01")~"Pre-2024"
           date<as.Date("2024-07-01")~"Jan-Jun 2024", TRUE~ "Post-July 2024"
         ))

#5-Make a scatter plot

Scatter_plot<-ggplot(Filter_Normal_running, aes(x=speed,y=SPM, color=time_period)) + geom_point(alpha=0.7, size=2) +
  labs(
    title="SPM vs Speed across Time periods",
    subtitle = "Analyzing Tyler's running cadence",
    x="Speed(mph) ",
    y="Strides Per Minute(SPM",
    color="Time Period"
  ) +
  theme_minimal()
+
  theme(legend.position = "top")

print(Scatter_plot)


#6 and 7-Make 5 Aesthetic change and add linear trendlines

Scatter_plot_with_aesthetics<-Scatter_plot+
  geom_smooth(method = "lm", se=FALSE, linetype="dashed")

print(Scatter_plot_with_aesthetic)


#8-Post intervention analysis

Pos-_intervention_data<-Filter_Normal_running %>% 
  filter(time_period=="post_july 2024") %>% 
  group_by(date) %>% 
  mutate(number_of_laps=rank(timestamp)) %>% 
  filter(number_of_laps<=3)

