%This function sets up barricades to make a spiral
function [U, V] = createSpiralBarricades(U, V)

%Run on a 40 x 40

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

for i=5
    for j=1:36
        U(i, j) = 1;
    end
end

for j=36
    for i=5:36
        U(i, j) = 1;
    end
end

for i=36
    for j=5:36
        U(i, j) = 1;
    end
end

for j=5
    for i=9:36
        U(i, j) = 1;
    end
end

for i=9
    for j=5:32
        U(i, j) = 1;
    end
end

for j=32
    for i=9:32
        U(i, j) = 1;
    end
end

for i=32
    for j=9:32
        U(i, j) = 1;
    end
end

for j=9
    for i=13:32
        U(i, j) = 1;
    end
end

for i=13
    for j=9:28
        U(i, j) = 1;
    end
end

for j=28
    for i=13:28
        U(i, j) = 1;
    end
end

for i=28
    for j=13:28
        U(i, j) = 1;
    end
end

for j=13
    for i=17:28
        U(i, j) = 1;
    end
end

for i=17
    for j=13:24
        U(i, j) = 1;
    end
end

for j=24
    for i=17:25
        U(i, j) = 1;
    end
end

for i=25
    for j=17:24
        U(i, j) = 1;
    end
end

for j=17
    for i=20:24
        U(i, j) = 1;
    end
end

for i=20
    for j=17:20
        U(i, j) = 1;
    end
end
end

