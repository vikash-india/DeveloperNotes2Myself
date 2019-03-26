# Description: Regular Expression Cheatsheet

### Note
* The following theory applies to any Perl Compatible Regular Expressions (PCRE) library.

### Metacharacters
* All characters match themselves except for these 14 meta characters ^ $ . * + ? | ( ) [ ] { } \ 
* Escape a meta character by preceding it with a backslash to match the meta characters literally.
```
^               Beginning of string or negation of character class.
$               End of string.
.               Any character except newline.
*               Match 0 or more times.
+               Match 1 or more times.
?               Match 0 or 1 times ie the shortest match.
|               Alternative.
( )             Grouping or storing.
[ ]             Set of characters.
{ }             Repetition modifier.
\               Quote or special.
```

### Character Classes
```
.               Match any character except newline.
[a-zA-Z0-9]     One character of a-z or A-Z or 0-9.
[^a-zA-Z0-9]	One character except a-z or A-Z or 0-9.
[\b]	        Backspace character.
\d              One digit. Same as [0-9].
\D              One non-digit. Same as [^0-9].
\s              One whitespace. Same as [ \t\r\n\f].
\S              One non-whitespace. Same as [^ \t\r\n\f].
\w              One word character. Same as [A-Za-z0-9_].
\W              One non-word character. Same as  [^A-Za-z0-9_].
```

### Greedy Quantifiers
```
re*             Zero or more re. Same as {,}.
re+             One or more re. Same as {1,}.
re?             Zero or one re (i.e., optional re). Same as {,1}.
re{m}           Exactly m re.
re{m,}          At least m re.
re{m,n}         At least m but at most n re. m defaults to 0 and n defaults to infinity. 
```

### Lazy Quantifiers
* Lazy quantifiers are specified using a ? at the end of a greedy quantifiers. In general, repetition? is same as 
  repetition but the shortest match is taken.
```
re*?             Zero or more re not greedily.
re+?             One or more re not greedily.
re??             Zero or one re not greedily. 
re{m}?           Exactly m re not greedily.
re{m,}?          At least m re not greedily.
re{m,n}?         At least m but at most n re not greedily. 
```

### Anchors
```
^               Start of string.
$               End of string.
\A              Start of string, ignores m flag.
\Z              End of string, ignores m flag.
\b              Word boundary.
\B              Non-word boundary.
```

### Groups
```
# Groups
(...)           Capturing group.
(?P<Y>...)      Capturing group named Y.
(?:...)         Non-capturing group.
\Y              Match the Y'th captured group.
(?P=Y)  	    Match the named group Y.
(?#...)         Comment.

# Group Replacements
\g<0>           Insert entire match.
\g<Y>           Insert match Y (name or number).
\Y              Insert group numbered Y.
```

### Lookarounds
* Lookarounds do not consume texts.
* (?: ...) is called non-capturing parenthesis or Grouping-only parenthesis.
```
(?=...)         Positive lookahead.
(?!...)         Negative lookahead.
(?<=...)        Positive lookbehind.
(?<!...)        Negative lookbehind.
(?()|)          Conditional.
```

### Special Characters
* Special character escapes are like escaped Python string literals. Hence regex '\n' is same as regex '\\n'.
```
\a              ASCII Bell (BEL).
\f              ASCII Formfeed.
\n              ASCII Newline feed.
\r              ASCII Carriage return.
\t              ASCII Tab.
\v              ASCII Vertical tab.
\\              A single backslash.
\xHH            Two digit hexadecimal character goes here.
\OOO            Three digit octal char (or just use an initial zero, e.g. \0, \09).
\DD             Decimal number 1 to 99, match previous numbered group.
```

### TODO
* None
