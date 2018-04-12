iris_df <- data.frame(iris)
print(iris_df)
# Select all values of data frame for Sepal.length
Sepal_length <- iris_df$Sepal.Length
# Select only rows of Virginica flowers
Virginica_flowers <- iris_df[ iris_df$Species == "virginica",]
# Select only the sepal legnth of the Virginica flowers
Virginica_sepal <- Virginica_flowers$Sepal.Length

# Select rows where Petal.Length > 4.0
large_petal <- iris_df[iris_df$Petal.Length > 4,]
# Add a column to the dataframe indicating whether Petal.Length > 4.0
iris_df$Large.Petal <- iris_df$Petal.Length > 4
# Find the species type of the flower that has the longest Sepal length
iris_df[iris_df$Sepal.Length == max(iris_df$Sepal.Length),]$Species
# Select rows where species type is 'setosa' and Sepal.Width > 3.0
setosa <- iris_df[iris_df$Species == "setosa" & iris_df$Sepal.Width > 3,]
print(setosa)
