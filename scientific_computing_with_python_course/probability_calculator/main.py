# main.py was supplied as part of the problem and was not created by me
import prob_calculator
from unittest import main

prob_calculator.random.seed(95)
hat = prob_calculator.Hat(blue=3, red=2, green=6)
probability = prob_calculator.experiment(
    hat=hat,
    expected_balls={"blue": 2,
                    "green": 1},
    num_balls_drawn=4,
    num_experiments=1000)
print("Probability:", probability)

# Run unit tests automatically
main(module='test_module', exit=False)
