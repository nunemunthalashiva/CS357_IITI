function z=banana(x,y)
    z=100*(y-x^2)^2+(1-x)^2;
endfunction

function z=Hess(x1, x2)
    z = [[-400*(x2 - 3*x1*x1), -400*x1]; [-400*x1, 200]];
endfunction

x=linspace(-1,1,100);
y=linspace(-2,2,100);
z=feval(x,y,banana);

clf
contour(x,y,z,20);
title("Contour plot");

surf(x,y,z);
title("Surface Plot");

for i = 1 : length(x)
    for j = 1 : length(y)
        z1 = Hess(x(i), y(i));
        d = spec(z1);
  
        for i = 1:length(d)
            if d(i) < 0 then
                isConv = 0
            end
        end
    end
end

if isConv then
    printf("Its convex")
else
    printf("Not convex")
end
