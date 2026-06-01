function heq = calc_equivalent_damping(displacement, force)
%CALC_EQUIVALENT_DAMPING Estimate equivalent viscous damping ratio.
%
% Purpose:
%   Estimate the equivalent viscous damping ratio from one stable
%   force-displacement hysteresis loop.
%
% Syntax:
%   heq = calc_equivalent_damping(displacement, force)
%
% Inputs:
%   displacement - Displacement vector for one hysteresis loop.
%   force        - Force vector for one hysteresis loop.
%
% Outputs:
%   heq - Equivalent damping ratio.
%
% Example:
%   heq = calc_equivalent_damping(displacement, force);
%
% Notes:
%   This function assumes the input represents one stable hysteresis loop.
%   The loop is closed automatically if the first and last points are not
%   the same. The dissipated energy is estimated as:
%
%       Ed = abs(trapz(displacement_closed, force_closed))
%
%   The elastic strain energy approximation is:
%
%       Es = 0.5 * Fmax_abs * Dmax_abs
%
%   The equivalent damping ratio is:
%
%       heq = Ed / (4 * pi * Es)
%
%   Units must be consistent. The ratio is dimensionless.

    if nargin ~= 2
        error('calc_equivalent_damping requires exactly two input arguments.');
    end

    if ~isnumeric(displacement) || ~isvector(displacement) || isempty(displacement)
        error('displacement must be a nonempty numeric vector.');
    end

    if ~isnumeric(force) || ~isvector(force) || isempty(force)
        error('force must be a nonempty numeric vector.');
    end

    displacement = displacement(:);
    force = force(:);

    if length(displacement) ~= length(force)
        error('displacement and force must have the same length.');
    end

    if length(displacement) < 3
        error('At least three points are required to describe a loop.');
    end

    displacement_closed = displacement;
    force_closed = force;

    if displacement_closed(1) ~= displacement_closed(end) || force_closed(1) ~= force_closed(end)
        displacement_closed(end + 1) = displacement_closed(1);
        force_closed(end + 1) = force_closed(1);
    end

    ed = abs(trapz(displacement_closed, force_closed));
    fmax_abs = max(abs(force));
    dmax_abs = max(abs(displacement));
    es = 0.5 * fmax_abs * dmax_abs;

    denominator = 4 * pi * es;
    if denominator == 0
        error('Equivalent damping denominator is zero.');
    end

    heq = ed / denominator;
end
