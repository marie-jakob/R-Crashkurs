##-------------------------------------------------------------
## 02. Plots - Solutions
## Cognitive Modeling Summer School Freiburg
## Date: August 2022
## Marie Jakob  <marie.jakob@psychologie.uni-freiburg.de>
## ------------------------------------------------------------

library(tidyr)

penguins <- read.csv("data/penguins_tidy.csv")


#------------------------------------------------------------------------------#
#### Balkendiagramm ####

# Gruppierter Barplot mit Anzahl pro Spezies

# Erstmal aggregieren
bar_plot_data <- table(penguins$species)

barplot(
  height = bar_plot_data,
  # Breite proportional zur Anzahl
  width = bar_plot_data,
  # u
  col = c("blue", "green", "red"),
  main = "Frequency of penguin species in sample",
  xlab = "Species",
  ylab = "Frequency",
  # horiz = T # -> stellt die Balken horizontal dar
)


#------------------------------------------------------------------------------#
#### Boxplots ####


cols <- c(rep("blue", 2), rep("green", 2), rep("red", 2))
boxplot(body_mass_g ~ sex + species, 
        data = penguins,
        col = cols,
        names = c("Adelie-f", "Adelie-m",
                  "Gentoo-f", "Gentoo-m",
                  "Chinstrap-f", "Chinstrap-m"))


#------------------------------------------------------------------------------#
#### Scatterplots ####



plot(body_mass_g ~ culmen_length_mm, 
     col = species, 
     data = penguins,
     main = "Gewicht ~ Schnabellänge",
     xlab = "Schnabellänge",
     ylab = "Gewicht",
     pch = 16
)





