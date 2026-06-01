function [f, amp] = calc_fft_spectrum(x, fs)
%CALC_FFT_SPECTRUM Calculate a single-sided FFT amplitude spectrum.
%
% Purpose:
%   Calculate the single-sided amplitude spectrum of a response vector.
%
% Syntax:
%   [f, amp] = calc_fft_spectrum(x, fs)
%
% Inputs:
%   x  - Numeric response vector.
%   fs - Sampling frequency in Hz.
%
% Outputs:
%   f   - Frequency vector in Hz.
%   amp - Single-sided amplitude spectrum.
%
% Example:
%   [f, amp] = calc_fft_spectrum(displacement, 100);
%
% Notes:
%   The mean is removed before the FFT. The two-sided FFT amplitude is
%   scaled by 1/N. For the single-sided spectrum, non-DC interior bins are
%   doubled. For even N, the Nyquist bin is not doubled.

    if nargin ~= 2
        error('calc_fft_spectrum requires exactly two input arguments.');
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
    two_sided_amp = abs(spectrum) / n;

    if rem(n, 2) == 0
        idx_last = n / 2 + 1;
        amp = two_sided_amp(1:idx_last);
        if idx_last > 2
            amp(2:end-1) = 2 * amp(2:end-1);
        end
        f = fs * (0:(n / 2))' / n;
    else
        idx_last = (n + 1) / 2;
        amp = two_sided_amp(1:idx_last);
        if idx_last > 1
            amp(2:end) = 2 * amp(2:end);
        end
        f = fs * (0:((n - 1) / 2))' / n;
    end
end
