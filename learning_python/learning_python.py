import sys
import os
import pickle
from functools import reduce

### This script exits in github of Pyrad

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

fmt = '{0:15}${1:>6}'
# Output is: 'Registration    $    35'
# Field 0: left justify, pad to 15 chars
# Field 1: right justify(use '>'), pad to 6 chars
fmt.format('Registration', 35)

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
### DocString
print('')
print('---Self-defined functions---')
def print_max(a, b):
	### Here goes the DocString
	### the format of this DocString is
	### (1) Multiple lines
	### (2) First logical line of this function, begin with an UPPER case letter,
	###     and ends with '.'
	### (3) Second line is empty
	### (4) From third line on is the detail information
	### (5) Can be accessed by using <FUNC_NAME>.__doc__
	''' Prints the maximum of two numbers.
	
	The input must be integers.'''
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
print('The DocString of print_max is')
print(print_max.__doc__)

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



### Modules
print('')
print('---Modules---')
print('The command line arguments are:')
### First argument is sys.argv[0], which is the name of this script
for i in sys.argv:
	print(i)
print('\n\nThe PYTHONPATH is', sys.path, '\n')
print('Current Working Directory:', os.getcwd())
# The output would be,
#The PYTHONPATH is
#['C:\\Users\\Pyrad\\Desktop\\tmps',
# 'C:\\Python36\\python36.zip',
# 'C:\\Python36\\DLLs',
# 'C:\\Python36\\lib',
# 'C:\\Python36',
# 'C:\\Python36\\lib\\site-packages' ]


### Import a user-defined module
# This will execute the module once
# Every module has its attribute '__name__'
print('')
print('---Import a user-defined module---')
import customized_module
customized_module.run()
print('Version of module customized_module is:', customized_module.__version__)

from another_customized_module import test_run, __version__
test_run()#Now this run function comes from another_customized_module
print('Version of module customized_module is:', __version__)


### dir() function
print('')
print('---Function: dir()---')
print('All attribute names in module \'sys\'')
print(dir(sys))

print('\nAll attribute & variable names in currnet module')
print(dir())

# Add a temp variable
a_temp_var = 5
print('\nAll attribute & variable names in currnet module')
print(dir())## Notice now 'a_temp_var' is added
# Remove the temp variable
del a_temp_var
print('\nAll attribute & variable names in currnet module')
print(dir())## Notice now 'a_temp_var' is removed




### Package
# A package is some module file together with a file named "__init__.py", all in one directory
# A exmaple structure of a package

#	- <some folder present in the sys.path>/
#		- world/
#			- __init__.py
#			- asia/
#				- __init__.py
#				- india/
#					- __init__.py
#					- foo.py
#			- africa/
#				- __init__.py
#				- madagascar/
#					- __init__.py
#					- bar.py



### Data structure 1 -> List
print('')
print('---Data Structure: List---')
shopping_list = ['apple', 'mango', 'carrot', 'banana']
print('I have', len(shopping_list), 'items to purchase')
print('These items are:')
idx = 0
for item in shopping_list:
	idx = idx + 1;
	print('[{0}]'.format(idx), item)

print('\nAnother item to buy is rice')
shopping_list.append('rice')

print('My shopping_list now is:', shopping_list)
shopping_list.sort()
print('After sorting', shopping_list)

print('The first item to buy is', shopping_list[0])
olditem = shopping_list[0]
del shopping_list[0]
print('I\'ve already bought item: ', olditem)
print('My shopping_list now is:', shopping_list)

### Data structure 2 -> Tuple
print('')
print('---Data Structure: Tuple---')
zoo = ('python', 'elephant', 'penguin')
print('Number of animals in the zoo is', len(zoo))
# Though braces are optional
# better to add to specify a tuple explicitly
new_zoo = 'monkey', 'camel', zoo
print('Number of cages in the new zoo is', len(new_zoo))
print('All animals in new zoo are:')
print('-->', new_zoo)
print('Animals brought from old zoo are', new_zoo[2])
print('Last animals brought from old zoo is', new_zoo[2][2])
print('Number of animals in the new zoo is', len(new_zoo) - 1 + len(new_zoo[2]))
# del zoo[2] --> cause error since tuple doesn't support deletion

### Data structure 3 -> Dict
print('')
print('---Data Structure: Dict---')
address_book = {
	'Swaroop': 'swaroop@swaroopch.com',
	'Larry': 'larry@wall.org',
	'Matsumoto': 'matz@ruby-lang.org',
	'Spammer': 'spammer@hotmail.com'
}
print('All contacts(Total {}):'.format(len(address_book)))
for name, address in address_book.items():
	print(' [Contact] {}, [Address] {}'.format(name, address))
