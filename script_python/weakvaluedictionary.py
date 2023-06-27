from weakref import WeakValueDictionary

class Foo(object):
    """
    A simple class which acts as a value object
    """

    def __repr__(self):
        """
        For print use
        """
        return ">>> A Foo object <<<"

def show_weakvaluedictionary():
    """
    The code in this function shows different output
    when executed in an interactive shell and when
    executed as a script
    """
    f = Foo()
    wvd = WeakValueDictionary()
    wvd['f'] = f

    # Now wvd has a value
    print(dict(wvd))

    # Delete the f object
    del f

    # Now wvd should have no reference to f object any more
    # But it's up to the garbage collector to decide when
    # to recycle this deleted object
    print(dict(wvd))


if __name__ == "__main__":
    show_weakvaluedictionary()

