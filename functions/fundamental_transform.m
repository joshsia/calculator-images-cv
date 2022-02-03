function y = fundamental_transform(x, f)
    for i = 1:length(x)
    A = [x(i,1) x(i,2) 1]*f';
    y(i,:) = linsolve(A,0)';
    end
end