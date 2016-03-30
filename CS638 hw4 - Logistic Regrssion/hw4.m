


clear ; close all; clc

data = load('hwk4_data1.txt');

X = data(:, [1, 2]); % X is a #OfExamScores x 2 matrix
y = data(:, 3);      % y is a #OfExamScores x 1 matrix

%  It's always a good idea to first plot the problem to solve
fprintf(['Plotting data with + indicating (y = 1) examples and o ' ...
         'indicating (y = 0) examples.\n']);
         X(:,1)=(X(:,1)./(max(X(:,1))));
X(:,2)=(X(:,2)./(max(X(:,2))));
graph(X, y);



m = length(y); 


X = [ones(m, 1), X]; 
theta = zeros(3, 1); 


it = 25000;
alpha = 0.2;




J=lrCostFunction(theta,X,y);

% run gradient descent
[theta,J_Array] = gradientDescent(X, y, theta, alpha, it);

% print theta to screen
fprintf('Values of Theta0 and Theta1 and Theta2 found by using gradient descent: ');
fprintf('%f %f %f\n', theta(1), theta(2),theta(3));




graph(X(:,2:3), y);
hold on


    
   plot_x = [min(X(:,2))-2,  max(X(:,2))+2];

        plot_y = (-1./theta(3)).*(theta(2).*plot_x + theta(1));    plot(plot_x, plot_y)
        legend('Admitted', 'Not admitted', 'Decision Boundary')
    axis([0, 1, 0, 1])



prob = sigmoid([1 1 0.5] * theta);
fprintf(['For a student with scores 100 and 50, we predict an admission ' ...
         'probability of %f\n\n'], prob);


    
hold off;

fprintf('-----------------------------------------------------------\n');


data2=load('hwk4_data2.txt');


X2 = data2(:, [1, 2]); % X is a #OfExamScores x 2 matrix
y2 = data2(:, 3);      % y is a #OfExamScores x 1 matrix


fprintf(['Plotting data with + indicating (y = 1) examples and o ' ...
         'indicating (y = 0) examples.\n']);

           X2(:,1)=(X2(:,1)./(max(X2(:,1))));
X2(:,2)=(X2(:,2)./(max(X2(:,2))));
         graph(X2, y2);




Xold=X2;
Yold=y2;

m = length(y2); 

X2=mapFeature(X2(:,1),X2(:,2));

X2 = [ones(m, 1), X2]; 
theta2 = zeros(size(X2,2), 1); 



it = 20000;
alpha = 0.01;
lambda=1;



J=lrCostFunctionReg(theta2,X2,y2,lambda);

% run gradient descent
[theta2,J_Array] = gradientDescentReg(X2, y2, theta2, alpha, it,lambda);

graph(Xold,Yold);
hold on;
   u = linspace(-1, 1.5, 50);
    v = linspace(-1, 1.5, 50);

    z = zeros(length(u), length(v));
 
    for i = 1:length(u)
        for j = 1:length(v)
            z(i,j) = mapFeature(u(i), v(j))*theta2(2:end);
        end
    end
    z = z'; 
    contour(u, v, z, [0, 0], 'LineWidth', 2)

hold off;

for i=1:length(theta2)
fprintf('%f ',theta2(i));
end







