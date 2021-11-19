// given function
function f=funcval(x)
    f = x(1)^2 + 4*x(1)+2*(x(2)^2) + 4*x(2);
endfunction

// calculating gradient of given function
function g=gradient(x)
    g(1)=2*x(1)+4;
    g(2)=4*x(2)+4;
endfunction



//one dimensional function value (for dichotomous)
function f = func(a,b,c,d,x)
    f = (a+b*x)^2 + 4*(a+b*x) + 2*(c+d*x)^2 + 4*(c+d*x);
endfunction

//dichotomous function for one dimensional minimization
function X = dichotomous(a,b,c,d,xl0,xu0)
 k = 0; xl = xl0; xu = xu0;
 interval = xu - xl;uncertainty = 10^-5;
 
 while interval > uncertainty,
   x1 = (xl + xu)/2;
   e  = interval*0.001;
   xa = x1 - e;
   xb = x1 + e;
   fa = func(a,b,c,d,xa);
   fb = func(a,b,c,d,xb);
   if fa < fb,
      xu = xb;
   elseif fa > fb,
      xl = xa;
   else
      xl = xa;
      xu = xb;
   end
   interval = xu - xl;
   k = k + 1;
 end
 X = (xl + xu)/2
 F = func(a,b,c,d,X)
endfunction



//main program
iter=5;

x0=[0 0];
for i=1 : iter
    disp('Iteration Number:')
    disp(i)
    g= -1*gradient(x0);
    a=x0(1);
    b=g(1);
    c=x0(2);
    d=g(2);
    alpha = dichotomous(a,b,c,d,-10,10);
    x0=x0+alpha*g';
    disp('Value of x')
    disp(x0)
    f=funcval(x0);
    disp('Functioin value at x')
    disp(f)
end
