# Description: Regular Expression Examples in Python

# Email Address
re.compile(r"""^[a-zA-Z0-9_.+-]+    # Begins with some alphanumeric text.
                @[a-zA-Z0-9-]+      # Contains @ symbol + some alphanumeric text.
                \.[a-zA-Z0-9-.]+$   # Contains . symbol + some alphanumeric text at the end.
            """, re.X)

# IP Addresses
re.compile(r"""^\d{1,3}             # Begins with upto 3-digit number.
                \.\d{1,3}           # Contains . symbol + upto 3-digit numbers.
                \.\d{1,3}           # Contains . symbol + upto 3-digit numbers.
                \.\d{1,3}$          # Contains . symbol + upto 3-digit numbers at the end.
            """, re.X)
