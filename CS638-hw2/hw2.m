


clear ; close all; clc




fprintf('Plotting Data from hwk2data :\n')
data = load('hwk2data.txt');
X = data(:, 1); y = data(:, 2);
m = length(y); 
graph(X, y);
fprintf('Using Gradient Descent:\n')
fprintf('Alpha = 0.02\n');
X = [ones(m, 1), data(:,1)]; 
theta = zeros(2, 1); 


it = 1500;
alpha = 0.02;


J=costFunction(X, y, theta)

% run gradient descent
theta = gradientDescent(X, y, theta, alpha, it);

% print theta to screen
fprintf('Values of Theta0 and Theta1 found by using gradient descent: ');
fprintf('%f %f \n', theta(1), theta(2));


hold on; % keep previous plot visible
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure
popboston=6.45;
profitbos=theta(1)+(popboston*theta(2));
fprintf('Profit for Population: ');
fprintf('%f \n',profitbos);
fprintf('-----------------------------------------------------------\n');

fprintf('Alpha = 0.002\n');
theta = zeros(2, 1); 


it = 1500;
alpha = 0.002;


J=costFunction(X, y, theta)

% run gradient descent
theta = gradientDescent(X, y, theta, alpha, it);

% print theta to screen
fprintf('Values of Theta0 and Theta1 found by using gradient descent: ');
fprintf('%f %f \n', theta(1), theta(2));



popboston=6.45;
profitbos=theta(1)+(popboston*theta(2));
fprintf('Profit for Population: ');
fprintf('%f \n',profitbos);

fprintf('-----------------------------------------------------------\n');

fprintf('Alpha = 0.0001\n');
theta = zeros(2, 1); 


it = 1500;
alpha = 0.0001;


J=costFunction(X, y, theta)

% run gradient descent
theta = gradientDescent(X, y, theta, alpha, it);

% print theta to screen
fprintf('Values of Theta0 and Theta1 found by using gradient descent: ');
fprintf('%f %f \n', theta(1), theta(2));


popboston=6.45;
profitbos=theta(1)+(popboston*theta(2));
fprintf('Profit for Population: ');
fprintf('%f \n',profitbos);

fprintf('The trendline in the figure is for Alpha=0.02 which best fits the dataset. ');

