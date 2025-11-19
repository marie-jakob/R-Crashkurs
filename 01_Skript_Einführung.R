# Folie 9
# Bennenung von Objekten soll informativ sein und muss bestimmten Regeln folgen
  # Das erste Symbol muss ein Buchstabe sein
  # Zahlen (ab dem zweiten Symbol) sind erlaubt
  # Nur die Sonderzeichen . und _ (ab dem zweiten Symbol) sind erlaubt
  # Es sind keine Leerzeichen erlaubt
# Hier einige gängige Methoden zum benennen langer/zusämmenhängender Namen
  # camelCase (neue Wörter mit großem Anfangsbuchstaben)
  # PascalCase (wie camelCase nur ist hier auch der erste Buchstabe ein Großbuchstabe)
  # snake_case (Wörter getrennt mit _)
  # SCREAMING_SNAKE_CASE (Wie snake_case nur alles in Großbuchstaben)
  # kebab-case (Funktioniert leider nicht in R weil kein - im Namen benutzt werden darf)
  
object1 = 1 # mit = oder <- kann ich einen Wert einem Objekt zuweisen
object_1 <- 2
_object = 3   # klappt nicht 
object 1 = 4  # klappt nicht


#Folie 10
# Groß und Kleinschreibung beachten
x = 2
X = 3

# Reihenfolge beachten
1 + z  # klappt nicht, da z noch keinen Wert zugewiesen hat/ noch nicht definiert wurde
z = 2
1 + z  # jetzt klappt es 

x + 1 # Ausgabe wird nur in der Konsole angezeigt aber nicht im Environment gespeichert
print(x) # print() Funktion gibt das innerhalb der Printfunktion stehende Object in der Konsole aus 
x <- x+1 # Um ein Object zu ändern, braucht es eine Zuweisung
print(x)
rm(object1) # rm() für remove löscht ein Objekt 

# Folie 12 - Vektoren (atomare Vektoren)
# Ein Vektor ist die einfachste und grundlegendste Struktur in R
# Es gibt zwei Arten von Vektoren 
# Dies sind atormare Vektoren. Sie enthalten Elemente desselben Typs
the_answer = 42
the_question = "What is the answer?"
question_sensible = FALSE

# Mit der Funktion is.vector kann ich sehen ob ein Objekt ein Vektor (oder etwas anderes z.B. ein dataframe) ist. 
# Das ist nützlich da z.B. bestimmte Funktionen nur mit Vektoren rechnen können, andere wiederum nur mit datasets. 
is.vector(the_answer) 
is.vector(the_question)
is.vector(question_sensible)

# NULL ist kein Vektor
zero <- NULL
is.vector(zero) # is kein Vektor

# Folie 13 - Vektoren (Listen)
# Listen enthalten Elemente von möglicherweise unterschiedlichem Typ
list1 <- list(1, "a", FALSE)
is.vector(list(1, "a", FALSE)) # Gehören aber auch zu den Vektoren


# Folie 14 - Typen 
# Mit typeof() kann ich herausfinden welchen Objekttyp ich vor mir habe. 

typeof(the_answer)
typeof(the_question)
typeof(question_sensible)
# Integer kommen wir später noch dazu

# Das ist wichtig um zu wissen welche Operationen erlaubt sind
a <- "John"
b <- "John"
c <- 1
d <- 2
b + a # geht nicht
c + d # geht


# Folie 17 - Typ integer und double
x_1 = c(1, 2, 3, 4) 
x_2 = 1:4 # Erstellt einen Vektor mit allen Ganzzahlen zwischen 1 und 4
typeof(x_1) # type double
typeof(x_2) # type interger

# Folie 18 - Vektoren verbinden
neuer_vector <- c(c(1, 2), c(3, 4)) # um Vektoren zu verbinden, nutze c()
print(neuer_vector)

# Achtet hier auf die Feinheiten
list_a = list(list(1, 2), list(3, 4))
list_b = list(c(1, 2), c(3, 4)) # ist nicht dasselbe
list_a
list_b

# Wenn ich unterschiedliche Typen mit c() verbinde werden sie zum "geringstmöglichen" Typ vereinheitlich
vector_mixed_1 <- c(TRUE, 3, "covfefe") 
vector_mixed_1
typeof(vector_mixed_1) # Hier wird alles zum Typ character

# Folie 19
vector_mixed_2 <- c(FALSE, 5) # Hier wird alles zum Typ double
vector_mixed_2
typeof(vector_mixed_2)

# Folie 26 - Matrizen
# Eine größere Objectstrutkur sind Matrizen
mr_anderson_vector = c(1, 2, 3, 4) # das ist ein Vektor
mr_anderson = matrix(data = c(1:4), nrow = 2, ncol = 2, byrow = TRUE) # Das eine Matrize
mr_anderson

