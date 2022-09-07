
## boxplot across R&D, fake data
Yes <- data.frame(cbind(as.numeric(runif(54,min=0.3, max=0.98)), rep("Yes", 54)))
head(Yes)
No <- data.frame(cbind(as.numeric(runif(326,min=0.05, max=0.48)), rep("No", 326)))
RnD_dat_eff<-data.frame(rbind(Yes, No))


colnames(RnD_dat_eff)
str(RnD_dat_eff)

RnD_dat_eff_1<- transform(RnD_dat_eff, X1=as.numeric(X1))
str(RnD_dat_eff_1)
head(RnD_dat_eff_1)



png("./imgmehdi1/boxplot_eff_R&D_alaki.png", width = 960, height = 500, res = 100)
boxplot(RnD_dat_eff_1$X1 ~ RnD_dat_eff_1$X2,
        xlab = "Innovative activities (Yes = Conducted innovation)", ylab = "Efficiency", 
        col = "lightblue", outline = F)
title("Boxplot of efficiency across innovation activities")

text(1, 0.3, round(with(RnD_dat_eff_1, tapply(X1, X2, mean, na.rm = T))[1],
                   2))
text(2, 0.75, round(with(RnD_dat_eff_1, tapply(X1, X2, mean, na.rm = T))[2],
                    2))

dev.off()
