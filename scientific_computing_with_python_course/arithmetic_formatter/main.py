# main.py was supplied as part of the problem and was not created by me
from pytest import main

from arithmetic_arranger import arithmetic_arranger

print(arithmetic_arranger(['3 + 855', '3801 - 2', '45 + 43', '123 + 49']))

# Run unit tests automatically
main(['-vv'])
