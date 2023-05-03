library(readxl)
library(dplyr)

path = "C:/Users/Adam/OneDrive/Projekty/Programowanie_R/tablice_trwania_zycia_1990-2021.xls"

mortality_list <- list()
columns <- colnames(read_excel(path, sheet = '1990', skip = 3))
for (year in as.character(1990:2021)){
    mortality_list[[year]] <- read_excel(path, sheet = year, skip = 3)
    colnames(mortality_list[[year]]) <- columns}

str(mortality_list)

mortality_table <- bind_rows(mortality_list)


write.csv(mortality_table, file =  "C:/Users/Adam/OneDrive/Projekty/Programowanie_R/Polskie_tablice_trwania_zycia_1990_2021.csv", row.names = F)
