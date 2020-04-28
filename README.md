# Team Mount Massive

### Objective
This project's goal is to work with big data in an AWS environment and further our Machine Learning and Predictive Modeling
toolkit, against a large scale dataset. 

### Collaborators
Alex Qaddourah, Marissa Fink, Vishal Narayanan, Abbie Amiotte, Neha Thakar

### Dataset
my_output_csv contains the entire dataset filtered for those with over 250 votes and no blank rows. 

### Design Document
https://www.lucidchart.com/publicSegments/view/26803019-e87d-47f8-a2c7-ca28b518e84c

### Recommendation System
The simple recommendation system is based off a weighted rating formula from IMDB, (v/(v+m) * R) + (m/(m+v) * C), where v = number of votes for the movie, m = minimum number of votes to be counted, R = average rating for the movie, and C = average rating over all movies. The purpose of this formula is to reduce potential biases based on number of votes. For example, a movie may have a very high average rating, but with only a few votes, it's difficult to differentiate how successful that movie is versus a potentially lower scoring film with ten times as many votes. After calculating the weighted average for each movie, the recommendation system will produce a the top 5 highest scoring films based on the weighted rating and three inputs from the user, genre of choice, type (i.e. movie, TV show, videogame, etc.), and age. 

The original recommendation system was first built exclusively in Python using a for loop and a UDF. 
https://github.com/MSBX5420/team-mount-massive/blob/master/Python%20Recommendation%20System.ipynb
For the weighted rating function, the m value was calculated as movies in the 10th percentile. 
While this system was effective and retrieved a Top 5 list without a user needing to alter the code (a user just has to call the recommend function with three inputs), the for loop is slow. 

The second recommendation system was built in PySpark using a UDF and spark.sql to view the Top 5 recommendations. https://github.com/MSBX5420/team-mount-massive/blob/master/PySpark_Recommendation_System%20(3).ipynb
In the weighed rating function, m was given an arbitrary 100 value (which effectively included every movie since the data had been cleaned to remove movies with less than 250 votes).
This system requires more data input from the user in the form of a SQL query, but still produces the desired results.

<!--- ### More Sections -->

<!--- ### More Sections -->

<!--- ### More Sections -->