mr_anderson_false <- matrix(data = 1, nrow = 2, ncol = 3) # Vorsicht bei der Eignabe des data-Arguments
# Wenn man mit ?matrix nachsieht wie die Funktion matrix() eine Matritze erstellt, 
# sieht man dass wenn man ein die Werte, die man in einer Matrize haben will nicht als 
# Vektor einspeißt man mit der eingegebenen Zahl z.B. 2 die Spaltenanzahl festlegt
# die Argumente müssen nicht benannt sein e.g. es würde auch gehen matrix (c (1:4) ,2 , 2)
# machen Code aber of verständlicher

# Folie 30 - dataframes
?data.frame # zum Nachschauen, wie die Funktion aufgebaut ist. 

harry_potter <- data.frame(person = c("harry", "hermione", "ron", "seamus"), 
                           skill = c(80, 100, 70, 42))
# Ich lege hier zwei Spalten mit jeweils 1 Wert pro Zeile (4 Zeile) fest. 
# Ich habe der Spalte den namen "person" bzw. "skill" gegeben. 
# Ich könnte auch Zeilennamen vergeben 

harry_potter # Ausgabe funktinoiert auch ohne print()

# Folie 32 - Namen 
# Auch Werten in Vektoren kann ich Namen zuweisen. Das kann die Verständlichkeit erhöhen
age = c("Joe B" = 79,
        "Nancy" = 82,
        "Donald"= 76)
age

# Namen können auch im Nachhinein definiert werden
neo = list("MrAnderson", 28, TRUE) # Hier erstelle ich die Liste (geht auch mit Vektoren)
names(neo) = c("real_name", "age", "the_one") # mit der Funktion names() kann ich Namen definieren 
# Wenn man weniger Namen definiert als Werte vorliegen, wird ein NA als Name vergeben 
neo

# Folie 33 - Index (mit Zahlen)
test = c("a", "b", "c")
test[1] # R beginnt mit 1
test[c(1, 2)] # zeigt den ersten und zweiten Wert an. Vorsicht [1,2] funktioniert hier nicht. 
test[2] # Zeigt den zweiten Wert an
test[-1] # Alles außer dem ersten Wert wird angezeigt. Vorischt anders Verhalten in anderen Sprachen

# Folie 34 - Index (mit Namen)
age["Nancy"] # Wie erwähnt ist es manchmal leichter Werte mit zuvor zugewiesenen Namen wiederzufinden
age[c("Joe B", "Donald")]
age[c(TRUE, TRUE, FALSE)] # Logische Vektoren geben TRUE-Elemente zurück

# Folie 35
age[] # Nichts gibt alle Elemente zurück
age[0] #Null gibt einen Vektor mit length() = 0 zurück:
age["Joe B"] # Alter Wert für Joe B
age["Joe B"] = 80 # Wir können (neuen) Elementen auch neue Werte zuweisen:
age["Joe B"] # Neuer Wert für Joe B

# Folie 36 
# Für Listen können wir auch [] benutzen. Allerdings neigen sie dazu, sich merkwürdig zu verhalten
neo[1]
typeof(neo[1])
typeof(neo[[1]]) [1]
# []kann mehrere Elemente extrahieren. Wenn es auf eine Liste angewandt wird, gibt es immer eine Liste zurück
# [[]] kann nur genau ein Element extrahieren. Extrahiert einzelne Elemente aus Listen und behält den Typ bei 
# $  x$y ist eine Kurzform von x[[„y“]]
  

# Folie 39
# Bei Matrizen spezifizieren wir die Teilmenge explizit für jede Dimension
# Vor dem Komma stehen Zeilen, Nach dem Komma Spalten
mr_anderson # Praktischerweise wird das bei der Ausgabe angezeigt
mr_anderson[2, 2] # Wert Zeile 2 Spalte 2
mr_anderson[1,] # Werte Zeile 1
mr_anderson[,1] # Werte Spalte 1
mr_anderson[1] # Ganz Matrix

# Folie 40
# Data Frames verhalten sich wie Listen und  Matrizen:
# Spezifiziere einen einzelnen Vektor (mit [, [[ oder $), dann verhalten sie sich wie Listen
# Spezifiziere zwei Vektoren ([ , ]), dann verhalten sie sich wie Matrizen
str(harry_potter[1])
str(harry_potter[,1])
str(harry_potter$person) # Unser Favorite
harry_potter$skill # gibt Spalte "skill" aus
harry_potter[1,] # gibt Zeile 1 aus 

# Folie 41 - Aufgabe
matrix_absteigend_spalte <- matrix(c(15:1), 5, 3)
matrix_absteigend_zeile <- matrix(c(15:1), nrow = 5, ncol = 3, byrow = TRUE)

# Folie 45 - Funktion 
# Um eine Funktion aufzurufen, müssen wir Argumente übergeben.
# Die Funktion macht etwas mit diesen Argumenten.
# Am Ende gibt die Funktion etwas zurück.
# Mit ? kann ich sehen welche Argumente eine Funktion hat und wie ich diese "füllen" muss
?sum

