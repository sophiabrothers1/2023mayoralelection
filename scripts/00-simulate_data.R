#### Preamble ####
# Purpose: Simulates a dataset for the 2023 Toronto Mayoral Election
# Author: Sophia Brothers
# Date: 23 September 2024
# Contact: sophia.brothers@mail.utoronto.ca
# License: MIT CHECK THIS
# Pre-requisites: tidyverse, dplyr, ggplot2
# Any other information needed? This simulation uses fictional data.

#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(123)

# set up the variables
num_wards <- 25
num_subdivisions_per_ward <- 99
candidates <- c("Abdulsalam Bahira",
                "Acquaye Emmanuel",
                "Acton Blake",
                "Ahmed Sharif",
                "Alam Asadul",
                "Allan Gru Jesse",
                "Aly Atef",
                "Apostolopoulos Dionysios",
                "Atkinson Darren",
                "Atkinson Jamie",
                "Bailão Ana",
                "Baking Jose",
                "Bankas Ben",
                "Beals Claudette",
                "Benway Glen",
                "Bonilla Eliazar",
                "Bradford Brad",
                "Brown Chloe",
                "Buffey Brian",
                "Caesar-Chavannes Celina",
                "Carrie Mason",
                "Chan Roland",
                "Charlton Matti",
                "Chevalier Romero Danny",
                "Chow Olivia",
                "Choy Logan",
                "Clarke Kevin",
                "Climenhaga Sarah",
                "Cohen Gordon",
                "Collins Paul",
                "D'Amico Frank",
                "D'Angelo Frank",
                "Davis Rob",
                "D'Cruze Phillip",
                "Deb Samson",
                "Desai Habiba",
                "Deville Cory",
                "Fenby Simryn",
                "Forrester Monica",
                "Furey Anthony",
                "Furnival Scott",
                "Gamk Isabella",
                "Gao Feng",
                "Gong Xiao Hua",
                "Goraya Adil",
                "Graff Brian",
                "Grosman Ari",
                "Guglielmin James",
                "Gulyas David",
                "Hall Thomas",
                "Handjis Peter",
                "He Heather",
                "Heaps Toby",
                "Hossain Monowar",
                "Hunter Mitzie",
                "Igodan Sheila",
                "Irmya Daniel",
                "Jaffery Syed",
                "Jensen Michael",
                "Johnston Patricia",
                "Khan Walayat",
                "Korovitsyn Serge",
                "Lamoureux Michael",
                "Langenfeld Kris",
                "Lee Rick",
                "LeLiever Mark",
                "Letonja John",
                "MacLeod Norman",
                "Mammoliti Giorgio",
                "Mann Steve",
                "Marshall Cleveland",
                "Matlow Josh",
                "Mohee Faizul",
                "Murphy Bob",
                "Nicula Michael",
                "Nowwarah Jamil",
                "Perruzza Anthony",
                "Ransome John",
                "Renée D!ONNE",
                "Reodica Willie",
                "Rubino Walter",
                "Saccoccia Chris",
                "Sanders Lyall",
                "Saunders Mark",
                "Schipano Rocco",
                "Shusterman Robert",
                "Singh Knia",
                "Singh Partap Dua",
                "Sivaneswaran Raksheni",
                "Sniedzins Erwin",
                "Srivastava Sandeep",
                "Straus Meir",
                "Tang Weizhen",
                "Toye Mitchell",
                "Tull Reginald",
                "Tunney Jeffery",
                "Vadivelu Kiri",
                "Weenen Jack",
                "Wei Yuanqian",
                "Williams Jody",
                "Winter John",
                "Yan Nathalie Xian Yi"
)
subdivisions <- paste0("Subdivision ", 1:99)

# expand the dataset so there are 99 subdivsions and all of the candidates in each ward
simulated_data <- expand_grid(
  ward = paste0("Ward ", 1:num_wards),
  subdivision = paste0("Subdivision ", 1:num_subdivisions_per_ward),
  candidate = candidates
) %>%
  
# randomly assign votes to different candidates in different subdivisions and wards
  mutate(votes = sample(0:20000, size = n(), replace = TRUE))


# tests

# test 1: 25 wards exist
unique_wards <- length(unique(simulated_data$ward))
expected_wards <- num_wards
stopifnot(unique_wards == expected_wards)
cat("Test 1 Passed\n")

# test 2: each ward has 99 subdivisions
ward_subdivision_counts <- simulated_data %>%
  group_by(ward) %>%
  summarise(subdivisions_count = n_distinct(subdivision))

stopifnot(all(ward_subdivision_counts$subdivisions_count == num_subdivisions_per_ward))
cat("Test 2 Passed\n")

# test 3: each ward/subdivision has all candidates
ward_subdivision_candidate_counts <- simulated_data %>%
  group_by(ward, subdivision) %>%
  summarise(candidates_count = n_distinct(candidate))

expected_candidates <- length(candidates)
stopifnot(all(ward_subdivision_candidate_counts$candidates_count == expected_candidates))
cat("Test 3 Passed\n")

# 4. test 4: randomized votes are within 10 and 500
min_votes <- min(simulated_data$votes)
max_votes <- max(simulated_data$votes)
stopifnot(min_votes >= 0 & max_votes <= 20000)
cat("Test 4 Passed\n")

# 5. test 5: expected # of rows in dataset
expected_rows <- num_wards * num_subdivisions_per_ward * length(candidates)
actual_rows <- nrow(simulated_data)
stopifnot(expected_rows == actual_rows)
cat("Test 5 Passed\n")
