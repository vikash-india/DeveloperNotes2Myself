# Description: Parse a List of String Into a List of Lists

import csv

# Step 1: CSV String
csvString = ["Name,Debut,Team",
             "Sachin Tendulkar,1989,India",
             "Rahul Dravid,1996,India",
             "Saurav Ganguly,1996,India"
             ]

# Step 2: Initialise CSV Reader
csvReader = csv.reader(csvString)

# Step 3: Traverse CSV List
for row in csvReader:
    print row
