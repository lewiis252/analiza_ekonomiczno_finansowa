bilans <- read.csv("Bilans.csv", row.names = 1)
rzis <- read.csv("RZiS.csv", row.names = 1)
rpp <- read.csv("RPP.csv", row.names = 1)

# struktura
struktura <- bilans

f <- function(column) {
    column <- column / struktura$Aktywa.razem
}
# zastosuj obliczenie proporcji na każdej kolumnie
struktura <- sapply(struktura, f)

dynamika <- bilans
# dynamika 2020/2019
dynamika[nrow(struktura) + 1, ] <- as.vector(dynamika[3, ] / dynamika[2, ])
# dynamika 2021/2020
dynamika[nrow(dynamika) + 1, ] <- as.vector(dynamika[4, ] / dynamika[3, ])

rownames(dynamika) <- c(rownames(bilans), '2020/2019','2021/2020')
