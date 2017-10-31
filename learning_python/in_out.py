### Input & output


### Input from users
print('')
print('---Input from users---')
def reverse(text):
	return text[::-1]
	
def is_palindrome(text):
	return text == reverse(text)
	
something = input("Enter text: ")
print("The text you input is:", something)
if is_palindrome(something):
	print("Yes, it is a palindrome")
else:
	print("No, it is not a palindrome")
	

fsrc = ['C:\\Users\\Pyrad\\Desktop\\tmps\\learning_python\\poem.txt']
with open(str(fsrc)) as f:
	for line in f:
		print(line, end = '')