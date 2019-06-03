function Y = z_linelength(X,win_,noverlap)
if size(X,1)==1;
    X = X';
end
res_ = win_-noverlap;
count = 1+noverlap;
for idxW = 1:res_:numel(X)-win_+1
    ltmp = X(idxW:idxW+win_-1);
    ltmp2 = abs(diff(ltmp));
    Y(count,1) = sum(ltmp2);
    count = count+1;
end
Y(1:noverlap,1) = 0;
end