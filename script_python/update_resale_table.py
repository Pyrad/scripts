import tempfile
import os
from datetime import datetime


class ResaleTableRefresh:
    """
    Update a specific table for the resale numbers in file
    """
    def __init__(self, fname=None):
        self.fname = fname
        self.curtime = datetime.now()

    def find_this_week_table(self):
        weeknum = int(self.curtime.strftime("%U"))
        yearnum = self.curtime.year
        table_name = "$\\text{{Year {} Week {}}}$".format(yearnum, weeknum)
        #print(f"table_name is {table_name}")
        #print(f"table_name.encode('utf-8') is {table_name.encode('utf-8')}")
        lnum = -1
        with open(self.fname, 'r', encoding='UTF-8') as fp:
            for i, line in enumerate(fp):
                curline = line.strip()
                if curline == table_name:
                    lnum = i
                    break
        return lnum

if __name__ == "__main__":
    fname = "resalenumbers2023sample.md"
    rtr = ResaleTableRefresh(fname)
    n = rtr.find_this_week_table()
    print("Table of this week starts at line {}".format(n + 1 if n >= 0 else -1))
