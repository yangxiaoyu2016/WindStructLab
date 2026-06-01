%TEST_CALC_EQUIVALENT_DAMPING Test calc_equivalent_damping.

theta = linspace(0, 2 * pi, 401)';
displacement = sin(theta);
force = 10 * sin(theta) + 2 * cos(theta);

heq = calc_equivalent_damping(displacement, force);

assert(heq > 0);
assert(heq < 0.2);

did_error = false;
try
    calc_equivalent_damping([0; 0; 0], [0; 0; 0]);
catch
    did_error = true;
end
assert(did_error);