print("Swaroop's address is:", address_book['Swaroop'])
del address_book['Spammer']
print('There are {} contacts left after deleting Spammer'.format(len(address_book)))

address_book['Guido'] = 'guido@python.org'
if 'Guido' in address_book:
	print("Guido's address is", address_book['Guido'])
else:
	print("Guido's address is not in contact list")

new_people='Jim.Green'
address_book[new_people] = 'jgreen@python.org'
if new_people in address_book:
	print("{}'s address is".format(new_people), address_book['Guido'])
else:
	print("{}'s address is not in contact list".format(new_people))
	
print('Delete contact {}'.format(new_people))
del address_book[new_people]
if new_people not in address_book:
	print('{} is not in address_book after deletion'.format(new_people))


### Data structure 4 -> Set
print('')
print('---Data Structure: Set---')
bri = set(['brazil', 'russia', 'india'])
if 'india' in bri:
	print("india is in the set 'bri'")
else:
	print("india is not in the set 'bri'")
if 'usa' in bri:
	print("usa is in the set 'bri'")
else:
	print("usa is not in the set 'bri'")
bric = bri.copy()
bric.add('china')
if bric.issuperset(bri) == True:
	print("'bric' is super set of 'bri'")
else:
	print("'bric' is NOT super set of 'bri'")
bri.remove('russia')
print(bri & bric)
print(bri.intersection(bric))





### Sequence operations
print('')
print('---Sequence operations---')
shoplist = ['apple', 'mango', 'carrot', 'banana']
name = 'swaroop'
print('Item 0 is', shoplist[0])
print('Item 1 is', shoplist[1])
print('Item 2 is', shoplist[2])
print('Item 3 is', shoplist[3])
print('Item -1 is', shoplist[-1])
print('Item -2 is', shoplist[-2])
print('Character 0 is', name[0])
# Slicing on a list
# Notice, like behaviors in C++ library
# range is [start, end), which is semi open semi closed interval
print('Item 1 to 3 is', shoplist[1:3])
print('Item 2 to end is', shoplist[2:])
print('Item 1 to -1 is', shoplist[1:-1])
print('Item start to end is', shoplist[:])
print('Item start to end(excluded)is', shoplist[:-1])
# slice from a string
print('characters 1 to 3 is', name[1:3])
print('characters 2 to end is', name[2:])
print('characters 1 to -1 is', name[1:-1])
print('characters start to end is', name[:])

# Specify a step
shoplist = ['apple', 'mango', 'carrot', 'banana', 'orange', 'pear', 'grape', 'peach', 'kiwi', 'avocado']
print(shoplist[::1])
print(shoplist[0:-1:2])





### Simple Assignment
print('')
print('---Simple Assignment---')
shoplist = ['apple', 'mango', 'carrot', 'banana']
# mylist is a reference to shoplist
mylist = shoplist
# delete one element in the list
del shoplist[0]
print('shoplist is', shoplist)
print('mylist is', mylist) # same result as shoplist
print('Copy by making a full slice')
mylist = shoplist[:]
# delete one element in original list
del shoplist[0]
print('shoplist is', shoplist)
print('mylist is', mylist) # different from shoplist since it's a copy


# Operations in string
print('')
print('---Operations in string---')
name = 'Swaroop'
if name.startswith('Swa'):
	print("Yes, the string starts with 'Swa'")
	
if 'a' in name:
	print("Yes, it contains the string 'a'")

if name.find('war') != -1:
	print("Yes, it contains the string 'war'")
delimiter = '_*_'
mylist = ['Brazil', 'Russia', 'India', 'China']
print(delimiter.join(mylist))



# Class
print('')
print('---Class---')
class Person:
	def __init__(self, name):
		self.name = name
	def say_hi(self):
		print('Hello, my name is', self.name)

p = Person('Swaroop')
print(p) # <__main__.Person object at 0x00000000025C9EF0>
p.say_hi()


