from random import randint
import timeit

def binary_contains(index: int = [], target: int = 0 ) -> bool:
    low: int = 0
    high: int = len(index) - 1
    while low <= high: #solange es noch einen Suchraum gibt
        mid: int = (low + high) // 2
        if index[mid] < target:
            low = mid + 1
        elif index[mid] > target:
            high = mid - 1
        else:
            return True
    return False

def linear_contains(index: int = [], target: int = 0 ) -> bool:
    for i in index:
        if i == target:
            return True
    return False

def random_numer(low: int = 0, high: int = 1000000):
    return randint(low, high)

index: int = []
for i in range(0, 1000000):
    index.append(i)

if __name__ == "__main__":
    result_bc = round(timeit.timeit('binary_contains(index, random_numer())',globals=globals(), number=2000),2)
    result_lc = round(timeit.timeit('linear_contains(index, random_numer())',globals=globals(), number=2000),2)
    print("Binary search duration: " + str(result_bc))
    print("Linear search duration: " + str(result_lc))
    print("Binary search is " + str(round((result_lc/result_bc),2)) + " times faster than linear search")