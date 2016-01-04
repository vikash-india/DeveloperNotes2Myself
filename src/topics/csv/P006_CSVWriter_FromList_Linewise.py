import csv

FILENAME = 'data_output.csv'

# 1. List of List Data
dataList = [
    ["Name", "Debut", "Team"],
    ["Sachin Tendulkar", "1989", "India"],
    ["Rahul Dravid", "1996", "India"],
    ["Saurav Ganguly", "1996", "India"]
]

# 2. Open File
csvfile = open(FILENAME, 'wb')

# 3. Create CSV Writer Object
csvWriter = csv.writer(csvfile, delimiter='\t')

# 4. Write List Data to File
for row in dataList:
    # Write ONE row at a time using writerow method.
    csvWriter.writerow(row)

# 5. Write List Data to File
csvfile.close();

