library(tidyverse)

gapminder<-read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv)

gapminder<-read.csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")

gapminder %>% 
group_by(continent,year) %>% 
summarize(mean_lifeexpectancy=mean(lifeexpectancy)) %>% 
ggplot()+
geom_point(aes(x=year,y=mean_lifeexpectancy,color=continent))


#Quiz 2
ggplot(gapminder,aes(gdppercpita,y=lifeexpectancy))+
geom_point(aes(color=continent,size=pop))+
geom_smooth (method="lm",clolor="black,linetype="dashed")+
  theme_bw()


#Quiz 3
Countries<-c("Brazil", "China","El Salvador", "Niger", "United States")

gapminder %>% 
  filter(country %in% Countries) %>% 
  ggplot(aes(x=country,y=lifeexpectancy))+
  geom_boxplot()+
  geom_jitter(alpha=0.3,color="blue")+
  theme_minimal()+
  ggtitle("Lifeexpectancy of 5 countries")+
  theme(plot.title = element_text(hjust = 0.5))+
  xlab("contry")+ylab("lifeexpectancy")
