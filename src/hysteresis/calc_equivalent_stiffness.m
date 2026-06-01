function keq = calc_equivalent_stiffness(displacement, force)
%CALC_EQUIVALENT_STIFFNESS Estimate equivalent stiffness.
%
% Purpose:
%   Estimate equivalent stiffness from force-displacement data using a
%   simple secant stiffness definition.
%
% Syntax:
%   keq = calc_equivalent_stiffness(displacement, force)
%
% Inputs:
%   displacement - Displacement vector.
%   force        - Force vector.
%
% Outputs:
%   keq - Equivalent stiffness.
%
% Example:
%   keq = calc_equivalent_stiffness(displacement, force);
%
% Notes:
%   keq = (max(force) - min(force)) / (max(displacement) - min(displacement)).
%   If force is N and displacement is m, keq is N/m.
%   If force is kN and displacement is mm, keq is kN/mm.
%   This is a simple secant stiffness estimate.

    if nargin ~= 2
        error('calc_equivalent_stiffness requires exactly two input arguments.');
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

    displacement_range = max(displacement) - min(displacement);
    if displacement_range == 0
        error('Displacement range must be nonzero.');
    end

    force_range = max(force) - min(force);
    keq = force_range / displacement_range;
end
