function phi=transformFeatures(X1,X2)
    degree = 6;
    phi = ones(size(X1(:,1)));
    %For each order of the polynom
    for i = 1:degree
        %Compute the corresponding powers of the features
        for j = 0:i
            phi(:, end+1) = (X1.^(i-j)).*(X2.^j);
        end
    end
end