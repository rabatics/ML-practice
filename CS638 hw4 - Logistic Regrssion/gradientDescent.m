function [theta, J_Array] = gradientDescent(X, y, theta, alpha, noi)
m = length(y); % number of training examples
J_Array = zeros(noi, 1);
N=(1:noi);

for iters = 1:noi

hyp=(sigmoid(X*theta)-y)';

t1=theta(1)-alpha*(1/m)*hyp*X(:,1);
t2=theta(2)-alpha*(1/m)*hyp*X(:,2);
t3=theta(3)-alpha*(1/m)*hyp*X(:,3);

theta(1)=t1;
theta(2)=t2;
theta(3)=t3;   %   Here we simultaneously update Theta0 and Theta1
J_Array(iters) = lrCostFunction(theta,X,y);
end
figure;
plot(N,J_Array,'-');


end
