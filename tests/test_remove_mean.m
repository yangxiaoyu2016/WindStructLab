%TEST_REMOVE_MEAN Test remove_mean.

tol = 1e-12;

x = [1; 2; 3];
[y, mean_value] = remove_mean(x);
assert(abs(mean_value - 2) < tol);
assert(max(abs(y - [-1; 0; 1])) < tol);

x_matrix = [1 2; 3 4; 5 6];
[y_matrix, mean_values] = remove_mean(x_matrix);
assert(max(abs(mean_values - [3 4])) < tol);
assert(max(abs(mean(y_matrix, 1))) < tol);
