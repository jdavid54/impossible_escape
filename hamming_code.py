# hamming code

import numpy as np
# importing functools for reduce()
import functools
from operator import xor

# block n x n, n must be power of 2 ??
n = 4
digits = int(np.log2(n**2))

# random blocks can be uncorrect coded blocks
bloc = np.random.randint(0,2,n**2)
locations_w_ones = [i for i, bit in enumerate(bloc) if bit]
# binary 
bin_locations = [bin(i).replace("0b", "").zfill(digits)  for i, bit in enumerate(bloc) if bit]
print(bin_locations)

print(bloc.reshape(n,n))
print(locations_w_ones)


# xor all the list, as "xor 1" twice gives back initial value,
# xoring a list gives the parity of numbers of ones in that list
def xor1(list):
    # List XOR
    # Using reduce() + lambda + "^" operator
    res = functools.reduce(lambda x, y: x ^ y, list)
    return res

def xor2(list):
    # List XOR
    # Using reduce() + operator.xor
    res = functools.reduce(xor, list)
    return res

# here we "xor" a list of case addresses. xor operates in binary
# if an address is in binary form a d-digit form, for 8x8 grid, we have a 6-digit number as log2(8*8) = 6
# xoring all the locations with 1 will give the address of the error case
# error case = 0 means no code error
print('xor1 : error in ', xor1(locations_w_ones))
print('xor2 : error in' , xor2(locations_w_ones))

# correcting random block to make a correct coded block
error_at = xor2(locations_w_ones)
print('correcting error ....', error_at)
bloc[error_at] = not bloc[error_at]
print(bloc.reshape(n,n))

#correct_bloc = bloc
locations_w_ones = [i for i, bit in enumerate(bloc) if bit]
print(locations_w_ones)

# correct code blocks must return location zero
print('xor1 : error in ', xor1(locations_w_ones))