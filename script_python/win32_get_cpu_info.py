"""
This needs Python 3 and module pywin32
"""

def get_cpu_type():
    from win32com.client import GetObject
    root_winmgmts = GetObject("winmgmts:root\cimv2")
    cpus = root_winmgmts.ExecQuery("Select * from Win32_Processor")
    return cpus[0].Name


if __name__ == "__main__":
    print(f"Current machine's CPU is {get_cpu_type()}")

