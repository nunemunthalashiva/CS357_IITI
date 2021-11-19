x = input("Enter starting num ");
tolerance = 10^(-4);
num_iter=0;
dx=1; // some random value
f = x^3 - 3*x*x + 2*x
while((dx> tolerance | abs(f) >10^(-5)) & num_iter<10)
    num_iter=num_iter+1
    derivative_func = 3*(x^2) +6*x +2
    xnew=x-(f/derivative_func)
    dx=abs(x-xnew)
    x=xnew
    f = x^3 - 3*x*x + 2*x
    printf('%3i %12.4f %12.9f\n',num_iter,x,f)
end
