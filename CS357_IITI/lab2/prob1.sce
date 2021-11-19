function integration_trepizoid(low,high,num_sub)
    difference = (high-low)/num_sub
    x=[low:difference:high]
    func=exp(2*x)
    integral = 0
    left_approx=0
    right_approx=0
    for i=1:num_sub
        integral=integral + (func(i)+func(i+1))*difference/2
        left_approx=left_approx + func(i)*difference
        right_approx=right_approx + func(i+1)*difference
    end
    printf('Trapezoidal approximation integral is =%f left_approx=%f ,right_approx=%f',integral,left_approx,right_approx)  
    
    
endfunction

function simpson(low,high,num_sub)
    difference = (high-low)/num_sub
    x=[low:difference:high]
    func=exp(2*x)
    integral = 0
    integral=func(1)+func(num_sub)
    for i=2:num_sub-1
        if modulo(i,2)==0
            integral = integral + 2*(func(i))
         else
            integral = integral + 4*(func(i))
         end
    end
    printf('Using simpson approximation we get %f',integral*difference/3)
endfunction

