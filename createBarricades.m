%This function creates boundaries around the outside of the graph only
function [U, V] = createBarricades(U, V)

for j = 1
    for i=1:size(U)
        U(i, j) = 1;
    end
end

for j = size(U)
    for i=1:size(U)
        U(i, j) = 1;
    end
end

for i = 1
    for j=1:size(U)
        U(i, j) = 1;
    end
end

for i = size(U)
    for j=1:size(U)
        U(i, j) = 1;
    end
end


end

