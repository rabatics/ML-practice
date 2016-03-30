function [theta, J_Array] = gradientDescentReg(X, y, theta, alpha, noi,lambda)
m = length(y); % number of training examples
J_Array = zeros(noi, 1);
N=(1:noi);
regterm=1-(alpha*(lambda/m));
for iters = 1:noi

hyp=(sigmoid(X*theta)-y)';

for i=1:length(theta)

t1(i)=(theta(i)*regterm)-alpha*(1/m)*hyp*X(:,i);
end

theta=t1;
theta=theta';
  %   Here we simultaneously update Theta0 and Theta1
J_Array(iters) = lrCostFunctionReg(theta,X,y,lambda);
end
figure;
plot(N,J_Array,'-');


end
