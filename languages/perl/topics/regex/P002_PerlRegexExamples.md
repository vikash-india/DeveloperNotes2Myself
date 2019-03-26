# Description: Regular Expression Examples in Perl

### Regex for Natural Numbers
* Natural numbers are positive integers {1, 2, 3, ...}. Zero (0) is not a natural number.
```perl
^\+?[1-9]\d*$       # Signed Natural Numbers
^[1-9]\d*$          # Unsigned Natural Numbers

# Matches
1
50
100
+100

# Non-Matches
0
01
-1
-102
0.5
11.25
This is 100
```

### Regex for Integers
* Zero (0) is neither positive nor negative.
```perl
# Regex with leading but unsigned zero
^(
    [+\-]       # Signed
    (?!0+$)     # Negative Lookahead for all Zeros
)?              # 0 or 1 of the above sub-pattern
\d+$            # One or more digits till the end

# Regex with leading or signed zero
^[+\-]?\d+$

# Matches
+10
-10
0
000
000001
-000001

# Non-Matches
+0
+000
-0
-000
+10.00
-10.50
10.50
Text 10
```

### Regex For Real Numbers
* Exponent form is not supported.
```perl
# With Unsigned Zeros
^(
    [+\-]
    (?!             # Negative Lookahead Begin
        0+          # One ore more zeros
        (\.0+)?$    # 0 or 1 of all zeros after decimal point
    )               # Negative Lookahead End
)?                  # 0 or 1 of above sub-pattern
\d+(\.\d+)?$        # Any Digit followed by optional decimal component

# With signed zeros
^[-+]?\d+(\.\d+)?$

# Matches
0
0.0
1
+1
-1
1.0
+1.0
-1.0
1.000000
+1.000000
-1.000000
0.50
+0.50
-0.50
0000000.50000
54321
-54321

# Non-Matches
+0
-0
.0
5.
+.0
-.0
+0.00
-0.00
23e4
+23e4
-23e4
23e-4
+23e-4
-23e-4
+23E-4
Text followed by 0.4
0.4 followed by text
345.0234A0
Plain old text
```

### Regex for Email IDs
```perl
# Regex for Most but NOT ALL Email IDs
 ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$

# Regex for Longer Domain Names  
^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$

# Regex for IP Addresses as Domain Names 
^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+$

# Matches
name.surname@blah.com
name.surname@department.company.com
name.surname@blah.museum
blah@127.0.0.1

# Non-Matches
name surname@blah.com
name."surname"@blah.com
__@__.__
a--b@c__d.ef
hello@worl_d.com
.hello@wor#.co.uk
broken@@example.com
name@bla-.com
-a-@-b-.cd
foo@bar.infp
```

### TODO
* None