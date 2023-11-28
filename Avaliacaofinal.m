% Interpolation using Lagrange method
x_value = 2.5;
% Example usage:
points = [1, 2; 2, 3; 3, 5; 4, 7];

function result = lagrange_interpolation(x, points)
    % Calculate the Lagrange interpolation for a given x and set of points.

    n = length(points);
    result = 0;

    for i = 1:n
        term = points(i, 2);
        for j = 1:n
            if j != i
                term = term * (x - points(j, 1)) / (points(i, 1) - points(j, 1));
            end
        end
        result = result + term;
    end
end

lagrange_result = lagrange_interpolation(x_value, points);
fprintf('Lagrange Interpolation at x=%f: %f\n', x_value, lagrange_result);

function [result, error_estimate] = newton_interpolation(x, points)
    % Calculate the Newton interpolation for a given x and set of points.
    % Also estimates the error using the divided difference table.

    n = length(points);
    f = zeros(n, n);

    for i = 1:n
        f(i, 1) = points(i, 2);
    end

    for j = 2:n
        for i = 1:n - j + 1
            f(i, j) = (f(i + 1, j - 1) - f(i, j - 1)) / (points(i + j - 1, 1) - points(i, 1));
        end
    end

    result = f(1, 1);
    term = 1;

    for i = 2:n
        term = term * (x - points(i - 1, 1));
        result = result + term * f(1, i);
    end

    % Estimate the error using the last term in the last column of the divided difference table
    error_estimate = term * f(1, end);
end





% Interpolation using Newton method
[newton_result, error_estimate] = newton_interpolation(x_value, points);
fprintf('Newton Interpolation at x=%f: %f\n', x_value, newton_result);
fprintf('Error Estimate: %f\n', error_estimate);

