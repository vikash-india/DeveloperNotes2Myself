import csv

FILENAME= 'data_input.csv'

# Method 1: Read a CSV file using try-finally block
csvfile = open(FILENAME, 'rt')
try:
    csvReader = csv.reader(csvfile)
    for row in csvReader:
        print row
finally:
    csvfile.close()

# Method 2: Read a CSV file using with
with open(FILENAME, 'rb') as csvfile:
    csvReader = csv.reader(csvfile)
    for row in csvReader:
        print row
csvfile.close()
