pacman::p_load(tidyverse,dplyr,ggpubr)
library(comorbidity)

df <- read_csv("./final_afa/before_afa_charlson.csv")
charlson <- comorbidity(x = df, id = "ENROLID", code = "DX_Code", map = "charlson_icd9_quan", assign0 = FALSE)
elixhauser <- comorbidity(x = df, id = "ENROLID", code = "DX_Code", map = "elixhauser_icd9_quan", assign0 = FALSE)
write.csv(elixhauser, "./elixhauser.csv", row.names=FALSE)
write.csv(charlson, "./charlson.csv", row.names=FALSE)