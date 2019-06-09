# Description: Use CSVWriter to write to a string instead of file

import io
import csv

# Use io.StringIO() for unicode string
output = io.BytesIO()

dataList = [
    ["Name", "Debut", "Team"],
    ["Sachin Tendulkar", "1989", "\N"],
    ["Rahul Dravid", "1996", "India"],
    ["Saurav Ganguly", "1996", "India"]
]

writer = csv.writer(output, delimiter='\t', dialect='excel')

writer.writerows(row for row in dataList)  # Write to a string

# writer.writerow(dataList) # Write to a list

print output.getvalue()
