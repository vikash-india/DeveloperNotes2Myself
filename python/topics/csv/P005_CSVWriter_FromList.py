# Description: Write CSV Content to a File From a List of Lists

import csv

FILENAME = 'data_output.csv'

# 1. List of List Data
dataList = [
    ["Name", "Debut", "Team"],
    ["Sachin Tendulkar", "1989", "India"],
    ["Rahul Dravid", "1996", "India"],
    ["Saurav Ganguly", "1996", "India"]
]

with open(FILENAME, 'wb') as csvfile:
    writer = csv.writer(csvfile, delimiter='\t', dialect='excel')
    # Write the whole list using  writerows method.
    writer.writerows(row for row in dataList)


csvfile.close()