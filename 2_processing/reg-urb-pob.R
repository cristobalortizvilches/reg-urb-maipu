

# set up ------------------------------------------------------------------

getwd()

library(sjmisc)
library(tidyverse)

pob_censo <- read.csv("1_input/original/Poblacion_por_manzana_segun_Censo_2017_Chile.csv",
                      encoding = "UTF-8")


# data wrangling ----------------------------------------------------------

pob_rm <- pob_censo %>% 
  filter(REGION == 13) %>% #filtrar sólo región metropolitana
  rename("FID" = "X.U.FEFF.FID") %>% #cambiar nombre del identificador individual
  group_by(MANZENT_I) %>% 
  mutate(DENSIDAD = sum(TOTAL_PERS))

frq(pob_rm$DENSIDAD)
