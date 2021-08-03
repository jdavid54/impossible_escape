# hamming code

import numpy as np
# importing functools for reduce()
import functools
from operator import xor

# random blocks can be uncorrect coded blocks
bloc = np.random.randint(0,2,16)
locations_w_ones = [i for i, bit in enumerate(bloc) if bit]
print(bloc.reshape(4,4))
print(locations_w_ones)

def xor1(list):
    # List XOR
    # Using reduce() + lambda + "^" operator
    res = functools.reduce(lambda x, y: x ^ y, list)
    return res

def xor2(list):
    # List XOR
    # Using reduce() + operator.ixor
    res = functools.reduce(xor, list)
    return res
  
print('xor1 : error in ', xor1(locations_w_ones))
print('xor2 : error in' , xor2(locations_w_ones))

# correcting random block to make a correct coded block
error_at = xor2(locations_w_ones)
print('correcting error ....', error_at)
bloc[error_at] = not bloc[error_at]
print(bloc.reshape(4,4))

#correct_bloc = bloc
locations_w_ones = [i for i, bit in enumerate(bloc) if bit]
print(locations_w_ones)

# correct code blocks must return location zero
print('xor1 : error in ', xor1(locations_w_ones))