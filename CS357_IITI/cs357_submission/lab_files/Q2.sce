// for sake of simplicity lets assume x=[p;r] 

function newton(x)
    
    // caluclating function value at given point
    function z = f(x1,x2)
        z= x(1)^4 + 2*(x(1)^2)*(x(2)^2) + x(2)^4;
    endfunction
    
    // returning gradient at given point
    function z = grad(x)
        fx1 = 4*(x(1)^2 + x(2)^2)*x(1)
        fx2 = 4*(x(1)^2 + x(2)^2)*x(2)
        z = [fx1 ;fx2]
    endfunction
    
    // return hessian inverse
    function z = hessian(x)
        z = [8*(x(1)^2)+x(2)^2 ,8*x(1)*x(2);8*x(1)*x(2) ,8*(x(2)^2)+x(1)^2]
    endfunction
    
    
    num_iter=0
    while(grad(x)(1)~=0 && grad(x)(2)~=0)
        num_iter=num_iter+1
        x = x - inv(hessian(x)) * grad(x)
    end
    printf("Num iterations = " + string(num_iter) +" x= "+ string(x(1)) +" "+string(x(2)) + "function value=" + string(f(x(1),x(2))) ) 
endfunction
