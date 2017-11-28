%This function sets up the initial neighbors of the Considered list
%The value of -2 denotes that it is being considered
%This function considers the boundaries as well
function L = neighbors(V, L, U, i, j)

    if i == 1 & j == 1
        if U(i, j + 1) == 1
        else
            L(i, j + 1) = -2;
        end
        
        if U(i + 1, j) == 1
        else
            L(i + 1, j) = -2;
        end
    elseif i == 1 & j == size(V)
        if U(i, j - 1) == 1
        else
            L(i, j - 1) = -2;
        end
        
        if U(i + 1, j) == 1
        else
            L(i + 1, j) = -2;
        end
    elseif i == size(V) & j == 1
        if U(i, j + 1) == 1
        else
            L(i, j + 1) = -2;
        end
        
        if U(i - 1, j) == 1
        else
            L(i - 1, j) = -2;
        end
    elseif i == size(V) & j == size(V)
        if U(i, j - 1) == 1
        else
            L(i, j - 1) = -2;
        end
        
        if U(i - 1, j)
        else
            L(i - 1, j) = -2;
        end
    elseif i == 1
        if U(i, j - 1) == 1
        else
            L(i, j - 1) = -2;
        end
         
        if U(i, j + 1) == 1
        else
            L(i, j + 1) = -2;
        end
        
        if U(i + 1, j) == 1
        else
            L(i + 1, j) = -2;
        end
    elseif i == size(V)
        if U(i, j - 1) == 1
        else
            L(i, j - 1) = -2;
        end
        
        if U(i, j + 1) == 1
        else
            L(i, j + 1) = -2;
        end
        
        if U(i - 1, j) == 1
        else
            L(i - 1, j) = -2;
        end
    elseif j == 1
        if U(i, j + 1) == 1
        else
            L(i, j + 1) = -2;
        end
        
        if U(i - 1, j) == 1
        else
            L(i - 1, j) = -2; 
        end
        
        if U(i + 1, j) == 1
        else
            L(i + 1, j) = -2;
        end
    elseif j == size(V)
        if U(i + 1, j) == 1
        else
            L(i + 1, j) = -2;
        end
        
        if U(i - 1, j) == 1
        else  
            L(i - 1, j) = -2;
        end
        
        if U(i, j - 1) == 1
        else
            L(i, j - 1) = -2;
        end
    else
       
        if U(i - 1, j) == 1
        else
            L(i - 1, j) = -2;
        end
        
        if U(i + 1, j) == 1
        else
            L(i + 1, j) = -2;
        end
        
        if U(i, j - 1) == 1
        else
            L(i, j - 1) = -2;
        end
        
        if U(i, j + 1) == 1
        else
            L(i, j + 1) = -2;
        end
    end
end

