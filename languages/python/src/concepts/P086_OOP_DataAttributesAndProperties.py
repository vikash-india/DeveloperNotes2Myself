# Description: Data Attributes and Properties

"""
### Note
* None
"""


class Player(object):

    def __init__(self, name):
        self.name = name
        self._lives = 3
        self._level = 1
        self.score = 0

    def _get_lives(self):
        return self._lives

    def _set_lives(self, lives):
        if lives >= 0:
            self._lives = lives
        else:
            print("Lives cannot be negative")
            self._lives = 0

    def _get_level(self):
        return self._level

    def _set_level(self, level):
        if level > 0:
            delta = level - self._level
            self.score += delta * 1000
            self._level = level
        else:
            print("Level can't be less than 1")

    lives = property(_get_lives, _set_lives)
    level = property(_get_level, _set_level)

    def __str__(self):
        return "Name: {0.name}, Lives: {0.lives}, Level: {0.level}, Score {0.score}".format(self)


if __name__ == '__main__':
    dilbert = Player("Dilbert")

    print(dilbert.name)
    print(dilbert.lives)
    dilbert.lives -= 1
    print(dilbert)

    dilbert.lives -= 1
    print(dilbert)

    dilbert.lives -= 1
    print(dilbert)

    dilbert.lives -= 1
    print(dilbert)

    dilbert._lives = 9
    print(dilbert)

    dilbert.level = 2
    print(dilbert)

    dilbert.level += 5
    print(dilbert)

    dilbert.level = 3
    print(dilbert)
