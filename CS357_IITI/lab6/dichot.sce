function dichot()
    low=6;
    high=9.9;
    function z = f(x)
        z = (log(x-2))^2 + (log(10-x))^2 - x^(0.2);
    endfunction
    
    epsilon = 10^(-7);
    num_iter = 0
    while(high-low > 10^(-5))
        mid = (low+high)/2;
        temp1=mid-epsilon;
        temp2=mid+epsilon;
        if(f(temp1)<f(temp2)) then
            high = temp2;
         else
             low=temp1;
         end;
         num_iter=num_iter+1;
     end;
     
     printf("Num iterations is %d\n",num_iter)
     printf("x = %f",(high+low)/2)
            
endfunction

