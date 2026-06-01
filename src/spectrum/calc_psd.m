function [f, psd] = calc_psd(x, fs)
%CALC_PSD Calculate a simple single-sided PSD estimate.
%
% Purpose:
%   Calculate a simple FFT-based periodogram estimate of the single-sided
%   power spectral density.
%
% Syntax:
%   [f, psd] = calc_psd(x, fs)
%
% Inputs:
%   x  - Numeric response vector.
%   fs - Sampling frequency in Hz.
%
% Outputs:
%   f   - Frequency vector in Hz.
%   psd - Single-sided PSD estimate with units consistent with x^2/Hz.
%
% Example:
%   [f, psd] = calc_psd(acceleration, 100);
%
% Notes:
%   The mean is removed before calculation. This is a simple periodogram
%   estimate, not Welch averaging. The two-sided PSD is calculated as
%   abs(fft(x)).^2 / (fs * N), then converted to a single-sided estimate by
%   doubling non-DC interior bins. For even N, the Nyquist bin is not
%   doubled.

    if nargin ~= 2
        error('calc_psd requires exactly two input arguments.');
    end

    if ~isnumeric(x) || isempty(x) || ~isvector(x)
        error('x must be a nonempty numeric vector.');
    end

    if ~isnumeric(fs) || ~isscalar(fs) || fs <= 0
        error('fs must be a positive scalar sampling frequency in Hz.');
    end

    x = x(:);
    x = x - mean(x);
    n = length(x);

    spectrum = fft(x);
    two_sided_psd = (abs(spectrum).^2) / (fs * n);

    if rem(n, 2) == 0
        idx_last = n / 2 + 1;
        psd = two_sided_psd(1:idx_last);
        if idx_last > 2
            psd(2:end-1) = 2 * psd(2:end-1);
        end
        f = fs * (0:(n / 2))' / n;
    else
        idx_last = (n + 1) / 2;
        psd = two_sided_psd(1:idx_last);
        if idx_last > 1
            psd(2:end) = 2 * psd(2:end);
        end
        f = fs * (0:((n - 1) / 2))' / n;
    end
end
