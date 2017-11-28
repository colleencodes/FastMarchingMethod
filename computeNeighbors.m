%This function determins which direction should be computed given
%boundary conditions
function [U_E U_W U_N U_S] = computeNeighbors(i, j, V, h, F, sN)

%j + 1 = U_S;
%j - 1 = U_N;
%i + 1 = U_E;
%i - 1 = U_W;

%This if statement looks at all the boundary conditions to determine
%which directions should be computed
    if i == 1 & j == 1
        U_S = upwindDiscretization(V, i, j + 1, h, F, sN);
        U_E = upwindDiscretization(V, i + 1, j, h, F, sN);
        
        U_N = inf;
        U_W = inf;
    elseif i == 1 & j == size(V)
        U_N = upwindDiscretization(V, i, j - 1, h, F, sN);
        U_E = upwindDiscretization(V, i + 1, j, h, F, sN);
        
        U_S = inf;
        U_W = inf;
    elseif i == size(V) & j == 1
        U_S = upwindDiscretization(V, i, j + 1, h, F, sN);
        U_W = upwindDiscretization(V, i - 1, j, h, F, sN);
        
        U_N = inf;
        U_E = inf;
    elseif i == size(V) & j == size(V)
        U_N = upwindDiscretization(V, i, j - 1, h, F, sN);
        U_W = upwindDiscretization(V, i - 1, j, h, F, sN);
        
        U_S = inf;
        U_E = inf;
    elseif i == 1
        U_N = upwindDiscretization(V, i, j - 1, h, F, sN);
        U_S = upwindDiscretization(V, i, j + 1, h, F, sN);
        U_E = upwindDiscretization(V, i + 1, j, h, F, sN);
        
        U_W = inf;
    elseif i == size(V)
        U_N = upwindDiscretization(V, i, j - 1, h, F, sN);
        U_S = upwindDiscretization(V, i, j + 1, h, F, sN);
        U_W = upwindDiscretization(V, i - 1, j, h, F, sN);
        
        U_E = inf;
    elseif j == 1
        U_S = upwindDiscretization(V, i, j + 1, h, F, sN);
        U_W = upwindDiscretization(V, i - 1, j, h, F, sN);
        U_E = upwindDiscretization(V, i + 1, j, h, F, sN);
        
        U_N = inf;
    elseif j == size(V)
        U_E = upwindDiscretization(V, i + 1, j, h, F, sN);
        U_W = upwindDiscretization(V, i - 1, j, h, F, sN);
        U_N = upwindDiscretization(V, i, j - 1, h, F, sN);
        
        U_S = inf;
    else
        U_W = upwindDiscretization(V, i - 1, j, h, F, sN);
        U_E = upwindDiscretization(V, i + 1, j, h, F, sN);
        U_N = upwindDiscretization(V, i, j - 1, h, F, sN);
        U_S = upwindDiscretization(V, i, j + 1, h, F, sN);
    end


end