class Robot:
	'''This is a robot with a name'''
	
	population = 0
	__ancestor = "ZEUS" # A private class member, with '__' as prefix
	
	def __init__(self, name):
		''' Initialize data'''
		self.name = name
		print("(Initializing {})".format(self.name))
		Robot.population += 1
		
	def die(self):
		'''Destroy a robot'''
		print("{} is being destroyed!".format(self.name))
		Robot.population -= 1
		if Robot.population == 0:
			print("{} was the last one".format(self.name))
		else:
			print("There are still {:d} robots working.".format(Robot.population))

	def say_hi(self):
		''' Sincere greetings from robot
		
		No problem you could do it'''
		print("Greetings, my masters call me {}".format(self.name))
		
	@classmethod
	def how_many(cls):
		''' Print current population'''
		print("We have {:d} robots.".format(cls.population))

print('')
droid1 = Robot("R2-D2")
droid1.say_hi()
Robot.how_many()
droid1.__class__.how_many() # Use __class__ to access classmethod

droid2 = Robot("C-3PO")
droid2.say_hi()
Robot.how_many()
droid2.__class__.how_many() # Use __class__ to access classmethod

print("\nRobots can do some work here.\n")
print("Robots have finished their work. So let's destroy them.")
droid1.die()
droid2.die()
Robot.how_many()




# Inheritence of classes
print('')
print('---Inheritence of classes---')
class SchoolMember:
	''' Represent a member in school '''
	def __init__(self, name, age):
		self.name = name
		self.age = age
		print('(Initialized SchoolMember: {})'.format(self.name))
		
	def tell(self):
		''' Tell me about details '''
		print('Name: "{}" Age: "{}"'.format(self.name, self.age))

class Teacher(SchoolMember):
	''' Represent a teacher in school '''
	### (1)If __init__ method in a child class is NOT defined
	###    __init__ method of parent class will be called automatically
	### (3)If __init__ method in a child class is defined
	###    __init__ method in parent class should be called explicitly in child classes
	###    since it will NOT be called automatically
	def __init__(self, name, age, salary):
		SchoolMember.__init__(self, name, age)
		self.salary = salary
		print('(Initialized Teacher: {})'.format(self.name))
		
	def tell(self):
		SchoolMember.tell(self)
		print('Salary: "{:d}"'.format(self.salary))

class Student(SchoolMember):
	''' Represent a student in school '''
	def __init__(self, name, age, marks):
		SchoolMember.__init__(self, name, age)
		self.marks = marks
		print('(Initialized Student: {})'.format(self.name))
		
	def tell(self):
		SchoolMember.tell(self)
		print('Marks: "{:d}"'.format(self.marks))

t = Teacher('Mrs. Schrividya', 40, 30000)
s = Student('Swaroop', 25, 75)

# Print a blank line
print()

for member in [t, s]:
	member.tell()




### Input & output

## Files
print('')
print('---Files---')

poem_text = '''\
(This is a temp file, which could be removed at will by Long Cai)
Programming is func_name
When the work is done
if you wanna make your work also fun:
	use Python!
'''

### File should be created outside 'C:\\' since no permission
f = open('D:\\VirtualMachineShare\\poem.txt', mode='w')
f.write(poem_text)
f.close()

f = open('D:\\VirtualMachineShare\\poem.txt') ## default is 'r', which refers to read mode
lcnt = 0
while True:
	line = f.readline()
	if len(line) == 0:
		break
	lcnt += 1 ### "lnct++" is C-like method, which is not applied to Python !!!
	print(line, end='')
f.close()


## Pickle
print('')
print('---Pickle operations---')

shoplistfile = 'D:\\VirtualMachineShare\\shoplist.data'
shoplist = ['apple', 'mango', 'carrot']

f = open(shoplistfile, mode='wb')
### Use pickle to dump a object to a file for further use
pickle.dump(shoplist, f)
del shoplist

# Read back from the storage
f = open(shoplistfile, 'rb')
# Use pickle to re-load the object from the file
storedlst = pickle.load(f)
print(storedlst)




## Exceptions
print('')
print('---Exceptions---')

class stringLengthException(Exception):
	''' A customized exception '''
	def __init__(self, length, atleast):
		Exception.__init__(self)
		self.length = length
		self.atleast = atleast

# Use a fixed string instead of inputing
a_test_string = 'Good day today!'
try:
	text = a_test_string
	if len(text) < 3:
		raise stringLengthException(len(text), 3)
	elif len(text) < 10:
		raise stringLengthException(len(text), 10)
	else:
		raise stringLengthException(len(text), 100)
except stringLengthException as ex:
	print('stringLengthException: The input was {} long, except at least {}'.format(ex.length, ex.atleast))
else:
	# the else block of try statement will be executed if no exceptions thrown
	print('You entered {}'.format(text))
finally:
	# the finally block of try statement will be executed no matter exceptions thrown or not
	print('Insist doing something')




