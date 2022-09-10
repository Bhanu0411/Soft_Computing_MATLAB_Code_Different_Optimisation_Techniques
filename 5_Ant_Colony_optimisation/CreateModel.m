function model = CreateModel()

    x = [82 15 18 ]
    y = [66 3 85 ]
    n = numel(x)    
    D = zeros(n, n)    
    for i = 1:n-1
        for j = i+1:n
            D(i, j) = sqrt((x(i)-x(j))^2+(y(i)-y(j))^2)
            D(j, i) = D(i, j)            
        end
    end    
    model.n = n
    model.x = x
    model.y = y
    model.D = D
end