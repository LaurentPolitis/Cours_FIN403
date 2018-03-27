# View(women)
# > women
# height weight
# 1      58    115
# 2      59    117
# 3      60    120
# 4      61    123
# 5      62    126
# 6      63    129
# 7      64    132
# 8      65    135
# 9      66    139
# 10     67    142
# 11     68    146
# 12     69    150
# 13     70    154
# 14     71    159
# 15     72    164
library(ggplot2)
?women
 ggplot(women) + geom_bar(stat="identity",aes(x = weight, y=height)) +coord_flip()
 
 # correction 
 
 ggplot(women) +geom_smooth(aes(x = weight, y=height),se=FALSE,method="lm",size=2) +  geom_point(aes(x = weight, y=height,group="woman",colour=abs(predict(lm(data=women,formula =  weight ~height))-women$weight)),alpha=0.8,size=4)+
   labs(y="Height (in)",x="Weight (lbs)",colour="Absolute error between\nmodelized (lm) weigth \nand observation weigth")+scale_color_gradient(low="yellow",high = "red")
 