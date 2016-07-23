# Description: R Objects and Data Types

### Atomic R Objects
R has five 'atomic' classes of objects,
- Logical (True/False)
- Character
- Numeric (Real numbers)
- Integer
- Complex

### Complex R Objects or Data Types
- Vectors
- List
- Matrices
- Factors
- Data Frames
- Raw

### Attributes
1. R objects can have attributes, which are like metadata for the object. These metadata can be very useful in that 
   they help to describe the object. For example, column names on a data frame help to tell us what data are contained
   in each of the columns. Some examples of R object attributes are as follows
    - names, dimnames
    - dimensions (e.g. matrices, arrays)
    - class (e.g. integer, numeric)
    - length
    - other user-defined attributes/metadata
2. Attributes of an object (if any) can be accessed using the attributes() function. Not all R objects contain
   attributes, in which case the attributes() function returns NULL.

### Vectors
- The most basic data type in R is a vector. 
- Empty vectors can be created with the vector() function or c() function.
- A vector (except list) can only contain objects of the same class.

### Lists
- A list is represented as a vector but can contain objects of different classes. 

### Matrices

### Factors

### Data Frames

### Raw
- There is also a class for 'raw' objects, but they are not commonly used directly in data analysis.

### TODO
1. None
