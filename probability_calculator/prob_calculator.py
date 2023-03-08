import copy
import random


class Hat:

  def __init__(self, **balls):
    self.contents = list()
    for ball in balls:
      for i in range(int(balls[ball])):
        self.contents.append(ball)

  def draw(self, quant_balls):
    if quant_balls >= len(self.contents):
      self.contents.clear
      return self.contents
    else:
      drawn_balls = list()

      for i in range(quant_balls):
        rand = random.randint(0, len(self.contents) - 1)
        drawn_balls.append(self.contents[rand])
        del self.contents[rand]

      return drawn_balls


def experiment(hat: 'Hat', expected_balls, num_balls_drawn, num_experiments):

  succes_count = 0

  for i in range(num_experiments):
    hat_copy = copy.deepcopy(hat)
    drawn_balls = hat_copy.draw(num_balls_drawn)

    is_subset = False
    for colour in expected_balls:
      if expected_balls[colour] > drawn_balls.count(colour):
        is_subset = False
        break
      else:
        is_subset = True

    if is_subset: succes_count += 1

  return succes_count / num_experiments
