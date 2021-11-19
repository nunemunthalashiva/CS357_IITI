function f=func(x,y)
    f = 100*(y- x**2)**2  + (1-x)**2;
endfunction

x = linspace(-1,1,100);
y = linspace(-2,2,100);
z = feval(x,y,func);

clf

contour(x,y,z,20);
surf(x,y,z);
