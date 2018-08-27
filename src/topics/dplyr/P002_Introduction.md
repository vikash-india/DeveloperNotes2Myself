# Description: Introduction to dplyr

# Install dplyr Package
```
install.packages("dplyr")
```

# Note
1. Data Munging or Data Wrangling: Data munging or data wrangling is loosely the process of manually converting or 
   mapping data from one "raw" form into another format that allows for more convenient consumption of the data with the 
   help of semi-automated tools. This may include further munging, data visualization, data aggregation, training a 
   statistical model, as well as many other potential uses. 
2. The dplyr package is a powerful R-package for data wrangling, especially to transform and summarize tabular data with 
   rows and columns.
3. The package contains a set of functions (or "verbs") that perform common data manipulation operations such as 
   filtering for rows, selecting specific columns, re-ordering rows, adding new columns and summarizing data.
4. The dplyr package also perform another common task which is the "split-apply-combine" (SAC) concept.
5. Following are the important dplyr verbs
    - select() and rename())        - select columns 
    - filter() and slice())         - filter rows
    - arrange()                     - re-order or arrange rows
    - mutate() and transmute()      - create new columns
    - summarise()                   - summarise values
    - group_by()                    - allows for group operations in the "split-apply-combine" concept.
    - sample_n() and sample_frac()  - get sample data.
7. The syntax and function of all these verbs are very similar, 
    - The first argument is a data frame.
    - The subsequent arguments describe what to do with the data frame. Notice that the columns can be referred in the 
      data frame directly without using $.
    - The result is a new data frame.
6. Pipe operator: %>%: The pipe operator(%>%) is imported by dplyr from another package magrittr. This operator helps 
   to pipe the output from one function to the input of another function. Instead of nesting functions (reading from the 
   inside to the outside), the idea of of piping is to read the functions from left to right.

# TODO
# 1. None