# Folie 46
# Rückgabewerte werden (typischerweise) in der Console ausgegeben. 
# Um sie zu speichern, muss man den Rückgabewert einem Objekt zuweisen.
# Kopiere NIEMALS Werte manuell in R hin und her!
  
?t.test
test_results <-  t.test(1:4, c(1, 1, 0, 0))
print(test_results) # test_results enhält Gesamtausgabe des t-tests
print(test_results$statistic) # Um nur einen spezifischen Wert auszugeben z.B. t-Wert

# Folie 47
# Mit manchen Funktionen wollen wir eine Ausgabe von einem Wert erhalten:
x = 1:9
sum(x)
mean(x)
min(x)

# Folie 48 
# Aber vorsicht bei der Eingabe. Manche Funktionen brauchen bestimmte "Formate" der eingabe 
sum(1, 2, 3, 4, 5, 6, 7, 8, 9) # gibt 9 richtig aus
mean(c(1, 2, 3, 4, 5, 6, 7, 8, 9)) # gibt 1 "falsch" aus (R macht nichts falsch, die Argumentstruktur wurde einfach nicht beachtet)
?sum
?mean
mean(1:9) # Es muss so 
mean(c(1, 2, 3, 4, 5, 6, 7, 8, 9)) # oder als mit c() eingegeben werden
# Wieso hat es dann oben (Folie 47 Funktioniert). Na ja ihn ja bereits als (zusammenhängenden) Vektor in einem Objekt abgespeichert

# Folie 49 - Vektorisierung
# Manchmal wollen wir eine Funktion auf jedes Element einzeln anwenden.
x <- c(1,2,3,4)
x[1] = x[1] + 2 # Das könnte ich so machen, aber das ist umständlich
x[2] = x[2] + 2
x[3] = x[3] + 2

x <- x + 2 
# Oder ich kann mir auch die Vektorisierung zunutze machen.
# R ist für Vektorisierung gemacht.
# Es macht das Leben viel einfacher, aber man sollte sich dessen bewusst sein!
  
harry_potter$skill  <- harry_potter$skill + 100 # geht auch bei dataframe z.B. werden alle Skillwerte um 100 erhöht 

# Folie 50 
# Das Produkt von zwei Vektoren gibt keinen Skalar zurück 
c(2, 3) * c(2, 6)
# … es sei denn, man fragt konkret danach:
c(2, 3) %*% c(2, 6)

# Folie 51
# Recycling: Kürzere Vektoren werden recycled, um zu den langen zu passen 
# (so oft hintereinander geklebt, bis er so lang ist wie gewünscht):
1:3 * 2
1:3 * c(2, 2, 2) # genau dasselbe

# Achtung! Das kann komische Folgen haben. 
x = c(1, 2, 3) 
x[c(TRUE, FALSE)]

# Folie 52
# Die meisten relationalen Operatoren sind vektorisierte Funktionen (Argument: Vektor => Rückgabewert: Vektor)
c(1, 2, 3) == c(1, 2, 3)

# Das ist sehr praktisch beim subsetting:
x = rnorm(30) # 30 Zufallsvariablen aus einer Standardnormalverteilung
x[x<0] = 0    # bei 0 abgeschnitten (beachte recycling!)
# identical(x, y) # aber Achtung: dies ist ein sehr strenger Vergleich

# Folie 54 
obst_preise = data.frame(obstsorte = c("Äpfel", "Bananen", "Mangos", "Feigen"),
                         preis = c(2.23, 1.5, 4.86, 1.25))
obst_preise
einkauf =
  20 * obst_preise[[2]][which(obst_preise[[1]]=="Äpfel")] +
  7 * obst_preise[[2]][which(obst_preise[[1]]=="Bananen")] +
  13 * obst_preise$preis[which(obst_preise[[1]]=="Mangos")] + # alternativer Aufruf
  #mit demselben Effekt
  42 * obst_preise$preis[which(obst_preise[[1]]=="Feigen")]
einkauf
anzahl = c(20, 7, 13, 42)
sum(obst_preise[[2]] * anzahl) # alternativ die Vektorisierung nutzen


# Folie 57 - Beispiel Conditionals (if-Schleife)
set.seed(1)
x = rnorm(1)
x
if (x>0) {
  print(paste0("x ist größer als 0 und hat folgenden Wert: ", x))
} else if (x<0) {
  print(paste0("x ist kleiner als 0 und hat folgenden Wert: ", x))
} else {
  print("x ist gleich 0.")
}

# Folie 59 - Beispiel for-Schleife
x = sample(1:100, 100)
x
count = 0
for(i in 2:length(x)) {
  if(x[i] < x[i-1]) {
    count = count + 1
  }
}
count
# ohne Schleife:
sum(x[-1] < x[1:(length(x)-1)])







