# Arithmetic Formatter

This is a solution to the following excercise: https://www.freecodecamp.org/learn/scientific-computing-with-python/scientific-computing-with-python-projects/arithmetic-formatter

Summary:
The program formats in a vertical manner a list of one or more(up to 5) arithmetic (limited to addition and substraction) problems. If an optional argument is passed, the program prints out the solution as well.

Example:
I. No argument to solve passed:
    Input: arithmetic_arranger(["32 + 698", "3801 - 2", "45 + 43", "123 + 49"])

    Output:
       32      3801      45      123
    + 698    -    2    + 43    +  49
    -----    ------    ----    -----

II. Argument to solve passed:
    Input: arithmetic_arranger(["32 + 8", "1 - 3801", "9999 + 9999", "523 - 49"], True)

    Output:
      32         1      9999      523
    +  8    - 3801    + 9999    -  49
    ----    ------    ------    -----
      40     -3800     19998      474
