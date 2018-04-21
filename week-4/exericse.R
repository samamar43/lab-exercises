# Exercise 7: DPLYR practice with NBA data
# install.packages("dplyr")
library(dplyr)

# Read in the NBA team data of the 2016-2017 season from the data directory  
# into a variable called `team.data` using `read.csv`
team.data <- read.csv("data/teams.csv", stringsAsFactors = F )


# The data.frame team.data should now be accessible to you. 
# View it, and get some basic information about the number of rows/columns. 
# Note the "X" preceding some of the column titles as well as the "*" 
# following the names of teams that made it to the playoffs that year.
View(team.data)


# Add a column that gives the turnovers to steals ratio (TOV / STL) for each team
team.data <- mutate(team.data, Ratio =  TOV/STL)



# Sort the teams from lowest turnover/steal ratio to highest
team.data <- arrange(team.data, Ratio)

# Get the team that had the highest Total Rebounds (TRB) only with the columns 
# Team and TRB  *using one line of code*
most_rebounds <-filter(team.data, TRB == max(TRB)) %>% select(Team)

# Print only the name of the team that had the highest total rebounds
# (that also happens to be the greatest team of all time)
print(most_rebounds$Team)


## Let's change gears!

# Read in the Pokemon data from the data directory  
# into a variable called `pokemon` using `read.csv`. Remember to not read strings in as factors.

# First, View() the data set to see what info you have to work with 
pokemon <- read.csv("data/pokemon.csv", stringsAsFactors = F)
View(pokemon)

# Find all the Pokemon that are "Water" Type 1 (or your favorite)
# Save those rows into a variable called `water.pkm`
water.pkm <- pokemon %>% 
            filter(Type.1 == "Water")

# Group the pokemon by Type 2 and save into a descriptive variable.
type_type2 <- pokemon %>% group_by(Type.2)

# View your new variable -- did it affect anything?
View(type_type2)
#nope

# Use summarize() to figure out what the mean (average) speed is for 
# each different type in type 2 and what the maximum HP (health point) value is
# within each group.
hp_spd <-type_type2 %>%  summarize(avg_speed = mean(Speed), max_hp = max(HP))


# New pokemon are released in generations. Aggregate the data on generations
# using summarize() to look at the minimum and maximum attack and defense values
# across generations for Pokemon that are not "Legendary". 

pokemon_by_generation <- pokemon %>% group_by(Generation) %>% filter(Legendary == "False") %>% 
  summarize(min_atk = min(Attack), max_atk = max(Attack), min_def = min(Defense), max_def = max(Defense))
  
  
# Can you do it in one line?
#probably but I got no time
