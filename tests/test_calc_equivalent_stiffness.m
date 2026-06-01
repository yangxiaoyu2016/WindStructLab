%TEST_CALC_EQUIVALENT_STIFFNESS Test calc_equivalent_stiffness.

tol = 1e-12;

displacement = [-1; 0; 1];
force = [-2; 0; 2];

keq = calc_equivalent_stiffness(displacement, force);
assert(abs(keq - 2) < tol);

did_error = false;
try
    calc_equivalent_stiffness([1; 1; 1], force);
catch
    did_error = true;
end
assert(did_error);
