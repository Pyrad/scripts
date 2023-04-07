# shebang should be here while current it has none

import datetime

# Current date & time
curtime = datetime.datetime.now()
print(curtime)

# Year, week of year, and week of day
this_year, this_week, weekday = curtime.isocalendar()
print(this_year, this_week, weekday)


