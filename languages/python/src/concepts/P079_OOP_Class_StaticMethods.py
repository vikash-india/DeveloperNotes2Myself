# Description: Static Methods

import datetime
import pytz

"""
# Note
* If self parameter is not being used in a method then it should be converted to staticmethod or class level methods.
* This can be done using an underscore(_) in front of method, removing the self parameter and adding a @staticmethod 
  decorator.
* Static method is shared by all instances of the class.
* By convention, the name starting with underscore is not public but nothing in Python enforces it.
* The attributes with single underscore(_) is for internal use only.
"""


class Account:
    """ Simple account class with balance """

    @staticmethod
    def _current_time():
        utc_time = datetime.datetime.utcnow()
        return pytz.utc.localize(utc_time)

    def __init__(self, name, balance):
        self.name = name
        self.balance = balance
        self.transaction_list = []
        print("Account created for " + self.name)

    def deposit(self, amount):
        if amount > 0:
            self.balance += amount
            self.show_balance()
            self.transaction_list.append((Account._current_time(), amount))

    def withdraw(self, amount):
        if 0 < amount <= self.balance:
            self.balance -= amount
            self.transaction_list.append((Account._current_time(), -amount))
        else:
            print("The amount must be greater than zero and no more then your account balance")
        self.show_balance()

    def show_balance(self):
        print("Balance is {}".format(self.balance))

    def show_transactions(self):
        for date, amount in self.transaction_list:
            if amount > 0:
                tran_type = "deposited"
            else:
                tran_type = "withdrawn"
                amount *= -1
            print("{:6} {} on {} (local time was {})".format(amount, tran_type, date, date.astimezone()))


if __name__ == '__main__':
    dilbert = Account("Dilbert", 0)

    dilbert.deposit(1000)
    dilbert.withdraw(500)
    dilbert.withdraw(2000)

    dilbert.show_transactions()
