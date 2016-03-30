function J= lrCostFunction(theta, X, y)

m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;





%Qx= X * theta;
%h = sigmoid(Qx);


%y_one= -y'*log(h);
%y_zero= (1-y)'*log(1-h);
%J = (1/m)*(y_one - y_zero);

%J = 1./m * ( -y' * log( sigmoid(X * theta) ) - ( 1 - y' ) * log ( 1 - sigmoid( X * theta)) );

%grad = (1/m)*(X'*(h-y);



hyp=sigmoid(X*theta);
pn=y.*log(hyp)+(1-y).*log(1-hyp);
J=-1/m*sum(pn);




% =============================================================

%grad = grad(:);

end
