
surveys<-read.csv("data/portal_data_joined.csv")

# 1
unique_taxa <- unique(surveys$taxon)
for (taxon in unique_taxa) {
  species_names <- surveys$species[which(surveys$taxon == taxon)]
  longest_species <- species_names[which.max(nchar(species_names))]
  cat("Taxon:", taxon, "- Longest Species Name:", longest_species, "\n")
}

# 2

library(tidyverse)

mloa <- read_csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

columns_to_analyze <- c("windDir", "windSpeed_m_s", "baro_hPa", "temp_C_2m", 
                        "temp_C_10m", "temp_C_towertop", "rel_humid", "precip_intens_mm_hr")

max_values <- map(columns_to_analyze, ~ max(mloa[[.x]], na.rm = TRUE))

names(max_values) <- columns_to_analyze
print(max_values)


# 3

C_to_F <- function(temp_C) {
  temp_F <- temp_C * 1.8 + 32
  return(temp_F)
}

mloa <- mloa %>%
  mutate(
    temp_F_2m = map_dbl(temp_C_2m, C_to_F),
    temp_F_10m = map_dbl(temp_C_10m, C_to_F),
    temp_F_towertop = map_dbl(temp_C_towertop, C_to_F)
  )

head(mloa)

surveys$genus_species <- lapply(1:nrow(surveys), function(i) {
  paste(surveys$genus[i], surveys$species[i], sep = " ")
})

