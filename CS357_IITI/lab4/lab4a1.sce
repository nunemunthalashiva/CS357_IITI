function lab4a1(x1,x2)
    function z=f(x)
        z = 100*(x(2)-x(1))^2 + (1-x(1))^2
    endfunction
    function z= grad(x)
        fx1 = -200*(x(2)-x(1)) -2*(1-x(1))
        fx2 = 200*(x(2)-x(1))
        z=[fx1;fx2]
    endfunction
    
    function z= hessian()
        z = [202,-200;-200,200]
    endfunction
    
    function z = step_length(x)
        s = -grad(x)
        lambda = (s'*s)/(s'*hessian()*s)
        z = [x(1)+lambda*s(1);x(2)+lambda*x(2)]
    endfunction
    
    
    x=[x1,x2];
    i=1;
    disp("Initial values"+string(x(1))+" "+string(x2)+ " "+ string(f(x)));
    
    while(i<=3)
       x = step_length(x);
       disp(string(x(1))+" "+string(x(2))+" "+string(f(x)));
       i=i+1;
    end
    //disp(string(x(1))+" "+string(x(2)) + " "+string(f(x)));
    
endfunction

function func(x,n)
    i=1;
    while(i<=n)
        lab4a1(x(i,1),x(i,2));
        i=i+1;
    end
endfunction
