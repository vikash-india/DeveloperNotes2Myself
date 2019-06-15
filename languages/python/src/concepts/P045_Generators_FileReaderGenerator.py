# Description: Generator for File Reader

# Note
# 1. Large files can be read using a generator functions.

# A generator to read a large file lazily, one line at a time
def file_reader_generator(file_object):
    while True:
        data = file_object.readline()
        if not data:
            break
        yield data


def process(path):
    try:
        with open(path) as file_handler:
            # Use file_reader_generator as iterator
            for line in file_reader_generator(file_handler):
                # Print without extra newline
                print(line, end ="")
    except (IOError, OSError):
        print("Error opening file!")

# Call the above code
path = "/etc/hosts"
process(path)
