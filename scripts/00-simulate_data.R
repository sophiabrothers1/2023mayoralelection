#### Preamble ####
# Purpose: Simulates a dataset for the 2023 Toronto Mayoral Election
# Author: Sophia Brothers
# Date: 23 September 2024
# Contact: sophia.brothers@mail.utoronto.ca
# License: MIT CHECK THIS
# Pre-requisites: tidyverse
# Any other information needed? No


#### Workspace setup ####
# [...UPDATE THIS...]
library(tidyverse)

#### Simulate data ####
# [...ADD CODE HERE...]
set.seed(123)

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

simulated_data <- expand_grid(
  ward = paste0("Ward ", 1:num_wards),
  subdivision = paste0("Subdivision ", 1:num_subdivisions_per_ward),
  candidate = candidates
) %>%
  
  mutate(votes = sample(10:500, size = n(), replace = TRUE))
