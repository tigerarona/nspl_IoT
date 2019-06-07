function [ y ] = z_mahala(x, mu_, cov_)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
if size(x,1) == 1
    x = x';
end
if size(mu_,1) == 1
    mu_ = mu_';
end
xTemp = x-mu_;
if rank(cov_) ~= size(cov_,1);
    xTemp2 = pinv(cov_);
else
    xTemp2 = inv(cov_);
end
yTemp = xTemp'*xTemp2*xTemp;
y = z_sqrt(yTemp,5);
end

