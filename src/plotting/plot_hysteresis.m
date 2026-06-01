function h = plot_hysteresis(displacement, force)
%PLOT_HYSTERESIS Plot a force-displacement hysteresis curve.
%
% Purpose:
%   Plot force against displacement for a hysteresis loop.
%
% Syntax:
%   h = plot_hysteresis(displacement, force)
%
% Inputs:
%   displacement - Displacement vector.
%   force        - Force vector.
%
% Outputs:
%   h - Plot handle.
%
% Example:
%   h = plot_hysteresis(displacement, force);
%
% Notes:
%   Displacement is plotted on the x-axis and force on the y-axis. Include
%   units in surrounding documentation or figure captions when used in a
%   report.

    if nargin ~= 2
        error('plot_hysteresis requires exactly two input arguments.');
    end

    if ~isnumeric(displacement) || ~isvector(displacement) || isempty(displacement)
        error('displacement must be a nonempty numeric vector.');
    end

    if ~isnumeric(force) || ~isvector(force) || isempty(force)
        error('force must be a nonempty numeric vector.');
    end

    if length(displacement) ~= length(force)
        error('displacement and force must have the same length.');
    end

    figure;
    h = plot(displacement, force, 'r-');
    xlabel('Displacement');
    ylabel('Force');
    grid on;
end
