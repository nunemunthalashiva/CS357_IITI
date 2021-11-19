function newton(x)
    function z = f(x1,x2)
        z= x1^2 + 2*x2^2 + 4*x1 + 4*x2
    endfunction
    
    // return gradient
    function z = grad(x)
        fx1 = 2*x(1) +4
        fx2 = 4*x(2) + 4
        z = [fx1 ;fx2]
    endfunction
    
    // return hessian inverse
    function z = hessian_inv()
        z = [0.5,0;0,0.25]
    endfunction
    
    x=[0;0]
    i=0
    while(grad(x)(1)~=0 && grad(x)(2)~=0)
        i=i+1
        x = x - hessian_inv() * grad(x)
    end
    printf("Num iterations = " + string(i) +" x= "+ string(x(1)) +" "+string(x(2)) ) 
endfunction
