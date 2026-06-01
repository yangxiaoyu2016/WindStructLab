function h = plot_time_history(time, response, y_label_text)
%PLOT_TIME_HISTORY Plot time-history response data.
%
% Purpose:
%   Plot response values against time.
%
% Syntax:
%   h = plot_time_history(time, response, y_label_text)
%
% Inputs:
%   time         - Time vector in seconds.
%   response     - Response vector.
%   y_label_text - Text for the y-axis label.
%
% Outputs:
%   h - Plot handle.
%
% Example:
%   h = plot_time_history(time, displacement, 'Displacement (m)');
%
% Notes:
%   The x-axis is labeled as Time (s). Units for the response should be
%   included in y_label_text when known.

    if nargin ~= 3
        error('plot_time_history requires exactly three input arguments.');
    end

    if ~isnumeric(time) || ~isvector(time) || isempty(time)
        error('time must be a nonempty numeric vector.');
    end

    if ~isnumeric(response) || ~isvector(response) || isempty(response)
        error('response must be a nonempty numeric vector.');
    end

    if length(time) ~= length(response)
        error('time and response must have the same length.');
    end

    if ~ischar(y_label_text)
        error('y_label_text must be a character array.');
    end

    figure;
    h = plot(time, response, 'b-');
    xlabel('Time (s)');
    ylabel(y_label_text);
    grid on;
end
