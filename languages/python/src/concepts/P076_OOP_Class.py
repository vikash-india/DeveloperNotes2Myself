# Description: Class, Instances, Constructor, Self in Python

"""
### Note
* Class
    - A template for creating objects.
    - All objects created using the same class will have the same characteristics.
* Object
    - An instance of a class.
* Instantiate
    - Create an instance of a class.
* Method
    - A function defined in a class.
* Attribute
    - A variable bound to an instance of a class.
* Class Variables
    - Each object gets its own copy of class variables and is different from Java static fields.
"""


# Class
class Book(object):
    # Class Variables
    count = 0

    # Constructor
    def __init__(self, title, author, price):
        self.title = title
        self.author = author
        self.price = price
        self.available = False

    def make_available(self):
        self.available = True


if __name__ == '__main__':
    # Create Instance
    maths = Book("What is Mathematics, Really?", "Reuben Hersh", 694)
    print("Book 1: {} by {} for {}".format(maths.title, maths.author, maths.price))

    # Modify Instance
    maths.price = 800
    print("Book 1: New Price is {}".format(maths.price))

    # Modify instance
    maths.make_available()
    print("Availability: ", maths.available)

    # Create another object
    fermat = Book("Fermat’s Last Theorem", "Simon Singh", 233)

    # Print Details
    print("Books: {} by {} for {}, {} by {} for {}".format(maths.title, maths.author, maths.price, fermat.title,
                                                           fermat.author, fermat.price))
    print("Books: {0.title} by {0.author} for {0.price}, {1.title} by {1.author} for {1.price}".format(maths, fermat))

    # Print class variables
    print("Book Count: {0.count} ".format(Book))
    print("Book Object Count: {0.count}, {1.count}".format(maths, fermat))

    maths.count = 1
    fermat.count = 2
    print("New Book Count: {0.count} ".format(Book))
    print("New Book Object Count: {0.count}, {1.count}".format(maths, fermat))

    # Print Definitions
    print(Book.__dict__)
    print(maths.__dict__)
    print(fermat.__dict__)
