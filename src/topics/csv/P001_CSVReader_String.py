import csv

# Step 1: CSV String
csvString = ["Name,Debut,Team",
             "Sachin Tendulkar,1989,India",
             "Rahul Dravid,1996,India",
             "Saurav Ganguly,1996,India"
             ]

# Alternative CSV String
# csvString = "Name,Debut,Team\nSachin Tendulkar,1989,India\nRahul Dravid,1996,India\nSaurav Ganguly,1996,India"
# csvString = csvString.split('\n');

# Step 2: Initialise CSV Reader
csvReader = csv.reader(csvString)

# Step 3: Traverse CSV List
for row in csvReader:
    print row

# Alternative Traverse CSV List
# print list(csvReader) # A list(rows) of list(columns)
