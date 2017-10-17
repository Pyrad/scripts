def test_run():
	print('This is a normal function from a module')
__version__ = '0.1'

def customized_module_auto_run_test():
	if __name__ == '__main__':
		print('This program is being run by itself')
	else:
		print('I am being imported from another module')

customized_module_auto_run_test()