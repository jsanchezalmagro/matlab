import numpy as np

class Diff_enc:

    def __init__(self, base):
        self.base = float(base)
        
    def diff_enc(self, data_in):
        arr = np.array([1, 2, 3, 4, 5])
        return (arr+data_in)
