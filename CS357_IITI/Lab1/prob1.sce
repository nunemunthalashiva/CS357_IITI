x = input("Enter starting num");
tolerance = 10^(-7);
num_iter=0;
dx=1; // some random value
f = x^3 + 3*x +1
while(dx> tolerance | abs(f) >tolerance & num_iter<100)
    num_iter=num_iter+1
    derivative_func = 3*(x^2) +3
    xnew=x-(f/derivative_func)
    dx=abs(x-xnew)
    x=xnew
    f=x^3 + 3*x +1
    printf('%3i %12.9f %12.9f %12.9f\n',num_iter,x,dx,f)
end
