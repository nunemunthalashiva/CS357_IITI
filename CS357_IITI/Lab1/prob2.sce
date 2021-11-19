x = input("Enter starting num")
tolerance = 10^(-7)
num_iter=0
dx=1
//% function is cos(x)-3x derivative = -sin(x) -3
f = cos(x) - 3*x
while(dx> tolerance | abs(f) >tolerance)
    num_iter=num_iter+1
    derivative_func = -sin(x) -3
    xnew=x-(f/derivative_func)
    dx=abs(x-xnew)
    x=xnew
    f=cos(x) - 3*x
    printf('%3i %12.9f %12.9f %12.9f\n',num_iter,x,dx,f)
end
