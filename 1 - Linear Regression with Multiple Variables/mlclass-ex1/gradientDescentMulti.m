function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
n = size(X, 2);
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %
    
    sums = zeros(1, n);
    
    for i = 1:m
        commo = 0;
        for j = 1:n
            commo = commo + theta(j)*X(i,j);
        end
        h0 = commo - y(i);
        for k = 1:n
           sums(k) = sums(k) + (h0 * X(i,k)); 
        end
        
    end
    for l = 1:n
       theta(l) = theta(l) - (alpha * sums(l) / m);
    end

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
