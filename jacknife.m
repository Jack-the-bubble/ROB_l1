function ercf = jacknife(ts)
%leave out test of cls1nn classifier on ts
% ts - training set (first column contains labels
% ercf - error coefficient of cls1nn on ts
	clsres = zeros(rows(ts), 1);
for i = 1: rows(clsres)
	x = ts(i, 2:end);
	pom = [ts(1:i-1, :);ts(i+1:end, :)];
	[~, a]=min(sumsq(pom(:, 2:end)-repmat(x, rows(pom), 1), 2));
	clsres(i)=pom(a);

%%drugie roz
%	tscpy = [ts(ts(1:i-1, :) ts(i+1:end, :)];
%	clsres(i) = cls1nn(tscpy, ts(i, 2:end));
%%ver 3
%	tscpy =ts([1:i-1 i+1:end], :);
%	clsres(i) = cls1nn(tscpy, ts(i, 2:end));

%%ver 4
%	tscpy = ts(1:end ~= i, :);
%	clsres(i) = cls1nn(tscpy, ts(i, 2:end));

end


	ercf = sum(clsres ~= ts(:, 1))/rows(ts);
%to samo
	ercf = mean(clsres ~= ts(:, 1))


