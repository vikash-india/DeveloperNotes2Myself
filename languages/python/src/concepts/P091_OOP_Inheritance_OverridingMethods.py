# Description: Method Overriding

"""
### Note
* None
"""
import random


class Player(object):

    def __init__(self, name):
        self.name = name
        self._lives = 3
        self._level = 1
        self._score = 0

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
            self._score += delta * 1000
            self._level = level
        else:
            print("Level can't be less than 1")

    lives = property(_get_lives, _set_lives)
    level = property(_get_level, _set_level)

    @property
    def score(self):
        return self._score

    @score.setter
    def score(self, score):
        self._score = score

    def __str__(self):
        return "Name: {0.name}, Lives: {0.lives}, Level: {0.level}, Score {0.score}".format(self)


# Class Enemy
class Enemy(object):

    def __init__(self, name="Enemy", hit_points=0, lives=1):
        self._name = name
        self._hit_points = hit_points
        self._lives = lives
        self._alive = True

    def take_damage(self, damage):
        remaining_points = self._hit_points - damage
        if remaining_points >= 0:
            self._hit_points = remaining_points
            print("I took {} points damage and have {} left".format(damage, self._hit_points))
        else:
            self._lives -= 1
            if self._lives > 0:
                print("{0.name} lost a life".format(self))
            else:
                print("{0.name} is dead".format(self))
                self._alive = False

    def __str__(self):
        return "Name: {0.name}, Lives: {0.lives}, Hit points: {0.hit_points}".format(self)


class Troll(Enemy):

    def __init__(self, name):
        # super(Troll, self).__init__(name=name, lives=1, hit_points=23)
        super().__init__(name=name, lives=1, hit_points=23)

    def grunt(self):
        print("Me {0.name}. {0.name} stomp you".format(self))


class Vampyre(Enemy):

    def __init__(self, name):
        super().__init__(name=name, lives=3, hit_points=12)

    def dodges(self):
        if random.randint(1, 3) == 3:
            print("***** {0.name} dodges *****".format(self))
            return True
        else:
            return False

    def take_damage(self, damage):
        if not self.dodges():
            super().take_damage(damage=damage)


if __name__ == '__main__':
    ugly_troll = Troll("Pug")
    print("Ugly troll - {}".format(ugly_troll))

    another_troll = Troll("Ug")
    print("Another troll - {}".format(another_troll))
    another_troll.take_damage(18)
    print(another_troll)

    brother = Troll("Urg")
    print(brother)

    ugly_troll.grunt()
    another_troll.grunt()
    brother.grunt()

    vamp = Vampyre("Vlad")
    print(vamp)
    vamp.take_damage(5)
    print(vamp)

    print("-" * 40)
    another_troll.take_damage(30)
    print(another_troll)

    # while vamp.alive:
    #     vamp.take_damage(1)
    # print(vamp)

    vamp._lives = 0
    vamp._hit_points = 1
    print(vamp)













