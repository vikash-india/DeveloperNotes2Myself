# Description: Apache Mod Rewrite Cheatsheet 

### Syntax
* Syntax of RewriteRule

![RewriteRule Syntax](images/mod_rewrite_01_syntax_rewriterule.png)

* Syntax of RewriteRule

![RewriteCond Syntax](images/mod_rewrite_02_syntax_rewritecond.png)

### Directives related to mod `rewrite` 
* RewriteEngine
* RewriteMap
* RewriteOptions
* RewriteBase
* RewriteLog
* RewriteCond
* RewriteLogLevel
* RewriteRule
* RewriteLock

### Regular Expressions Syntax
* Regular expressions used for mod `rewrite` is PCRE.
* Summary of Regular expressions.
```
^                               # Start of string
$                               # End of string
.                               # Any single character
(a|b)                           # a or b
(...)                           # Group section
[abc]                           # In range (a, b or c)
[^abc]                          # Not in range
\s                              # White space
a?                              # Zero or one of a
a*                              # Zero or more of a
a*?                             # Zero or more, ungreedy
a+                              # One or more of a
a+?                             # One or more, ungreedy
a{3}                            # Exactly 3 of a
a{3,}                           # 3 or more of a
a{,6}                           # Up to 6 of a
a{3,6}                          # 3 to 6 of a
a{3,6}?                         # 3 to 6 of a, ungreedy
\                               # Escape character
[:punct:]                       # Any punctu­ation symbol
[:space:]                       # Any space character
[:blank:]                       # Space or tab
```

### RewriteRule Flags for mod `rewrite` 
```
C                               # Chained with next rule
CO=cookie                       # Set specified cookie
E=var:value                     # Set enviro­nmental variable “var” to “value”
F                               # Forbidden (403 header)
G                               # Gone - no longer exists
H=handler                       # Set handler
L                               # Last - stop processing rules
N                               # Next - continue processing
NC                              # Case insensitive
NE                              # Do not escape output
NS                              # Ignore if subrequest
P                               # Proxy
PT                              # Pass through
R[=code]                        # Redirect to new URL, with optional code (see below)
QSA                             # Append query string
S=x                             # Skip next x rules
T=mime-type                     # Set mime type
```
### RewriteCond Flags for mod `rewrite` 
```
NC                              # Case insensitive
OR                              # Combine with next rule using 'OR' instead of the default of 'AND'
```

### Redirection Header Codes
```
301                             # Moved permanently
302                             # Moved temporarily (default)
```

### Mod `rewrite` Server Variables - HTTP Headers
```
%{HTTP_USER_AGENT}
%{HTTP_REFERER}
%{HTTP_COOKIE}
%{HTTP_FORWARDED}
%{HTTP_HOST}
%{HTTP_PROXY_CONNECTION}
%{HTTP_ACCEPT}
```

### Mod `rewrite` Server Variables - Server Internals
```
%{DOCUMENT_ROOT}
%{SERVER_ADMIN}
%{SERVER_NAME}
%{SERVER_ADDR}
%{SERVER_PORT}
%{SERVER_PROTOCOL}
%{SERVER_SOFTWARE}
```

### Mod `rewrite` Server Variables - Special
```
%{API_VERSION}
%{THE_REQUEST}
%{REQUEST_URI}
%{REQUEST_FILENAME}
%{IS_SUBREQ}
%{HTTPS}
```

### Mod `rewrite` Server Variables - Request
```
%{REMOTE_ADDR}
%{REMOTE_HOST}
%{REMOTE_PORT}
%{REMOTE_USER}
%{REMOTE_IDENT}
%{REQUEST_METHOD}
%{SCRIPT_FILENAME}
%{PATH_INFO}
%{QUERY_STRING}
%{AUTH_TYPE}
```

### Mod `rewrite` Server Variables - Time
```
%{TIME_YEAR}
%{TIME_MON}
%{TIME_DAY}
%{TIME_HOUR}
%{TIME_MIN}
%{TIME_SEC}
%{TIME_WDAY}
%{TIME}
```
