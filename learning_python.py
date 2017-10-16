import sys

### A flag to show the beginning of this Python script
print('-----------------------------------------')
print('-- THIS IS THE BEGINNING OF THE SCRIPT --')
print('-----------------------------------------')
print(' ')


age = 20
name = 'Swaroop'

print('{0} was {1} years old when he wrote this book'.format(name, age))
print('Why is {0} playing with that python?'.format(name))

print('{0:.3f}'.format(1.0/3))
print('{0:_^11}'.format('hello'))
print('{name} wrote {book}'.format(name='Swaroop', book='A Byte of Python'))

# Replace implicit <CR>
print('a', end=' ')
print('b', end=' ')
print('b')

two_line_string = '''Good to see you today
and water is clear'''

print('{0}'.format(two_line_string))


# String multiply
str = 'la'
out = str * 3
print('{0}'.format(out))
# Or just
print('la'*3)

#exact division
print( 4//3 )

# Bool operations
a = True
b = False
print(not a)
print(a and b)
print(a or b)



### Control flow
print('')
print('---While loop---')
idx = 0
limit = 50
while idx < limit:
	print('Current index is {0}'.format(idx))
	idx = idx + 1
	if idx % 26 == 0:
		print('Reached 26, stop in advance')
		break
		
	if idx % 3 == 0:
		print('{0} is a multiply of 3, skip'.format(idx))
		continue
		
	if idx == limit:
		print('Reached limit, will stop...')
	elif idx < limit:
		print('Still below limit')
	else:
		print('Beyond limit!')
else:
	print('The while loop is over')


### for loop
print('')
print('---for loop---')
for i in range(1, 5):
	print(i)
else:
	print('The for loop is over')

### length function
print('')
print('---String Length Function---')
test_string = "Good Day today, isn't it?"
slen = len(test_string)
print('The length of string: \"{0}\" is {1}'.format(test_string, slen))

### Return statement in functions
print('')
print('---Return statement in functions---')
def get_max(a, b):
	if a > b:
		return a
	elif a < b:
		return b
	else:
		return b
print(get_max(2, 3))
		
		
### Self-defined functions
print('')
print('---Self-defined functions---')
def print_max(a, b):
	func_name = sys._getframe().f_code.co_name
	print('(Function name is {0})'.format(func_name))
	if a > b:
		print(a, 'is max')
	elif a < b:
		print(b, 'is max')
	else:
		print(a, 'equals to', b)

print_max(1, 3)
print_max(9, 3)
print_max(5, 5)

### Global variables
print('')
print('---Global variables---')

a_global_var = 50
def gfunc():
	global a_global_var
	print('a_global_var is', a_global_var)
	a_global_var = 3
	print('Change global var a_global_var to', a_global_var)

gfunc()
print('Value of a_global_var is', a_global_var)

### Default arguments
print('')
print('---Default arguments---')
def say(msg, times = 1):
	print(msg * times)

say('Hello')
say('World ', 5)




### Keyword Arguments
print('')
print('---Keyword Arguments---')

def keyword_args_func(a, b = 5, c = 10):
	print('a is', a, 'and b is', b, 'and c is', c)
	
keyword_args_func(3, 7) ### a is 3 and b is 7 and c is 10
keyword_args_func(25, c = 24)  ### a is 25 and b is 5 and c is 24
keyword_args_func(c = 50, a = 100)  ### a is 100 and b is 5 and c is 50


### Various variables
print('')
print('---Keyword Arguments---')

def total(a = 5, *numbers, **phonebook):
	print('a', a)
	### Traverse tuple elements
	for single_item in numbers:
		print('single_item', single_item)
	### Traverse dictionary elements
	for first, second in phonebook.items():
		print('(Key, Value) = ({0}, {1})'.format(first, second), end = ' ')
		print('Key is', first, 'and value is', second)

### Notice total returns nothing, so the message printed will be 'None'
print(total(10, 1, 2, 3, Jack=1123, Johon=2231, Inge=1560))


### Indicate no content with keyword 'pass'
print('')
print('---Indicate no content with keyword \'pass\'---')
def nothing_func():
	pass
print(nothing_func())











### A flag to show the end of this Python script
print(' ')
print('-----------------------------------')
print('-- THIS IS THE END OF THE SCRIPT --')
print('-----------------------------------')
print('\n')