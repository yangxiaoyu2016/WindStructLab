function stats = calc_basic_stats(x)
%CALC_BASIC_STATS Calculate basic response statistics for a vector.
%
% Purpose:
%   Calculate common scalar statistics for a response vector.
%
% Syntax:
%   stats = calc_basic_stats(x)
%
% Inputs:
%   x - Numeric vector.
%
% Outputs:
%   stats - Structure with fields:
%           mean, std, rms, max, min, abs_max, skewness, peak_factor.
%
% Example:
%   stats = calc_basic_stats(displacement);
%   fprintf('RMS = %.6g\n', stats.rms);
%
% Notes:
%   rms = sqrt(mean(x.^2)).
%   skewness = mean((x - mean(x)).^3) / std(x)^3.
%   If the standard deviation is zero, skewness is returned as zero.
%   If RMS is zero, peak_factor is returned as NaN.

    if nargin ~= 1
        error('calc_basic_stats requires exactly one input argument.');
    end

    if ~isnumeric(x) || isempty(x) || ~isvector(x)
        error('x must be a nonempty numeric vector.');
    end

    x = x(:);
    n = length(x);

    stats.mean = mean(x);

    if n > 1
        stats.std = sqrt(sum((x - stats.mean).^2) / (n - 1));
    else
        stats.std = 0;
    end

    stats.rms = sqrt(mean(x.^2));
    stats.max = max(x);
    stats.min = min(x);
    stats.abs_max = max(abs(x));

    if stats.std == 0
        stats.skewness = 0;
    else
        stats.skewness = mean((x - stats.mean).^3) / (stats.std^3);
    end

    if stats.rms == 0
        stats.peak_factor = NaN;
    else
        stats.peak_factor = stats.abs_max / stats.rms;
    end
end
