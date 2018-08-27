# Description: Create and Use a Custom Dialect While Writing CSV Content to a File

import csv

FILENAME = 'data_output.csv'

# 1. List of List Data
dataList = [
    ["Name", "Debut", "Team"],
    ["Sachin Tendulkar", "1989", "\N"],
    ["Rahul Dravid", "1996", "India"],
    ["Saurav Ganguly", "1996", "India"]
]

# 2. Open File
csvfile = open(FILENAME, 'wb')


# Create custom dialect
csv.register_dialect('mysql',
                     delimiter='\t',            # Default is comma(,). Field separator (one character).
                     doublequote=False,         # Default is True. Flag controlling whether quotechar instances are doubled.
                     escapechar='\\',           # Default is None. Character used to indicate an escape sequence.
                     lineterminator='\n',       # Default is \r\n. String used by writer to terminate a line.e
                     quotechar='',              # Default is quote("). String to surround fields containing special values (one character)
                     quoting=csv.QUOTE_NONE,    # Default is QUOTE_MINIMAL. Controls quoting behavior described above.
                     skipinitialspace=True,     # Default is False. Ignore whitespace after the field delimiter.
                     strict=True)               # Default is False. When True, raise exception Error on bad CSV input.

# 3. Create CSV Writer Object
csvWriter = csv.writer(csvfile, dialect='mysql')

print csv.list_dialects()

# 4. Write CSV String Data to File
for item in dataList:
    csvWriter.writerow(item)
