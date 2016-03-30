function J = costFunction(X, y, theta)
m = length(y); % number of training examples
J = 0;
errors=(X*theta)-y;
J=(1/(2*m))*errors' * errors;
end
