mydir <- "C:/Users/Fabia/ProgrammingFall2016Fabian/Final_Project/"
data_script <- read.csv(paste(mydir, "simpsons_script_lines.csv", sep=""))
head(data_script)

data_gender <- read.csv(paste(mydir, "simpsons_characters.csv", sep=""))
head(data_gender)


data_imdb <- read.csv(paste(mydir, "simpsons_episodes.csv", sep=""))


#### merging the datasets ####


# only observations with gender
data_gender2 <- subset(data_gender, gender == "m" | gender == "f") 
names(data_gender2)[1] <- "character_id"
head(data_gender2)

# getting rid of all the trash in the big data set
data_script2 <- data_script[, c("id", "number", "episode_id", "timestamp_in_ms", "character_id", "raw_character_text", "raw_location_text", "word_count")]
head(data_script2)

# merging by character_id
data_scgen <- merge(data_script2, data_gender2, by="character_id")
tail(data_scgen)
dim(data_scgen)

view(data_scgen, script_with_gender)
# merging imdb dataset 
#tail(data_imdb, n=100L)
#data_imdb <- ""

