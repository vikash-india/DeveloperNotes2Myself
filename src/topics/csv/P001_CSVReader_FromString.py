import csv

# Step 1: CSV String
csvString = "Name,Debut,Team\n" \
            "Sachin Tendulkar,1989,India\n" \
            "Rahul Dravid,1996,India\n" \
            "Saurav Ganguly,1996,India"

# Step 2: Convert CSV string to List
csvString = csvString.split('\n');

# Step 3: Initialise CSV Reader
csvReader = csv.reader(csvString)

# Step 4: Traverse CSV list row wise
for row in csvReader:
    print row