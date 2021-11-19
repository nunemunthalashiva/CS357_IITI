//function to calculate banana value
function f=funcval(x)
    f = 100*(x(2)-x(1)^2)^2+(1-x(1))^2;
endfunction

//function to calculate gradient at point x
function g=gradient(x)
    g(1)=-400*x(1)*x(2)+400*x(1)^3+2*x(1)-2;
    g(2)=200*x(2)-200*x(1)^2;
endfunction

//function to calculate hessian of function at point x
function h=hessian(x)
    h(1,1)=-400*x(2)+1200*x(1)^2+2;
    h(1,2)=-400*x(1);
    h(2,1)=-400*x(1);
    h(2,2)=200;
endfunction

//one dimensional function value (for dichotomous)
function f = func(a,b,c,d,x)
    f = 100*((c+d*x)-(a+b*x)^2)^2+(1-(a+b*x))^2;
endfunction

//dichotomous function for one dimensional minimization
function X = dichotomous(a,b,c,d,xl0,xu0)
 k = 0; 
 xl = xl0; 
 xu = xu0;
 interval = xu - xl;
 uncertainty = 10^-5;
 
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

 disp('-------------------Dichotomous------------------------')
 disp('Value of alpha:')
 X = (xl + xu)/2
 disp(X)
 disp('Minimum function value at alpha:')
 F = func(a,b,c,d,X)
 disp(F)
 disp('Number of iterations of dichotomous:')
 disp(k)
 disp('------------------------End---------------------------')
endfunction



//main program
iter=3;

x0=[-2 1];
for i=1 : iter
    disp('Iteration Number:')
    disp(i)
    g=-1*gradient(x0);
    disp('Gradient of the function is ')
    disp(g)
    h=hessian(x0);
    disp('Hessian of the function is ')
    disp(h)
    inverse=inv(h);
    disp('Inverse of hessian is ')
    disp(inverse)
    p=inverse*g
    a=x0(1);
    b=p(1);
    c=x0(2);
    d=p(2);
    alpha = dichotomous(a,b,c,d,-10,10);
    x0=x0+alpha*p';
    disp('Next point is:')
    disp(x0)
    f=funcval(x0);
    disp('Functioin value at x')
    disp(f)
end

