function X = Quadratic(a,b,c,d,x1,x3)
 
 xb0 = 1e99;  k = 0; e= 10^-5 ;
 x2 = (x1 + x3)/2; 
 f1 = func(a,b,c,d,x1); f2 = func(a,b,c,d,x2); f3 = func(a,b,c,d,x3);
 z1 = (x2 - x3)*f1;   z2 = (x3 - x1)*f2;   z3 = (x1 - x2)*f3;
 z4 = (x2 + x3)*z1+(x3 + x1)*z2+(x1 + x2)*z3;
 xb = z4/(2*(z1 + z2 + z3));
 fbar = func(a,b,c,d,xb);
 d1 = abs(xb0 - xb);


 while d1 > e,
    if x1 < xb & xb < x2,
       if fbar <= f2,
         x3 = x2; f3 = f2;
         x2 = xb; f2 = fbar;
else
         x1 = xb; f1 = fbar;
       end
     elseif x2 < xb & xb < x3,
       if fbar <= f2,
          x1 = x2; f1 = f2;
          x2 = xb; f2 = fbar;
       else 
          x3 = xb; f3 = fbar;
       end
   end
   xb0 = xb;
  
   z1 = (x2 - x3)*f1; z2 = (x3 - x1)*f2; z3 = (x1 - x2)*f3;
   
   z4 = (x2 + x3)*z1 + (x3 + x1)*z2 + (x1 + x2)*z3;
   
   xb = z4/(2*(z1 + z2 + z3));
   fbar = func(a,b,c,d,xb);
   d1 = abs(xb0 - xb);
   k = k+1;
 end
 
endfunction
 

