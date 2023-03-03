import re


def add_time(start, duration, start_day=''):

  week_days = {
    1: 'Monday',
    2: 'Tuesday',
    3: 'Wednesday',
    4: 'Thursday',
    5: 'Friday',
    6: 'Saturday',
    7: 'Sunday'
  }
  end_day = ''

  # Parse the input data and convert to minutes
  morn_aft = re.findall('^[0-9]{1,2}:[0-9]{1,2}\s(AM|PM)$', start)
  if morn_aft[0] == 'AM':
    start_hours = re.findall('^[0-9]{1,2}', start)
    start_hours = int(start_hours[0])
  elif morn_aft[0] == 'PM':
    start_hours = re.findall('^[0-9]{1,2}', start)
    start_hours = int(start_hours[0]) + 12
  else:
    return "Incorrect time format. Expected format like '2:03 PM'"

  start_minutes = re.findall(':([0-9]{1,2})', start)
  start_minutes = int(start_minutes[0])
  start_time = (start_hours * 60) + start_minutes
  duration_hours = re.findall('^[0-9]+', duration)
  duration_hours = int(duration_hours[0])
  duration_minutes = re.findall(':([0-9]+)', duration)
  duration_minutes = int(duration_minutes[0])
  duration_time = (duration_hours * 60) + duration_minutes

  # Calculate the total time to convert and the number of days passed
  total_time = start_time + duration_time
  days = int(total_time / 1440)

  # Calculate the end date of the new time if date is provided
  if start_day != '':
    for i, day in week_days.items():
      if start_day.lower() == day.lower():
        start_day_int = i
        break
    if start_day_int not in range(1, 7):
      return 'Invalid day of the week provided'
    else:
      end_day_int = start_day_int + (days % 7)
      if end_day_int > 7: end_day_int = end_day_int - 7
      end_day = week_days[end_day_int]

  # Normalize the total time within 24 hours
  if days >= 1:
    total_time -= days * 1440

  # Calculate the new times based on the input provided
  new_hours = int(total_time / 60)
  new_minutes = int(total_time % 60)
  new_morn_aft = 'AM'

  # Cover edge cases when AM and PM shift and set the appropriate AM/PM
  if new_hours == 12:
    new_morn_aft = 'PM'
  elif new_hours > 12:
    new_hours = new_hours - 12
    new_morn_aft = 'PM'
  elif new_hours == 0:
    new_hours = new_hours + 12

  # Return the result based on whether a day parameter was passed or not and how many days in the future the new time is
  if start_day == '':
    match days:
      case 0:
        result = (f'{new_hours}' + ':' + f'{new_minutes:02}' + ' ' +
                new_morn_aft)
      case 1:
        result = (f'{new_hours}' + ':' + f'{new_minutes:02}' + ' ' +
                  new_morn_aft + ' (next day)')
      case _:
        result = (f'{new_hours}' + ':' + f'{new_minutes:02}' + ' ' +
                  new_morn_aft + f' ({days} days later)')
  else:
    match days:
      case 0:
        result = (f'{new_hours}' + ':' + f'{new_minutes:02}' + ' ' +
                new_morn_aft + f', {end_day}')
      case 1:
        result = (f'{new_hours}' + ':' + f'{new_minutes:02}' + ' ' +
                  new_morn_aft + f', {end_day}' + ' (next day)')
      case _:
        result = (f'{new_hours}' + ':' + f'{new_minutes:02}' + ' ' +
                  new_morn_aft + f', {end_day}' + f' ({days} days later)')


  return result