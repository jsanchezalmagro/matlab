import numpy as np

class Diff_dec:

    base = 0.0
    name = "casa"

    def __init__(self, base):
        Diff_dec.base = float(base)
        return

    def diff_dec(self, data_in):
        arr = np.array([1, 2, 3, 4, 5]) + Diff_dec.base
        print(Diff_dec.name)
        return (arr+data_in)*33.67
