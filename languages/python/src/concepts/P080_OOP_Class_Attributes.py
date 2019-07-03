# Description: Class Attributes

import datetime
import pytz

"""
### Fixing Class Definition
* The attributes name and balance should be made private using underscore.
* The _transaction_list should be initialised to get a more complete transaction history.
* The attributes with single underscore(_) is for internal use only. Eg. _name.
* The attributes with double underscore(__) is for internal use only. Eg. __balance. 
* The method with double underscore(__) does not result in naming mangle. Similarly the __init__ is also not mangled. 
  READ MORE ON THIS. 
"""


class Account:
    """ Simple account class with balance """

    @staticmethod
    def _current_time():
        utc_time = datetime.datetime.utcnow()
        return pytz.utc.localize(utc_time)

    def __init__(self, name, balance):
        self._name = name
        self.__balance = balance

        # Initialise Transaction list
        self._transaction_list = [(Account._current_time(), balance)]
        print("Account created for " + self._name)
        self.show_balance()

    def deposit(self, amount):
        if amount > 0:
            self.__balance += amount
            self.show_balance()
            self._transaction_list.append((Account._current_time(), amount))

    def withdraw(self, amount):
        if 0 < amount <= self.__balance:
            self.__balance -= amount
            self._transaction_list.append((Account._current_time(), -amount))
        else:
            print("The amount must be greater than zero and no more then your account balance")
        self.show_balance()

    def show_balance(self):
        print("Balance is {}".format(self.__balance))

    def show_transactions(self):
        for date, amount in self._transaction_list:
            if amount > 0:
                tran_type = "deposited"
            else:
                tran_type = "withdrawn"
                amount *= -1
            print("{:6} {} on {} (local time was {})".format(amount, tran_type, date, date.astimezone()))


if __name__ == '__main__':
    # An object
    dilbert = Account("Dilbert", 0)
    dilbert.show_balance()

    dilbert.deposit(1000)
    dilbert.withdraw(500)
    dilbert.withdraw(2000)

    dilbert.show_transactions()

    # Another object
    catbert = Account("Catbert", 800)

    catbert._balance = 200                      # This should be avoided

    catbert.deposit(100)
    catbert.withdraw(200)

    catbert.show_transactions()

    catbert.show_balance()

    print(catbert.__dict__)

    catbert._Account__balance = 40              # This should be avoided

    catbert.show_balance()
