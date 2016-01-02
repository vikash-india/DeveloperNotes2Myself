import csv

filename='data.csv'
file = open(filename, 'rt')
try:
    reader = csv.reader(file)
    for row in reader:
        print row
finally:
    file.close()
