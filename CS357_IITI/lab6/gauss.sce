function z=f(x)
    z= ( x(1)^2 + (x(2)^2) -1 )^(2) + ( x(1) + x(2) -1 )^(2);
endfunction

function z=newf(x)
    z1 = x(1)^2 + (x(2)^2) -1;
    z2 =  x(1) + x(2) -1 ;
    z=[z1;z2] ;
endfunction

function z=jac(x)
    f11=2*x(1);
    f12=1;
    f21=2*x(2);
    f22=1;
    z= [ f11 , f12 ; f21 , f22 ];
endfunction

function z=gradient(x)
    t1=jac(x);
    z = 2 * t1' * newf(x) ;
endfunction

function z=hessian(x)
    t1=jac(x);
    z= 2 * t1' * t1;
endfunction

function z=q(x)
    z=(-0.001)*((hessian(x))^(-1))*gradient(x);
endfunction

function z=diff(x1,x2)
    z= (f(x1)-f(x2))^2;
endfunction

x=[4;4];

t=q(x);
num_iter=0;
while(diff(x+t,x) > 0.000001)
    t=q(x);
    x= x + t;
    num_iter=num_iter+1
    //disp(string(x(1))+" "+string(x(2)));
end
disp(string(x(1))+" "+string(x(2))+" "+string(num_iter))
