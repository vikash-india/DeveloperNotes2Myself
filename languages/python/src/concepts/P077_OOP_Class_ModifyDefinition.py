# Description: Modify Class Definition and Instance Definition

"""
### Note
* An instance definition can be modified to add more attributes and methods but it does not change the original class
  definition or other instances of the class.
* The class definition can also be modified to add more attributes and methods and it will change all the objects.
* Even a typing error can change an instance definition or a class definition.
"""


# Class
class Book(object):

    # Constructor
    def __init__(self, title, author, price):
        self.title = title
        self.author = author
        self.price = price
        self.available = False

    def make_available(self):
        self.available = True


if __name__ == '__main__':
    # Create Instances
    maths = Book("What is Mathematics, Really?", "Reuben Hersh", 694)
    fermat = Book("Fermat’s Last Theorem", "Simon Singh", 233)

    # Print Details
    print("Book 1: {} by {} for {}".format(maths.title, maths.author, maths.price, ))
    print("Book 2: {} by {} for {}".format(fermat.title, fermat.author, fermat.price, ))

    # Modify Instance Definition
    maths.year = 2002

    # Print Details
    print("Book 1 - Year: {}".format(maths.year))

    # Error: Other instances are not modified
    # print("Book 2 - Year: {}".format(fermat.year))

    # Modify Class Definition
    Book.year = "1971"                                      # This will NOT modify 2002 to 1971 for maths object.

    # Print Details
    print("Years: {}, {}".format(maths.year, fermat.year))

    # Modify Instance
    maths.year = "2003"
    print("Years: {}, {}".format(maths.year, fermat.year))

    # Print Definitions
    print(Book.__dict__)                                    # Print Class Definition
    print(maths.__dict__)                                   # Print Object Definition
    print(fermat.__dict__)                                  # Print Object Definition
