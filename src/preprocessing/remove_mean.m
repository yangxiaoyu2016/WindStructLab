function [y, mean_value] = remove_mean(x)
%REMOVE_MEAN Remove the mean from a vector or matrix.
%
% Purpose:
%   Remove the mean value from a vector or from each column of a matrix.
%
% Syntax:
%   [y, mean_value] = remove_mean(x)
%
% Inputs:
%   x - Numeric vector or matrix.
%
% Outputs:
%   y          - Mean-removed data with the same size as x.
%   mean_value - Removed mean value. For matrices, this is one value per
%                column.
%
% Example:
%   [x_zero_mean, x_mean] = remove_mean([1; 2; 3]);
%
% Notes:
%   No values are ignored. Missing values should be cleaned before calling
%   this function.

    if nargin ~= 1
        error('remove_mean requires exactly one input argument.');
    end

    if ~isnumeric(x) || isempty(x)
        error('x must be a nonempty numeric vector or matrix.');
    end

    if isvector(x)
        mean_value = mean(x(:));
        y = x - mean_value;
    else
        mean_value = mean(x, 1);
        y = bsxfun(@minus, x, mean_value);
    end
end
