function ercf = jacknife(ts)
%leave out test of cls1nn classifier on ts
% ts - training set (first column contains labels
% ercf - error coefficient of cls1nn on ts

	ercf = 0.5
