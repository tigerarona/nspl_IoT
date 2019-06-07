function [Y] = z_filter(b,a,x)
state = zeros(size(b));
y = zeros(size(x));
for i= numel(b):size(x,1)
    input = 0;
    for j = 1:numel(b)
        input = input + b(j) * x(i-j+1);
        y(i) = y(i) - a(j) * state(j);
    end
    
    for idx = numel(b): -1 : 1
        if idx > 2
            state(idx) = state(idx-1);
        elseif idx == 2
            state(idx) = y(i);
        elseif idx == 1
            state(idx) = input;
        end
    end
end
Y = y;
end