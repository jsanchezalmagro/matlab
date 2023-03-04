import numpy as np

class Diff_dec:

    def __init__(self, init):
        self.init = init

    def diff_dec(self, data_in):
        arr = np.array([1, 2, 3, 4, 5])
        self.init += 1.0
        return (arr+data_in)
