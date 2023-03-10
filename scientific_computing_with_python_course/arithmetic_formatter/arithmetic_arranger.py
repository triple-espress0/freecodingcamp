import re


def arithmetic_arranger(problems, should_solve=False):

  # Check the number of problems
  if len(problems) > 5:
    return 'Error: Too many problems.'
  line1 = ''
  line2 = ''
  line3 = ''
  line4 = ''
  for problem in problems:
    # Check for correctnes of input
    if re.search('-|\+', problem) == None:
      return "Error: Operator must be '+' or '-'."
    elif re.search('[a-zA-Z]', problem) != None:
      return 'Error: Numbers must only contain digits.'

    sign = re.findall('-|\+', problem)
    operands = problem.split(sign[0])

    if len(operands[0].rstrip()) > 4 or len(operands[1].lstrip()) > 4:
      return 'Error: Numbers cannot be more than four digits.'

    # Construct the strings if first operand is greater than the second
    if len(operands[0]) >= len(operands[1]):
      line1 = (line1 + (2 * ' ') + operands[0].rstrip() + (4 * ' '))
      line3 = (line3 + ((len(operands[0].rstrip()) + 2) * '-') + (4 * ' '))
      if sign[0] == '+':
        line2 = (line2 + '+' + ((len(operands[0]) - len(operands[1])) * ' ') +
                 operands[1] + (4 * ' '))
      else:
        line2 = (line2 + '-' + ((len(operands[0]) - len(operands[1])) * ' ') +
                 operands[1] + (4 * ' '))
    # Construct the strings if second operand is greater than the first
    else:
      line1 = (line1 + (
        (len(operands[1].lstrip()) + 2 - len(operands[0].rstrip())) * ' ') +
               operands[0].rstrip() + (4 * ' '))
      line3 = (line3 + ((len(operands[1]) + 1) * '-') + (4 * ' '))
      if sign[0] == '+':
        line2 = (line2 + '+' + operands[1] + (4 * ' '))
      else:
        line2 = (line2 + '-' + operands[1] + (4 * ' '))

    # Add additional line with the sum of operands if passed as argument
    if should_solve == True:
      if sign[0] == '+':
        sum = int(operands[0].rstrip()) + int(operands[1].lstrip())
        line4 = (line4.rstrip() + (
          (len(line3.rstrip()) - len(str(sum)) - len(line4.rstrip())) * ' ') +
                 str(sum) + (4 * ' '))
      else:
        sum = int(operands[0].rstrip()) - int(operands[1].lstrip())
        line4 = (line4.rstrip() + (
          (len(line3.rstrip()) - len(str(sum)) - len(line4.rstrip())) * ' ') +
                 str(sum) + (4 * ' '))

  result = (line1.rstrip() + '\n' + line2.rstrip() + '\n' + line3.rstrip() +
            '\n' + line4.rstrip()).rstrip()
  return (result)
