# Description: Parse CSV Content From a File Column-wise

import csv

FILENAME = 'data_input.csv'

csvfile = open(FILENAME, "rb")
csvReader = csv.reader(csvfile)
rownum = 0
for row in csvReader:
    # Save header row.
    if rownum == 0:
        header = row
    else:
        columnNumber = 0
        for col in row:
            print '%-8s: %s' % (header[columnNumber], col.strip())
            columnNumber += 1

    rownum += 1

csvfile.close()
