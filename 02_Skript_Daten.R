##------------------------------------------------------------
## R Crashkurs Demo
## Date: November 2025
## Author: Marie Jakob <marie.jakob@psychologie.uni-freiburg.de>
## ------------------------------------------------------------

# Panes erklären

# Packages:
library(tidyr)
library(readr)
# install.packages("readr")

# Read Data
# Vor dem Einlesen: Daten angucken und zeigen
# Pfeil erklären: einlesen und in Objekt "data_raw" speichern
data_raw <- read_csv("data/data_BA_with_noise.csv")
# Was für eine Art von Pfad


#### Basic Befehle für Daten ####

View(data_raw) # Viele Infos schon hier
# look at data
# -> Langsam Variablen durchgehen
# Auf komische Werte hinweisen


# Langsam basic Befehle durchgehen!
head(data_raw)
tail(data_raw)
nrow(data_raw)
ncol(data_raw)
names(data_raw)
dim(data_raw)

# Dollar Notation erklären -> Spalten in dataframe bzw. Elemente in Liste
unique(data_raw$block)
unique(data_raw$vp)
length(unique(data_raw$vp))
summary(data_raw$rt)
unique(data_raw$response)

which(data_raw$rt < 0.1)

#### Pre-Processing ####

# Ziel: Datensatz mit dem wir einen t-Test über mittlere Reaktionszeiten für semantisch
# stark und schwach relatierte Trials rechnen können

# unnötige Zeile löschen
data_raw$`NA` <- NULL

# Relevante Trials auswählen
# -> Übungs- und Warmup-Trials ausschließen
# -> Subsetting mit []
# nur Bedingung zeigen
data_prep <- data_raw[data_raw$type == "test", ]
# Erklären was Komma bedeutet
# Ohne Komma durchführen

nrow(data_prep)
nrow(data_raw)
# -> weniger Trials


names(data_prep)

names(data_prep)[names(data_prep) == "vp"] <- "id"

# Antworten ausschließen, wo Vpn nicht rechtzeitig geklickt haben
unique(data_prep$response)
# -1 ausschließen
data_prep <- data_prep[data_prep$response != -1, ]

# Wie viele Versuchspersonen betrifft das? 
table(data_prep$id)
# 58 -> ausschließen
exclude <- c(58)
# -> Genauen Ausschluss machen wir später

#### Neue Variablen erstellen ####
# Wir interessieren uns für semantische Beziehungen (stark vs. schwach)
# -> Variable, die das kodiert
# Variable rel kodiert vier Arten der Beziehung (gekreuzt mit evaluativ)
# syn + ant -> semantisch stark
# eval + un -> semantishc schwach
data_prep$sem_rel <- ifelse(data_prep$rel == "syn" | data_prep$rel == "ant",
                            "strong", "weak")


# Wir brauchen _korrekte_ Reaktionszeiten
# -> Neue Variable, die das kodiert
data_prep$correct <- ifelse((data_prep$eva == "neg" & data_prep$response == "negativ") | 
                                data_prep$eva == "pos" & data_prep$response == "positiv",
                            1, 0)

mean(data_prep$correct)


# Versuchspersonen ausschließen, die unaufmerksam waren
# -> Wir brauchen die accuracy pro Person
# -> aggregate
# ausführlich erklären!
correct_subj <- aggregate(data_prep$correct ~ data_prep$id, FUN = "mean")

boxplot(correct_subj$`data_prep$correct`)
# Eine Person, die sehr unaufmerksam war --> sehr viele Fehler

exclude <- c(exclude,
             correct_subj$`data_prep$id`[correct_subj$`data_prep$correct` < 0.6])

# %in% erklären!
data_prep <- data_prep[! data_prep$id %in% exclude, ]
# Wichtig!!!!! In der Praxis würden wir nicht so einfache Ausreißerkriterien verwenden !!!!!


# Nur korrekte Trials auswählen
data_correct <- data_prep[data_prep$correct == 1, ]

# In der Praxis: Auch RT-Ausreißer ausschließen! 

min(data_correct$rt)
hist(data_correct$rt)

# Gut dafür: individuelles Ausreißer-Kriterium (z.B. Boxplot-Kriterium)
# Jetzt: unter 100 ms

data_correct <- data_correct[data_correct$rt > 0.1, ]

#### Aggregation #### 

# Analyse: t-Test über _mittlere_ RTs
# -> Aggregation
names(data_correct)
? aggregate
data_agg <- aggregate(rt ~ id * sem_rel, data = data_correct, FUN = mean)

# RT umbenennen in mean RT
names(data_agg)[names(data_agg) == "rt"] <- "mean_rt"


#### Inferenzstatistische Analyse ####

mean(data_agg$mean_rt[data_agg$sem_rel == "strong"])
mean(data_agg$mean_rt[data_agg$sem_rel == "weak"])

?t.test


t_test_sem <- t.test(mean_rt ~ sem_rel, data = data_agg, paired = TRUE)

# Ganzes Skript nochmal durchlaufen lassen -> sollte immer durchlaufen 
# -> macht Ergebnisse reproduzierbar! 


# Andere Möglichkeit im Wide Format zeigen
# Auf die Folien springen
View(data_agg)
# -> Pro Beobachtung / Trial eine Zeile
data_agg_wide <- pivot_wider(data_agg, names_from = sem_rel, values_from = mean_rt)

t_test_sem_wide <- t.test(data_agg_wide$strong, data_agg_wide$weak, paired = TRUE)


t_test_sem_wide
t_test_sem