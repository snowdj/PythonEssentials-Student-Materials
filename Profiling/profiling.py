# profiling.py
"""Python Essentials: Profiling.
<name>
<class>
<date>
"""

import numpy as np
from scipy import linalg as la


# Problem 1
def compare_timings(f, g, *args):
    """Compare the timings of 'f' and 'g' with arguments '*args'.

    Inputs:
        f (func): first function to compare.
        g (func): second function to compare.
        *args: arguments to use when callings functions 'f' and 'g',
            i.e., call f with f(*args).
    Returns:
        comparison (str): The comparison of the runtimes of functions
            'f' and 'g' in the following format:
                Timing for <f>: <time>
                Timing for <g>: <time>
    """
    raise NotImplementedError("Problem 1 Incomplete")


# Problem 2
def LU(A):
    """Return the LU decomposition of a square matrix."""
    n = A.shape[0]
    U = np.array(np.copy(A), dtype=float)
    L = np.eye(n)
    for i in range(1, n):
        for j in range(i):
            L[i,j] = U[i,j] / U[j,j]
            for k in range(j, n):
                U[i,k] -= L[i,j] * U[j,k]
    return L, U

def LU_opt(A):
    """Return the LU decomposition of a square matrix."""
    raise NotImplementedError("Problem 2 Incomplete")


# Problem 3
def mysum(x):
    """Return the sum of the elements of X without using a built-in function.

    Inputs:
        x (iterable): a list, set, 1-d NumPy array, or another iterable.
    """
    raise NotImplementedError("Problem 3 Incomplete")


# Problem 4
def fibonacci(n):
    """Yield the first n Fibonacci numbers."""
    raise NotImplementedError("Problem 4 Incomplete")


# Problem 5
def foo(n):
    my_list = []
    for i in range(n):
        num = np.random.randint(-9,9)
        my_list.append(num)
    evens = 0
    for j in range(n):
        if my_list[j] % 2 == 0:
            evens += my_list[j]
    return my_list, evens


# Problem 6
def pymatpow(X, power):
    """Return X^{power}, the matrix product XX...X, 'power' times.

    Inputs:
        X ((n,n) ndarray): A square matrix.
        power (int): The power to which to raise X.
    """
    prod = X.copy()
    temparr = np.empty_like(X[0])
    size = X.shape[0]
    for n in xrange(1, power):
        for i in xrange(size):
            for j in xrange(size):
                tot = 0.
                for k in xrange(size):
                    tot += prod[i,k] * X[k,j]
                temparr[j] = tot
            prod[i] = temparr
    return prod

def numba_matpow(X, power):
    raise NotImplementedError("Problem 6 Incomplete")


# Problem 7
def init_tridiag(n):
    """Construct a random nxn tridiagonal matrix A by diagonals.

    Inputs:
        n (int): The number of rows / columns of A.

    Returns:
        a ((n-1,) ndarray): first subdiagonal of A.
        b ((n,) ndarray): main diagonal of A.
        c ((n-1,) ndarray): first superdiagonal of A.
        A ((n,n) ndarray): the tridiagonal matrix.
    """
    a = np.random.random_integers(-9, 9, n-1).astype("float")
    b = np.random.random_integers(-9 ,9, n  ).astype("float")
    c = np.random.random_integers(-9, 9, n-1).astype("float")

    # Replace any zeros with ones.
    a[a==0] = 1
    b[b==0] = 1
    c[c==0] = 1

    # Construct the matrix A.
    A = np.zeros((b.size,b.size))
    np.fill_diagonal(A, b)
    np.fill_diagonal(A[1:,:-1], a)
    np.fill_diagonal(A[:-1,1:], c)

    return a, b, c, A

def pytridiag(a, b, c, d):
    """Solve the tridiagonal system Ax = d where A has diagonals a, b, and c.

    Inputs:
        a ((n-1,) ndarray): first subdiagonal of A.
        b ((n,) ndarray): main diagonal of A.
        c ((n-1,) ndarray): first superdiagonal of A.
        d ((n,) ndarray): the right side of the linear system.

    Returns:
        x ((n,) array): solution to the tridiagonal system Ax = d.
    """
    n = len(b)

    # Make copies so the original arrays remain unchanged.
    aa = np.copy(a)
    bb = np.copy(b)
    cc = np.copy(c)
    dd = np.copy(d)

    # Forward sweep.
    for i in xrange(1, n):
        temp = aa[i-1] / bb[i-1]
        bb[i] = bb[i] - temp*cc[i-1]
        dd[i] = dd[i] - temp*dd[i-1]

    # Back substitution.
    x = np.zeros_like(b)
    x[-1] = dd[-1] / bb[-1]
    for i in reversed(xrange(n-1)):
        x[i] = (dd[i] - cc[i]*x[i+1]) / bb[i]

    return x

def numba_tridiag(a, b, c, d):
    raise NotImplementedError("Problem 7 Incomplete")
