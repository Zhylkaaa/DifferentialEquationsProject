function acoustic_wave_equasion(n)
B = sparse(n, n);
L = zeros(n, 1);

xs = 0:(2/(n-1)):2;

B(1,1) = 1;

a = 2;
g = 1;
sn = zeros(n, 1);

for i = 2:n
    sn(i) = sin(xs(i))/(cos(2)-sin(2));
    
    if(i ~= n)
        B(i, i) = (1 - (xs(i)^2 + xs(i)*xs(i-1) + xs(i-1)^2) / 3 + xs(i-1)*(xs(i)+xs(i-1)) - (xs(i-1)^2))/(xs(i) - xs(i-1)) + (1 - xs(i+1)^2 + xs(i+1)*(xs(i+1)+xs(i)) - (xs(i+1)^2 + xs(i+1)*xs(i) + xs(i)^2)/3)/(xs(i+1)-xs(i));
        L(i) = a * (xs(i+1) - xs(i-1)) / 2;
    else
        B(i, i) = -1 + (1 - (xs(i)^2 + xs(i)*xs(i-1) + xs(i-1)^2) / 3 + xs(i-1)*(xs(i)+xs(i-1)) - (xs(i-1)^2))/(xs(i) - xs(i-1));
        L(i) = a * (xs(i) - xs(i-1)) / 2 + g;
    end
    
    if(i > 2)
        B(i-1, i) = (-1 - xs(i)*(xs(i)+xs(i-1))/2 + xs(i-1)*xs(i) + (xs(i)^2 + xs(i)*xs(i-1) + xs(i-1)^2)/3 - xs(i-1)*(xs(i)+xs(i-1))/2)/(xs(i)-xs(i-1)); 
        B(i, i-1) = (-1 - xs(i)*(xs(i)+xs(i-1))/2 + xs(i)*xs(i-1) + (xs(i)^2 + xs(i)*xs(i-1) + xs(i-1)^2)/3 - xs(i-1)*(xs(i)+xs(i-1))/2)/(xs(i)-xs(i-1)); 
    end
end

y = B\L;
plot(xs, y);
hold on
%plot(xs, sn);
hold off
end

