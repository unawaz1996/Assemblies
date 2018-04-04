#install.packages("cowplot")
library(ggplot2)
library(scales)
library(gridExtra)

#setting colours 

my_colors <- c("#0570b0", "#74a9cf", "#bdc9e1", "#cb181d")

#name of the Assemblies

my_species <- c('Assembly 1', 'Assembly 1', 'Assembly 1', 'Assembly 1', 'Assembly 2', 'Assembly 2', 'Assembly 2', 'Assembly 2', 
                'Assembly 3', 'Assembly 3', 'Assembly 3', 'Assembly 3', 'Assembly 4', 'Assembly 4', 'Assembly 4', 'Assembly 4')
my_species <- factor(my_species)
my_species <- factor(my_species,levels(my_species)[c(length(levels(my_species)):1)]) 
my_percentage_eukaryotic <- c(36.3, 63.4, 0.0, 0.3, 40.9, 58.7, 0.0, 0.4, 33.0, 66.7, 0.3, -0.0, 49.8, 49.5, 0.3, 0.4)
my_values_eurkaryotic <- c(100, 202, 1, 0,  110, 192, 0, -1,  124, 178, 0, -1,  151, 150, 1, -1) # number of BUSCO. All missing will have a - sign

labsize = 1
if (length(levels(my_species)) > 10){
  labsize = 0.66
}
category <- c(rep(c("S","D","F","M"),c(1)))
category <-factor(category)
category = factor(category,levels(category)[c(4,1,2,3)])


my_values_metazoa <- c(364, 606, 4, -4, 403, 565, 4, -6, 452, 515, 3, -8, 525, 440, 6, -7)

df_met = data.frame(my_species,my_values_metazoa,category)
metazoa_bar_graph <- ggplot() +  geom_bar(aes(y = my_values_metazoa, x = my_species, fill = category), data = df, stat="identity", width = 0.65) + 
  scale_x_discrete(limits = rev(levels(my_species))) +
  theme_gray(base_size = 2) +
  scale_fill_manual(values = my_colors) + xlab("") +  ylab("\n Metazoan BUSCOs found") + theme_bw()  + theme(legend.position= "none")


df = data.frame(my_species,my_percentage_eukaryotic,my_values_eurkaryotic,category)
eukaryotic_bar_graph <- ggplot() +  geom_bar(aes(y = my_values_eurkaryotic, x = my_species, fill = category), data = df, stat="identity", width = 0.65) + 
  scale_x_discrete(limits = rev(levels(my_species))) +
  theme_gray(base_size = 2) +
  scale_fill_manual(values = my_colors,labels =c(" Complete (C) and single-copy (S)  ",
                                                 " Complete (C) and duplicated (D)",
                                                 " Fragmented (F)  ",
                                                 " Missing (M)")) + xlab("") +  ylab("\n Eukaryotic BUSCOs found") + theme_bw() + theme(legend.position="top")



g_legend<-function(a.gplot){
  tmp <- ggplot_gtable(ggplot_build(a.gplot))
  leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
  legend <- tmp$grobs[[leg]]
  return(legend)}



mylegend<-g_legend(eukaryotic_bar_graph)

p3 <- grid.arrange(arrangeGrob(metazoa_bar_graph + theme(legend.position="none"),
                               eurkaryotic_bar_graph + theme(legend.position="none"),
                               nrow=1),
                   mylegend, nrow=2,heights=c(10, 1))

ggsave("busco_plots.png", plot = p3, device = NULL, path = NULL,
       scale = 1, width = NA, height = NA,
       dpi = 300, limitsize = TRUE, ...)


