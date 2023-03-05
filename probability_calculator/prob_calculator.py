import copy
import random
# Consider using the modules imported above.

class Hat:
    def __init__(self, **balls):
        self.contents = list()
        for ball in balls:
            for i in range(int(balls[ball])):
                self.contents.append(ball)

        print(self.contents)

def experiment(hat, expected_balls, num_balls_drawn, num_experiments):
    return 'foo'
