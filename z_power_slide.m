function Y = z_power_slide(X,win_,noverlap)
if size(X,1)==1;
    X = X';
end
res_ = win_-noverlap;
count = 1+noverlap;
% selection_ = 0.35*win_;
for idxW = 1:res_:numel(X)-win_+1   
    xtmp = X(idxW:idxW+win_-1);
    ptmp = xtmp.^2;
%     ptmp = abs(xtmp);
    Y(count,1) = mean(ptmp);
%     ptmp2 = sort(ptmp);
%     if mod(selection_,1) == 0;
%         Y(count,1) = mean([ptmp2(selection_) ptmp2(selection_+1)]);
%     else
%         Y(count,1) = ptmp2(ceil(selection_));
%     end
    count = count + 1;
end
Y(1:noverlap,1) = 0;
end