function Y = z_weight_mean(X,win_,noverlap,beta)
if size(X,1)==1;
    X = X';
end
X(isnan(X)) = 0;
res_ = win_-noverlap;
count = 1+noverlap;
for idxW = 1:res_:numel(X)-win_+1   
    xtmp = X(idxW:idxW+win_-1);
    if idxW == 1;
        Y(count,1) = beta*0+(1-beta)*xtmp(end);
    else
        Y(count,1) = beta*Y(count-1,1)+(1-beta)*xtmp(end);
    end
    count = count + 1;
end
end