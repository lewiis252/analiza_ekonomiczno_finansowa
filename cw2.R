bilans <- read.csv("Bilans.csv", row.names = 1)
rzis <- read.csv("RZiS.csv", row.names = 1)
rpp <- read.csv("RPP.csv", row.names = 1)

# statyczne
# wskaźnik bieżacej płynności
bilans$Aktywa.obrotowe / bilans$Zobowiązania.krótkoterminowe

# wskaźnik szybkiej płynności
(bilans$Aktywa.obrotowe - bilans$Zapasy - bilans$Krótkoterminowe.rozliczenia.międzyokresowe) / bilans$Zobowiązania.krótkoterminowe

# wskaźnik płynności gotówkowej
bilans$Środki.pieniężne.oraz.inne.aktywa.finansowe / bilans$Zobowiązania.krótkoterminowe

# dynamiczne
# Wskaźnik wydajności gotówkowej sprzedaży
rpp$A..Przepływy.pieniężne.netto.z.działalności.operacyjnej / rzis$Przychody.netto.ze.sprzedaży.produktów..towarów.i.materiałów

# Wskaźnik wydajności gotówkowej zysku
rpp$A..Przepływy.pieniężne.netto.z.działalności.operacyjnej / rzis$Zysk..strata..z.działalności.operacyjnej..EBIT.

# Wskaźnik wydajności gotówkowej majątku
ma <- function(x, n = 2){filter(x, rep(1 / n, n), sides = 1)}
bilans$srednia_wart_majatku_ogolem <- ma(bilans$Aktywa.razem)

rpp$A..Przepływy.pieniężne.netto.z.działalności.operacyjnej / bilans$srednia_wart_majatku_ogolem

#  Wskaźnik ogólnej wystarczalności gotówki operacyjnej
rpp$A..Przepływy.pieniężne.netto.z.działalności.operacyjnej / (abs(rpp$X2..Nabycie.wartości.niematerialnych.oraz.rzeczowych.aktywów.trwałych) + abs(rpp$X4..Wydatki.na.aktywa.finansowe) + abs(rpp$X5..Inne.wydatki.inwestycyjne) + abs(rpp$X1..Dywidendy.i.inne.wypłaty.na.rzecz.właścicieli) + abs(rpp$X3..Odsetki))
