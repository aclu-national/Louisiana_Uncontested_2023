library(tidyr)
library(janitor)
library(stringr)

election_2023_data <- read.csv("unopposed.csv") %>%
  clean_names() %>%
  mutate_if(is.character, str_trim)

unopposed_elections <- election_2023_data %>% 
  filter(outcome == "Unopposed")

unopposed_senators <- unopposed_elections %>%
  filter(office_title == "State Senator")

unopposed_assembly <- unopposed_elections %>%
  filter(office_title == "State Representative")

unopposed_senators %>%
  tabyl(race,gender)

unopposed_senators %>%
  tabyl(party)

unopposed_assembly %>%
  tabyl(race,gender)

unopposed_assembly %>%
  tabyl(party)

election_2023_data %>%
  tabyl(race,gender, na.rm = TRUE)

unique(election_2023_data$office_title_description)
