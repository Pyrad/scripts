# File Name: backup.py

import os
import time

# OS related paths
source = ['C:\\Users\\Pyrad\\Desktop\\tmps\\learning_python']
target_dir = 'C:\\Users\\Pyrad\\Desktop\\tmps\\learning_python\\AllBackups'
zip_exec = r'C:"\\Program Files (x86)"\\GnuWin32\\bin\\zip.exe'

if not os.path.exists(target_dir):
	os.mkdir(target_dir)
	print("Create backup directory:")
	print(' --{}'.format(target_dir))
	print('')
	
today = target_dir + os.sep + time.strftime('%Y%m%d')
now = time.strftime('%H%M%S')
target = today + os.sep + now + '.zip'
if not os.path.exists(today):
	os.mkdir(today)
	print("Create target directory:")
	print(' --{}'.format(today))
	print('')

zip_command = '{0} -r {1} {2}'.format(zip_exec, target, ' '.join(source))
print('Zip command is:')
print(zip_command)
print('')
print('Running:')
if os.system(zip_command) == 0:
	print('Successful backup to', target)
else:
	print('Backup FAILED')