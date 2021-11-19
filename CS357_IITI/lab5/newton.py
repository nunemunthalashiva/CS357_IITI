import numpy as np
def func(x):
    return (x[0])**2 + 2* ((x[1])**2) + 4*(x[0]) + 4*(x[1])

# return gradient vector
def gradient(x):
    temp = [2*x[0]+4 , 4*x[1] +4]
    return np.array(temp)

# return hessian inverse of func(x)
def hessian_inv(x):
    return np.array([[0.5 , 0],
                        [0,0.25]])

num_iter = 0
x=np.array([0,0])
while(gradient(x)[0]!=0 and gradient(x)[1]!=0):
    num_iter+=1
    x = x - np.dot(hessian_inv(x),gradient(x))

print("number of iterations is {}".format(num_iter))
print(x)