## Passing tuples
print('')
print('---Passing tuples---')

def return_a_tuple():
	return (2, 'details')

first_res, second_res = return_a_tuple()
print('First results returned is {0} and the second is {1}'.format(first_res, second_res))




## The quickest way to swap 2 values in Python
print('')
print('---The quickest way to swap 2 values in Python---')

first_var = 5
second_var = 8
print('Before swap, the first variable is {0} and the second variable is {1}'.format(first_var, second_var))
first_var, second_var = second_var, first_var
print('After swap, the first variable is {0} and the second variable is {1}'.format(first_var, second_var))





## Specail methods in a python class
print('')
print('---Specail methods in a python class---')
class pronghorn:
	def __init__(self, value):
		self.m_value = value
		print("This is the __init__ method of class 'pronghorn'")

	def __del__(self):
		print("This is the __del__ method of class 'pronghorn'")
	
	def __str__(self):
		print("This is the __str__ method of class 'pronghorn'")
	
	def __lt__(self, other):
		print("This is the __lt__ method of class 'pronghorn'")
		return self.m_value < other.m_value
	
	def __gt__(self, other):
		print("This is the __gt__ method of class 'pronghorn'")
		return self.m_value > other.m_value
	
	def __le__(self, other):
		print("This is the __le__ method of class 'pronghorn'")
		return self.m_value <= other.m_value
	
	def __ge__(self, other):
		print("This is the __ge__ method of class 'pronghorn'")
		return self.m_value >= other.m_value
	
	def __eq__(self, other):
		print("This is the __eq__ method of class 'pronghorn'")
		return self.m_value == other.m_value
	
	def __cmp__(src, dst):
		print("This is the __cmp__ method of class 'pronghorn'")
		
	def __len__(self):
		print("This is the __len__ method of class 'pronghorn'")
	
	def __getitem__(self, key):
		print("This is the __getitem__ method of class 'pronghorn'")



print("Initialize 'phg_1'...")
phg_1 = pronghorn(5)
print()

print("Initialize 'phg_2'...")
phg_2 = pronghorn(3)
print()

print("Comparing 'phg_1' and 'phg_2'...")
result = phg_1 == phg_2
print("phg_1 equals phg_2 ?", result)
print()

print("Comparing 'phg_1' and 'phg_2'...")
result = phg_1 > phg_2
print("phg_1 is greater than phg_2 ?", result)
print()

print("Comparing 'phg_1' and 'phg_2'...")
result = phg_1 <= phg_2
print("phg_1 is less than or equal to phg_2 ?", result)
print()



## Lamda Expression
print('')
print('---Lamda Expression---')
foo = [2, 18, 9, 22, 17, 24, 8, 12, 27]

### Get numbers of multiple of 3
# in python 2.x could be --> print(filter(lambda x: x % 3 == 0, foo))
filterObject = filter(lambda x: x % 3 == 0, foo)
flist = [item for item in filterObject] ### List Comprehension
print(flist)

### Simialr to filter operation above
print([item for item in map(lambda x: x * 2 + 10, foo)])

### Need to do import operation --> from functools import reduce
## reduce returns an integer
print(reduce(lambda x, y: x + y, foo))


points = [{'x': 2, 'y': 3}, {'x': 4, 'y': 1}]
points.sort(key = lambda i: i['y'])
print(points)



## List Comprehension
print('')
print('---List Comprehension---')

listone = [2, 3, 4]
listtwo = [2 * i for i in listone if i > 2]
print(listtwo)



## Variable-length arguments
print('')
print('---Variable-length arguments---')
def powerSum(power, *args):
	''' Return the sum of each argument raised to the specified power '''
	res = 0
	for i in args:
		res += pow(i, power)
	return res

print("Variable-length arguments -> passing tuple")
print(powerSum(2, 5, 6))
print(powerSum(2, 10))
todo_list = [2, 4, 6, 8]
print(powerSum(*todo_list))


def printDict(**dictArgs):
	for key in dictArgs:
		print("Key {0} --> Value {1}".format(key, dictArgs[key]))

print("Variable-length arguments -> passing dict")
myDict = {'Monday': 10, 'Tuesday': 30, 'Friday': 90}
printDict(**myDict)

## Assert statement
assert len(todo_list) >= 1






### A flag to show the end of this Python script
print(' ')
print('-----------------------------------')
print('-- THIS IS THE END OF THE SCRIPT --')
print('-----------------------------------')
print('\n')