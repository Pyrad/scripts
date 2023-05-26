import pandas as pd
import sys

# A dict
# 1st key is the date string, 2nd key is the time string
tmdict = {"date" : ["2023-05-26", "2023-05-26"],
          "time" : ["12:01:32", "15:58:32"], }

# A dict
# each key corresponds to a column
# The value for the key is the elements of this column
datadict = {"Beijing" : [0, 1],
        "Guangzhou" : [2, 3],
        "Suzhou" : [4, 5],
        "Hangzhou" : [6, 7],
        "Nanjing" : [8, 9],
        "Xian" : [10, 11],
        "Chengdu" : [12, 13],
        "Chongqing" : [14, 15],
        "Tianjin" : [16, 17],
        "Hefei" : [18, 19],
        "Fuzhou" : [20, 21],
        "Xiamen" : [22, 23],
        "Changsha" : [24, 25],
        "Shanghai" : [26, 27],
        "Shenzhen" : [28, 29],
        "Wuhan" : [30, 31], }

cdict = tmdict.copy()
cdict.update(datadict)

# Create a pandas dataframe by this dict data
#df = pd.DataFrame(datadict)
df = pd.DataFrame(cdict)

# Write out a spreadsheet file (.xlsx)
spfname = 'citynum.xlsx'
try:
    df.to_excel(spfname, sheet_name='CityResaleNum', index=False)
except PermissionError as perr:
    #print(perr.what())
    #print(dir(perr))
    print(f"PermissionError: errono = {perr.errno}")
    print(f"PermissionError: strerror = {perr.strerror}")
    print(f"PermissionError: filename = \'{perr.filename}\'")
except Exception as e:
    print(e.what())


rdata = pd.read_excel(spfname)
print(type(rdata))
print(rdata.head())



