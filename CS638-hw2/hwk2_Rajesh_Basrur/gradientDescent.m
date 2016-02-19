function [theta, J_Array] = gradientDescent(X, y, theta, alpha, noi)
m = length(y); % number of training examples
J_Array = zeros(noi, 1);

for iters = 1:noi
xt=X*theta;
hyp=(xt-y)';
t1=theta(1)-alpha*(1/m)*hyp*X(:,1);
t2=theta(2)-alpha*(1/m)*hyp*X(:,2);
theta(1)=t1;
theta(2)=t2;   %   Here we simultaneously update Theta0 and Theta1
J_Array(iters) = costFunction(X, y, theta);
end


end
