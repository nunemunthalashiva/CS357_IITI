function lab4a2(x)
    function z=f(x)
        z = (x(1)-4*x(2))^2 + 12*(x(3)-x(4))^2 + 3*(x(2)-10*x(3))^2 + 55*(x(1)-2*x(4))^2
     endfunction
      
    function z= grad(x)
        fx1 = 112*x(1) - 8*x(2)  -220*x(4)
        fx2 = 38*x(2) -8*x(1) -60*x(3)
        fx3 = 624*x(3) -24*x(4) -60*x(2)
        fx4 = 464*x(4) -24*x(3) -220*x(1)
        z=[fx1;fx2;fx3;fx4]
    endfunction
    
    function z= hessian()
        z =[112,-8,0,-220;
            -8,38,-60,0;
            0,-60,624,-24;
            -220,0,-24,464]
    endfunction
    
    
    function z = step_length(x)
        s = -grad(x)
        lambda = (s'*s)/(s'*hessian()*s)
        z = [x(1)+lambda*s(1);x(2)+lambda*s(2);x(3) + lambda*s(3);x(4)+lambda*s(4)]
    endfunction
    
    i=0;
    disp("Initial values"+string(x(1))+" "+string(x(2))+" "+string(x(3))+" "+string(x(4)));
    eps = 10^(-6)
    x_new =[0;0;0;0] //just declare some x_new
    while(norm(x-x_new)>=eps)
       x_new=x;
       x = step_length(x);
      
       i=i+1;
    end
    disp("Taken number of iterations " + string(i)+" "+ string(x(1))+" " +string(x(2))+" "+ string(x(3))+" "+ string(x(4)) );
    
endfunction
