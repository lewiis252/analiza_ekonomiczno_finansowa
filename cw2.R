bilans <- read.csv("Bilans.csv", row.names = 1)
rzis <- read.csv("RZiS.csv", row.names = 1)
rpp <- read.csv("RPP.csv", row.names = 1)

# wskaźnik bieżacej płynności
bilans$Aktywa.obrotowe / bilans$Zobowiązania.krótkoterminowe

# wskaźnik szybkiej płynności
(bilans$Aktywa.obrotowe - bilans$Zapasy - bilans$Krótkoterminowe.rozliczenia.międzyokresowe) / bilans$Zobowiązania.krótkoterminowe

# wskaźnik płynności gotówkowej
bilans$Środki.pieniężne.oraz.inne.aktywa.finansowe / bilans$Zobowiązania.krótkoterminowe

# Wskaźnik wydajności gotówkowej sprzedaży

# Wskaźnik wydajności gotówkowej zysku

# Wskaźnik wydajności gotówkowej majątku

#  Wskaźnik ogólnej wystarczalności gotówki operacyjnej
